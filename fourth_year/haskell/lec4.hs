import Data.Emoji
import Data.Maybe
main = do putStrLn $ fromJust $ unicodeByName "pizza"
mapM_ putStrLn $ (fromJust.unicodeByName) ["smile", "angry", "happy"] --Returns side effects, i.e emoji
mapM putStrLn $ (fromJust.unicodeByName) ["smile", "angry", "happy"] --Returns result, i.e ()
