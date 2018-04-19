
module TestMarsRover where

import Test.HUnit

data Direction = North | South | West | East deriving (Eq, Show)

rotateLeft :: Direction -> Direction
rotateLeft North = West
rotateLeft West = South
rotateLeft South = East
rotateLeft East = North

rotateRight :: Direction -> Direction
rotateRight West = North
rotateRight South = West
rotateRight East = South
rotateRight North = East

type Point = (Int, Int)

type Rover = (Point, Direction)

-- constructors

newRover :: Point -> Direction -> Rover
newRover p d = (p, d)

defaultRover :: Rover
defaultRover = newRover (0,0) North

-- accessors

position :: Rover -> Point
position (point, _) = point

direction :: Rover -> Direction
direction (_, dir) = dir

-- actions

left :: Rover -> Rover
left (pos, dir) = (pos, rotateLeft dir)

right :: Rover -> Rover
right (pos, dir) = (pos, rotateRight dir)


test1 = TestCase (assertEqual "Rover is at base position" (0, 0) (position defaultRover))

test2 = TestCase (assertEqual "Rover remembers position" (1, 2) (position ((1, 2),North)))

test3 = TestCase (assertEqual "Rover initially faces North" North (direction defaultRover))

test4 = TestCase (assertEqual "Rover remembers direction" South (direction ((0, 0), South)))

test5 = TestCase (assertEqual "Rover turns left from North to West" West (direction (left defaultRover)))

test6 = TestCase (assertEqual "Rover turns right from North to East" East (direction (right defaultRover)))

tests = TestList [ TestLabel "test1" test1,
                   TestLabel "test2" test2,
                   TestLabel "test4" test4,
                   TestLabel "test5" test5,
                   TestLabel "test6" test6,
                   TestLabel "test3" test3]