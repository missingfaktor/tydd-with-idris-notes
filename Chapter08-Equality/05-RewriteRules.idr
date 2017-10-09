module Main

import Data.Vect

-- The following fails:
--
-- mahReverse : Vect n elem -> Vect n elem
-- mahReverse [] = []
-- mahReverse (x :: xs) = (mahReverse xs) ++ [x]
--
-- with:
--
-- When checking right hand side of mahReverse with expected type
--         Vect (S len) elem
--
-- Type mismatch between
--         Vect (len + 1) elem (Type of mahReverse xs ++ [x])
-- and
--         Vect (S len) elem (Expected type)
--
-- Specifically:
--         Type mismatch between
--                 plus len 1
--         and
--                 S len
--
-- This happens because Idris goes on reducing expressions until it can. In
-- `plus len 1`, it doesn't know `len`, and `plus` is defined by pattern
-- matching on `len`, so Idris cannot reduce the expression further.

-- This is where rewrite rules come into picture. Any expression of type
-- (a = b) can be used as a rewrite rule by supplying it to Idris type checker
-- using a special keyword `rewrite`.

mahReverse : Vect n elem -> Vect n elem
mahReverse [] = []
mahReverse { n = S k } (x :: xs) = rewrite plusCommutative 1 k in ((mahReverse xs) ++ [x])

-- The book recommends extracting such rewrites in auxiliary functions. I am
-- not feeling too good about the naming conventions they are using for these
-- auxiliary functions. To me, they make things more unclear.
