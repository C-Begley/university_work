{-# LANGUAGE OverloadedStrings #-}
import Control.Monad
import qualified Data.Text.IO as T
import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Web.Google.Translate

main :: IO ()
main = do
  Right TranslationResponse { translations = xs } <-
    newManager tlsManagerSettings >>= \mgr ->
    translate mgr (Key "<API-Key>") (Just srcLang) trgLang (Body "Hello")
  forM_ xs $ \Translation { translatedText = TranslatedText txt } ->
    T.putStrLn txt
  where
    srcLang = Source English
    trgLang = Target Russian

-- >>> Здравствуйте

