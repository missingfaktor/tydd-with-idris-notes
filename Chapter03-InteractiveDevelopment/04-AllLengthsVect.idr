module AllLengthsVect

import Data.Vect

total
allLengths : {n: Nat} -> Vect n String -> Vect n Nat
allLengths [] = []
allLengths (x :: xs) = length x :: allLengths xs
