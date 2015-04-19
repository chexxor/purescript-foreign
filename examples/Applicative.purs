module Example.Applicative where

import Data.Foreign
import Data.Foreign.Index
import Data.Foreign.Class

data Point = Point Number Number Number

instance showPoint :: Show Point where
  show (Point x y z) = "Point " ++ show [x, y, z]

instance pointIsForeign :: IsForeign Point where
  read value = Point <$> readProp "x" value
                     <*> readProp "y" value
                     <*> readProp "z" value

main = Console.print $
  readJSON """{ "x": 1, "y": 2, "z": 3 }""" :: F Point
