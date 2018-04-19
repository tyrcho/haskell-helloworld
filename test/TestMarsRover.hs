
module TestMarsRover where

import Test.HUnit

data Direction = North | South deriving (Eq, Show)

type Point = (Int, Int)

type Rover = (Point, Direction)

position :: Rover -> Point
position (point, _) = point

direction :: Rover -> Direction
direction (_, dir) = dir

newRover :: Point -> Direction -> Rover
newRover p d = (p, d)

defaultRover :: Rover
defaultRover = newRover (0,0) North


test1 = TestCase (assertEqual "Rover is at base position" (0, 0) (position defaultRover))

test2 = TestCase (assertEqual "Rover remembers position" (1, 2) (position ((1, 2),North)))

test3 = TestCase (assertEqual "Rover initially faces North" North (direction defaultRover))

test4 = TestCase (assertEqual "Rover remembers direction" South (direction ((0, 0), South)))

tests = TestList [ TestLabel "test1" test1,
                   TestLabel "test2" test2,
                   TestLabel "test4" test4,
                   TestLabel "test3" test3]