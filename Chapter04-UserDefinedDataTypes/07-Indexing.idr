module Indexing

import Data.Vect

%default total

infixr 1 >=>

-- Couldn't find this in stdlib!
(>=>) : Monad m => (a -> m b) -> (b -> m c) -> (a -> m c)
f >=> g = \x => f x >>= g

tryIndex : Integer -> Vect n a -> Maybe a
tryIndex {n} i vector = do
  i' <- integerToFin i n
  return $ index i' vector

-- "This is a common pattern in dependently typed programming, which you’ll see
-- more often in the coming chapters. The type of index tells you when it’s
-- safe to call it, so if you have an input that’s potentially unsafe, you need
-- to check. Once you’ve converted the Integer to a Fin n, you know that number
-- must be within bounds, so you don’t need to check again."

-- John Reynolds famously said, "type structure is a syntactic discipline for
-- maintaining levels of abstraction". Examples like the above really hit the
-- point home.
