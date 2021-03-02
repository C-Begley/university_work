import Data.Emoji
import Data.Maybe
main = do putStrLn $ fromJust $ unicodeByName "pizza"
main1 = do mapM_ (putStrLn) $ map (fromJust.unicodeByName) ["smile", "angry", "happy"] --Returns side effects, i.e emoji
main2 =  map (putStrLn) (map (fromJust.unicodeByName) ["smile", "angry", "happy"]) --Returns result, i.e ()
