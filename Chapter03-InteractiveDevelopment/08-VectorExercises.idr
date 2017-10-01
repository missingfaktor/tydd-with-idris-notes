module VectorExercises

import Data.Vect

%default total

exercLength : List a -> Nat
exercLength []        = 0
exercLength (x :: xs) = 1 + exercLength xs

exercReverse : List a -> List a
exercReverse []        = []
exercReverse (x :: xs) = reverse xs ++ [x]

exercListMap : (a -> b) -> List a -> List b
exercListMap f []        = []
exercListMap f (x :: xs) = f x :: exercListMap f xs -- Here expression search gave me []

exercVectMap : (a -> b) -> Vect n a -> Vect n b
exercVectMap f [] = []
exercVectMap f (x :: xs) = f x :: exercVectMap f xs -- Here expression search gave me correct thing
