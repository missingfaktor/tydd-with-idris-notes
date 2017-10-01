module DirectionModule

data Direction = North
               | East
               | South
               | West

turnClockWise : Direction -> Direction
turnClockWise North = East
turnClockWise East  = South
turnClockWise South = West
turnClockWise West  = North

data Shape : Type where
  Triangle : Double -> Double -> Shape
  Rectangle : Double -> Double -> Shape
  Circle : Double -> Shape

-- I am not entirely sure I like the short-hand ADT notation. I like how Agda
-- does it: Only one notation, akin to Haskell's GADTs.
--
-- Speaking of GADTs, this chapter has no mention of sum types, product types,
-- ADTs, or GADTs. I wonder why.

%name Shape shape, shape1, shape2

-- I like how Idris cares about the whole development experience. %name above
-- is a directive used by Idris to name pattern variables on case splits.

-- The generic data types section in the book uses an example of Maybe to
-- replace custom domain specific sum types that are isomorphic. I think the
-- author could have picked different examples to illustrate the point, because
-- this in particular is just bad advice. 
