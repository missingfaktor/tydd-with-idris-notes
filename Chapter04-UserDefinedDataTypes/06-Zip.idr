module Zip

import Data.Vect

%default total

-- This function was fully generated with editor shortcuts.
tsip : Vect n a -> Vect n b -> Vect n (a, b)
tsip []        []        = []
tsip (x :: xs) (y :: ys) = (x, y) :: tsip xs ys
