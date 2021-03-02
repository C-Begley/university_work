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
  stop_words <- readFile "../stopwords.txt"
  title <- get_title page
  let
     -- convert string result to list of words
     word_res = fmap concat $ fmap (fmap  words) res
     -- get lower case of all words
     lower_res = fmap (fmap (map Data.Char.toLower)) word_res
     -- filter stop words, single letters, 's, title related words and remove punctutation
     filt_res = filter_words lower_res stop_words title 
     -- get most frequent word from remaining list
     mostFreq = getMostFreq filt_res
  return mostFreq

scrapeBody :: Scraper String [String]
-- ^ scrape wikipeida body
scrapeBody = chroot("div" @: ["id" @= "mw-content-text"]) scrapeParagraphs

scrapeParagraphs :: Scraper String [String]
-- ^ get content from paragraph (<p>) tags
scrapeParagraphs = do 
  str <- texts "p"
  return str

scrapeTitle :: Scraper String String
-- ^ Scrape wikipedia title
scrapeTitle = chroot("h1" @: ["id" @= "firstHeading"]) scrapeHeader

scrapeHeader :: Scraper String String
-- ^ get content from header (<h1>) tags
scrapeHeader = do 
  str <- text "h1"
  return str

filter_words :: Maybe [String] -> String ->Maybe String ->  Maybe [String]
filter_words wrds fil title= let 
  -- filter stop words 
  fil_stop    = fmap (filter (\w -> w `notElem` words (fil))) wrds
  -- filter words relating to title
  fil_country = fmap (filter(\w -> (fmap (flip Data.List.isInfixOf w) title) == (Just False))) fil_stop
  -- remove apostrophe s
  fil_apos    = fmap (map (\s -> if isInfixOf "'s" s then (take(length(s)-2) s) else s)) fil_country 
  -- filter all punctutation 
  fil_punc    = fmap (map (filter (\c -> (not(Data.Char.isPunctuation c))))) fil_apos 
  -- filter words with non alpha characters
  fil_num     = fmap (filter (\s -> foldl (&&) True $ map Data.Char.isAlpha s)) fil_num
  --remove single letter words
  fil_single  = fmap (filter (\w -> length(w) > 1)) fil_num
  in fil_single  

get_title :: String -> IO (Maybe String)
-- ^ Returns the first fours letters of a wikipedia title
get_title = do 
  res <- scrapeURL page scrapeTitle
  let 
    title =if fmap length res <= (Just 4) then res else fmap (take 4) res
    title_lower = fmap (map (Data.Char.toLower )) title
  return title_lower 


getMostFreq :: Maybe [String] -> Maybe String
-- ^ Returns most frequent word in list of strings
getMostFreq l = let
  -- Generate map of words & their frequency 
  freq_m = fmap (\w -> M.fromListWith (+) [(s,1) | s<-w]) l
  -- Reduce map of words and frequency to tuple containing word with highest frequency
  freq_w = fmap (M.foldlWithKey mostFreqHelper ("0", 0)) freq_m
  -- Get string from remaining tuplr
  str_freq_w = fmap retrieveStr freq_w
  in str_freq_w

mostFreqHelper :: (String, Integer) -> String -> Integer -> (String, Integer)
-- ^ compares two tuples based on second integer value
mostFreqHelper (a,b) c d = if b > d then (a,b) else (c,d)

retrieveStr :: (String, Integer) -> String
-- ^ retrieves first element from tuple
retrieveStr (a,b) = a
