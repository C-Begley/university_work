{-# LANGUAGE OverloadedStrings #-}

module CambridgeDict
    (getDefinition
    ) where

import Text.HTML.Scalpel
import Data.Typeable
import Data.Maybe
import Data.List.Split

-- | Returns cambridge dictionary definition of word 
getDefinition :: String -> IO(String)
getDefinition word = do
  let page = "https://dictionary.cambridge.org/dictionary/english/" ++ word 
  res <- scrapeURL page scrapeBody
  let str = fromMaybe "N/A" res 
      tidy = (splitOneOf ".:;" str)!!0
  return tidy
scrapeBody :: Scraper String String
-- ^ scrape wikipeida body
scrapeBody = chroot("div" @: ["class" @= "def ddef_d db"]) scrapeDefinition 


scrapeDefinition :: Scraper String String
-- ^ get content from paragraph (<p>) tags
scrapeDefinition= do
  str <- text anySelector
  return str
