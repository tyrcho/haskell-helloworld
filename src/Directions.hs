module Directions where

import Data.List

type Point = (Int, Int)

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

