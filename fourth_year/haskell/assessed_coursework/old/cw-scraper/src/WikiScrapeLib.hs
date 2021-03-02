{-# LANGUAGE OverloadedStrings #-}

module WikiScrapeLib
    (  mostfrequentwordonpage
    ) where

import Text.HTML.Scalpel
import Data.Typeable
import Data.List
import Data.Char
import qualified Data.Map as M
import Data.List.Split
import Control.Applicative
import Control.Exception
import Network.HTTP.Client

handleHTTPException :: HttpException -> IO(Maybe String)
handleHTTPException e =  do return Nothing

-- | Returns most frequent word from wikipedia article body
mostfrequentwordonpage :: URL -> IO(Maybe String)
mostfrequentwordonpage page = do
  res <-catch (scrapeURL page scrapeBody) (handleHTTPException)
  stop_words_str <- readFile "stopwords.txt"
  let 
     title = extractTitle page
     stop_words = words stop_words_str
     -- convert to lower, and filter out stop words 
     filt_res = case res of
           Nothing -> Nothing
           Just x -> case (processText x stop_words title) of
                             [] -> Nothing --list if full of just stop words
                             y  -> Just y  
     -- get most frequent word from remaining list
     mostFreq = case filt_res of
           Nothing -> Nothing
           Just x -> Just $getMostFreq x
  
  --mostFreq = getMostFreq filt_res
  return mostFreq

scrapeBody :: Scraper String String
-- ^ scrape wikipedia body
scrapeBody = chroot("div" @: ["id" @= "mw-content-text"]) scrapeText 

scrapeText :: Scraper String String
-- ^ get content from paragraph (<p>) tags
scrapeText= do 
  str <- text anySelector 
  return str

processText :: String -> [String] -> String -> [String]
processText str stop_words title = let 
                                     -- convert string result to list of word0, including split on hyphens
                                     list_words = splitOneOf ".,- \n\t" str 
                                     -- get lower case of all words
                                     lower_words = map (map Data.Char.toLower) list_words 
                                     -- filter stop words, single letters, 's, title related words and remove punctutation
                                     filt_res = filterWords lower_words stop_words title
                                    in filt_res 

filterWords :: [String] -> [String] -> String ->  [String]
filterWords wrds fil title= let 
  -- remove apostrophe s
  fil_apos   = map (\s -> if isInfixOf "'s" s then (take(length(s)-2) s) else s) wrds 
  -- remove all punctutation 
  fil_punc   = map (filter (\c -> (not(Data.Char.isPunctuation c)))) fil_apos 
  -- filter stop words 
  fil_stop   = filter (\w -> notElem w fil) fil_punc
  -- filter words relating to title
  fil_title  = filter(\w -> (not(Data.List.isInfixOf title w))) fil_stop
  -- filter words with non alpha characters
  fil_num    = filter (\s -> foldl (&&) True $ map Data.Char.isAlpha s) fil_title
  --remove single letter words
  fil_single = filter (\w -> length(w) > 1) fil_num
  in fil_single

extractTitle :: String -> String
-- ^ Extract first four letters of title from URL
extractTitle page =  map (Data.Char.toLower) $ drop 30 $ take 34 page 
                    
getMostFreq :: [String] -> String
-- ^ Returns most frequent word in list of strings. In the case of multiple most frequent, it returns the first occuring word
--getMostFreq xs =fmap (head . maximumBy (comparing length) . group . sort) xs {-
getMostFreq l = let
  -- Generate map of words & their frequency 
  freq_m =  (\w -> M.fromListWith (+) [(s,1) | s<-w]) l
  -- Reduce map of words and frequency to tuple containing word with highest frequency
  freq_w = M.foldlWithKey mostFreqHelper ("0", 0) freq_m
  -- Get string from remaining tuplr
  str_freq_w = retrieveStr freq_w
 in str_freq_w

mostFreqHelper :: (String, Integer) -> String -> Integer -> (String, Integer)
-- ^ compares two tuples based on second integer value
mostFreqHelper (a,b) c d = if b > d then (a,b) else (c,d)

retrieveStr :: (String, Integer) -> String
-- ^ retrieves first element from tuple
retrieveStr (a,b) = a
