module Rover where

import Directions


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