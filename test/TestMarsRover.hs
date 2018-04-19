module TestMarsRover where

import Test.HUnit
import Directions
import Rover


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