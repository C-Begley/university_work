{-# LANGUAGE    OverloadedStrings #-}
import Text.HTML.Scalpel

scrapeTitle :: Scraper String String
scrapeTitle = (attr "title" "img")

scrapeComic :: Scraper String String
scrapeComic = 
    chroot ("div" @: ["id" @="comic"]) scrapeTitle

main :: IO()
main  = do
    res <- scrapeURL "htpp://xkcd.com" scrapeComic
    print res
