import Data.Maybe
import Data.Char
data Locality = N | S | E | W | C

data Reg = OldReg {code :: String} | NewReg {loc :: Locality,
            district :: Int,
            month :: Int,
            year :: Int,
            random:: String} 

currentYear =2020
 
createNewReg::Localitly->Int->Int->Int->String-> Maybe Reg
createNewReg l d m y r 
    | (d < 1) ||(d > 20)  = Nothing --district must be between 1 and 20
    | (m < 1) || (m > 12) = Nothing -- month must be between 1 and 12
    | (y >= 2020) && y<= currentYear = Nothing -- Year must be after new plates introduce and below or equal to current year 
    | length(r) /= 3 = Nothing  -- random sequence must be 3 digits long
    | not $foldl (&&) True $ map Data.Char.isAlpha r = Nothing --random sequence must be alphanumeric
    | otherwise = Just $NewReg l d m y r
