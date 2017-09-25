module InsertionSort

import Data.Vect

%default total

insert : Ord a => a -> Vect len a -> Vect (S len) a
insert x []        = [x]
insert x (y :: xs) = case x < y of
                          False => x :: y :: xs
                          True  => y :: insert x xs

insertionSort : Ord a => Vect n a -> Vect n a
insertionSort []        = []
insertionSort (x :: xs) = let xsSorted = insertionSort xs
                          in insert x xsSorted
