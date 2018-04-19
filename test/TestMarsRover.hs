
module TestMarsRover where

import Test.HUnit


test1 = TestCase (assertEqual "Rover is at base position" (1,2) (2,2))

tests = TestList [TestLabel "test1" test1]
