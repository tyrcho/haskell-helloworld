
module TestMarsRover where

import Test.HUnit

type Point = (Int, Int)

type Rover = Point

position :: Rover -> Point
position r = r

test1 = TestCase (assertEqual "Rover is at base position" (0, 0) (position (0,0)))

test2 = TestCase (assertEqual "Rover remembers position" (1, 2) (position (1, 2)))

tests = TestList [TestLabel "test1" test1, TestLabel "test2" test2]