
module TestMarsRover where

import Test.HUnit

type Rover = (Int, Int)

position :: Rover -> (Int, Int)
position _ = (0, 0)

test1 = TestCase (assertEqual "Rover is at base position" (0, 0) (position (0,0)))

tests = TestList [TestLabel "test1" test1]