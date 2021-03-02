{-# LANGUAGE OverloadedStrings #-}

module Main where

import Text.HTML.Scalpel
import WikiScrapeLib

import Data.Maybe
--My library for getting Cambridge Dictionary defintion
import CambridgeDict
import Text.LaTeX
import System.Process

countries :: [String]
countries = [
          "Scotland",
          "England",
          "United_Kingdom",
          "USA",
          "Brazil",
          "France",
          "Germany",
          "Italy",
          "Japan",
          "China",
          "Russia"
         ]

wikify :: String -> URL
wikify x = "https://en.wikipedia.org/wiki/" ++ x

main :: IO ()
main = do
     words <- mapM mostfrequentwordonpage (wikify <$> countries)
     let str_words = map (fromMaybe "N/A" ) words
     defs <-  mapM getDefinition str_words
     let result = zip countries $ zip str_words defs   
     execLaTeXT (createReport result) >>= renderFile "outputs/output.tex" 
     callCommand "pdflatex -output-directory=outputs output.tex"
     callCommand "xdg-open outputs/output.pdf"         

createReport :: Monad m => [(String, (String, String))] -> LaTeXT_ m
createReport l = do
 thePreamble
 document $ theBody l

-- Preamble with some basic info.
thePreamble :: Monad m => LaTeXT_ m
thePreamble = do
 documentclass [] article
 raw "\\usepackage[a3paper,margin=1.25in]{geometry}"
 author "Conor Begley-2236693B"
 title $ "Most frequent words on Wikipedia pages"

theBody :: Monad m => [(String, (String, String))] -> LaTeXT_ m
theBody table = do
 maketitle
 center $ tabular Nothing [RightColumn,VerticalLine,CenterColumn, VerticalLine, LeftColumn ] $ do
   textbf "Country" & textbf "Word " & textbf "Definition"
   lnbk
   hline
   foldr (\n l -> do fromString (fst(n)) & fromString (fst(snd(n))) & small (fromString (snd(snd(n))))  
                     lnbk
                     l ) (return ()) table
