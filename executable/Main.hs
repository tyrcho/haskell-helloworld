module Main where

import Directions
import Rover

main :: IO ()
main = print (position (forward ((2,1), West)))