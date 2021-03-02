import Data.List
import Test.HUnit

getHelloMessage = \x -> "hello " ++ x

test1 = TestCase $ assertBool "hello is missing" $
    "hello" `isInfixOf` (getHelloMessage "foo")

test2 = TestCase $ assertBool "jeremy is missing" $
    "jeremy" `isInfixOf` (getHelloMessage "jeremy")

test3 =("glasgow" `isInfixOf` getHelloMessage "glasgow") @? "Where is glasgow"

test4 = "glasgow" @=? (reverse $reverse "glasgow") 

--Difference between ` "" and '

tests = TestList [TestLabel "test1" test1,
                    TestLabel "test2" test2]

--Can run tests either way
--runTestTT tests
--runTestTT (TestCase test3)
--runTestTT (TestCase test4)
