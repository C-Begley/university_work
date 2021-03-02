{-# LANGUAGE OverloadedStrings #-}

module WikiScrapeLib
    (  mostfrequentwordonpage
    ) where

import Text.HTML.Scalpel
import Data.Typeable
import Data.List
import Data.Char
import qualified Data.Map as M

mostfrequentwordonpage :: URL -> IO(Maybe String)
mostfrequentwordonpage page = do
  res <- scrapeURL page scrapeBody
  print res
  stop_words <- readFile "../stopwords.txt"
  title <- get_country_code page
  let
     word_res = fmap concat $ fmap (fmap  words) res
     lower_res = fmap (fmap (map Data.Char.toLower)) word_res
     filt_res = filter_words lower_res stop_words title 
     mostFreq = getMostFreq filt_res
  return mostFreq

scrapeBody :: Scraper String [String]
--scrapeBody = chroot("div" @: ["id" @= "mw-content-text"]) scrapeParagraphs
scrapeBody = chroot("div" @: ["id" @= "mw-content-text"]) scrapeParagraphs
--scrapeBody = chroot("body") scrapeParagraphs
scrapeParagraphs :: Scraper String [String]
scrapeParagraphs = do 
  str <- texts "p"
  return str

scrapeTitle :: Scraper String String
scrapeTitle = chroot("h1" @: ["id" @= "firstHeading"]) scrapeHeader

scrapeHeader :: Scraper String String
scrapeHeader = do 
  str <- text "h1"
  return str

filter_words :: Maybe [String] -> String ->Maybe String ->  Maybe [String]
filter_words wrds fil title= let 
  fil_stop    = fmap (filter (\w -> w `notElem` words (fil))) wrds
  fil_country = fmap (filter(\w -> (fmap (flip Data.List.isInfixOf w) title) == (Just False))) fil_stop
  fil_punc    = fmap (map (filter (\c -> ((not(Data.Char.isPunctuation c)) || (c =='\''))))) fil_country
  fil_apos    = fmap (map (\s -> if isInfixOf "'s" s then (take(length(s)-2) s) else s)) fil_punc
  fil_num     = fmap (filter (\s -> foldl (&&) True $ map Data.Char.isAlpha s)) fil_apos
  fil_single  = fmap (filter (\w -> length(w) > 1)) fil_num
  in fil_single  

get_country_code :: String -> IO (Maybe String)
{-get_country_code page = do 
   let
     prefix = "https://en.wikipedia.org/wiki/"
     chars = 4
     start = 30
     --start = length(prefix)
     x = take chars $ drop start $ page
     title = map (\c -> Data.Char.toLower c) x
   return title 
-}
get_country_code page = do 
  res <- scrapeURL page scrapeTitle
  let 
    title =if fmap length res <= (Just 4) then res else fmap (take 4) res
    code = fmap (map (Data.Char.toLower )) title
  return code 


getMostFreq :: Maybe [String] -> Maybe String
getMostFreq l = let
  freq_m = fmap (\w -> M.fromListWith (+) [(s,1) | s<-w]) l
  freq_w = fmap (M.foldlWithKey mostFreqHelper ("0", 0)) freq_m
  str_freq_w = fmap retrieveStr freq_w
  in str_freq_w

mostFreqHelper :: (String, Integer) -> String -> Integer -> (String, Integer)
mostFreqHelper (a,b) c d = if b > d then (a,b) else (c,d)

retrieveStr :: (String, Integer) -> String
retrieveStr (a,b) = a
