
module TestMarsRover where

import Test.HUnit
import Data.List

data Direction = North | South | West | East deriving (Eq, Show)

clockwise :: [Direction]
clockwise = [North, East, South, West]

rotateLeft :: Direction -> Direction
rotateLeft = rotate (\x -> x - 1)

rotateRight :: Direction -> Direction
rotateRight = rotate (+ 1)

delta :: Direction -> Point -> Point
delta North (x, y) = (x, y + 1)
delta South (x, y) = (x, y - 1)
delta West (x, y) = (x - 1, y)
delta East (x, y) = (x + 1, y)

opposite :: Direction -> Direction
opposite = rotate (+2)

rotate :: (Int -> Int) -> Direction -> Direction
rotate f dir = clockwise !! next
  where Just(current) = elemIndex dir clockwise
        next = (f current) `mod` 4

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

forward :: Rover -> Rover
forward (pos, dir) = (delta dir pos, dir)

backwards :: Rover -> Rover
backwards (pos, dir) = (delta (opposite dir) pos, dir)

left :: Rover -> Rover
left (pos, dir) = (pos, rotateLeft dir)

right :: Rover -> Rover
right (pos, dir) = (pos, rotateRight dir)


test1 = TestCase (assertEqual "Rover is at base position" (0, 0) (position defaultRover))

test2 = TestCase (assertEqual "Rover remembers position" (1, 2) (position ((1, 2),North)))

test3 = TestCase (assertEqual "Rover initially faces North" North (direction defaultRover))

test4 = TestCase (assertEqual "Rover remembers direction" South (direction ((0, 0), South)))

test5 = TestCase (assertEqual "Rover turns left from North to West" West (direction (left defaultRover)))

test7 = TestCase (assertEqual "Rover turns left from East to North" North (direction (left ((0, 0), East))))

test6 = TestCase (assertEqual "Rover turns right from North to East" East (direction (right defaultRover)))

test8 = TestCase (assertEqual "Rover moves forward" (0, 1) (position (forward defaultRover)))

test9 = TestCase (assertEqual "Rover moves forward in general" (1, 1) (position (forward ((2,1), West))))

test10 = TestCase (assertEqual "Rover moves backwards" (1, 1) (position (backwards ((2,1), East))))

tests = TestList [ TestLabel "test1" test1,
                   TestLabel "test2" test2,
                   TestLabel "test4" test4,
                   TestLabel "test5" test5,
                   TestLabel "test7" test7,
                   TestLabel "test6" test6,
                   TestLabel "test8" test8,
                   TestLabel "test9" test9,
                   TestLabel "test10" test10,
                   TestLabel "test3" test3]