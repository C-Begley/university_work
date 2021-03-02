{-# LANGUAGE OverloadedStrings #-}
import Text.HTML.Scalpel

exampleHTML :: String
exampleHTML = "<html><body><ul><li>Hello</li><li>World</li></ul></body></html>"

scrapeAllItems :: String -> Maybe [String]
scrapeAllItems input = do
        scrapeStringLike input items
          where
            items :: Scraper String [String]
            items = htmls "ul"
            --items = texts "ul"
            --items = texts "li"
main = do
        let list = scrapeAllItems exampleHTML
        print list 

--exampleHTML =  "<html><body>Hello World</body></html>"
--String returns Nothing, list returns empty list
--scrapeAllItems :: String -> Maybe String
--scrapeAllItems input = do
--        scrapeStringLike input items
--          where
--            items :: Scraper String String
--            items = html "ul"
--            --items = text "ul"
--            --items = text "li"
--main = do
--        let list = scrapeAllItems exampleHTML
--        print list 

