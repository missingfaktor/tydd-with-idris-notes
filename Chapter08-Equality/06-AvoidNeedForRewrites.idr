module Main

import Data.Vect

-- "You can often avoid the need for rewriting in types by taking care in how
-- you write function types."

mahAppend1 : Vect n elem -> Vect m elem -> Vect (n + m) elem
mahAppend1 [] ys = ys
mahAppend1 (x :: xs) ys = x :: mahAppend1 xs ys

---------------------------------- Notice this --vvvvv
mahAppend2 : Vect n elem -> Vect m elem -> Vect (m + n) elem
mahAppend2 { m } [] ys = rewrite plusZeroRightNeutral m in ys
mahAppend2 { n = S k } { m } (x :: xs) ys = rewrite sym (plusSuccRightSucc m k) in (x :: mahAppend2 xs ys)
