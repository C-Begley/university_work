import Data.Char

data Emotion = Happy | Sad | Angry | Confused deriving (Show, Eq)  --must use capital letters for data types and name

greet  :: Emotion -> String
greet Happy = "great to see you"
greet e  = "Sorry you are feeling " ++ (map toLower $ show e) ++ " today."

data Cordinates = Coord Int Int deriving (Show, Eq)   --Coord is a constructor name

data CourseCode = Code String Int

data Fuel = Fu Int
data Vehicle = Car Int String Fuel
               | Bicyle Int Bool
               | Bus Int String

printEmotion :: Emotion -> String
printEmotion Sad = ":-("
printEmotion Happy = ":-)"
printEmotion Angry = ":-~"
printEmotion 
