
module TestMarsRover where

import Test.HUnit

data Direction = North | South deriving (Eq, Show)

type Point = (Int, Int)

type Rover = Point

position :: Rover -> Point
position r = r

direction :: Rover -> Direction
direction _ = North

test1 = TestCase (assertEqual "Rover is at base position" (0, 0) (position (0,0)))

test2 = TestCase (assertEqual "Rover remembers position" (1, 2) (position (1, 2)))

test3 = TestCase (assertEqual "Rover initially faces North" North (direction (0, 0)))

tests = TestList [ TestLabel "test1" test1,
                   TestLabel "test2" test2,
                   TestLabel "test3" test3]