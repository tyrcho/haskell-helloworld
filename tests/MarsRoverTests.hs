module Test.MarsRoverTests where

import Test.HUnit
import Test.Framework
import Test.Framework.Providers.HUnit
import Directions
import Rover

tests = test [
    "Rover is at base position"             ~: (0, 0) ~=? (position defaultRover),
    "Rover remembers position"              ~: (1, 2) ~=?  (position ((1, 2),North)),
    "Rover initially faces North"           ~: North  ~=? (direction defaultRover),
    "Rover remembers direction"             ~: South  ~=? (direction ((0, 0), South)),
    "Rover turns left from North to West"   ~: West   ~=? (direction (left defaultRover)),
    "Rover turns left from East to North"   ~: North  ~=? (direction (left ((0, 0), East))),
    "Rover turns right from North to East"  ~: East   ~=? (direction (right defaultRover)),
    "Rover moves forward"                   ~: (0, 1) ~=?  (position (forward defaultRover)),
    "Rover moves forward in general"        ~: (1, 1) ~=?  (position (forward ((2,1), West))),
    "Rover moves backwards"                 ~: (1, 1) ~=?  (position (backwards ((2,1), East))) ]


main = defaultMain tests
