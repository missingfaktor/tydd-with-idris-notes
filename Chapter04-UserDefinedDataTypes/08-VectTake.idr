module VectTake

import Data.Vect

%default total

vectTake : (n: Nat) -> Vect (n + m) a -> Vect n a
vectTake Z     _         = []
vectTake (S k) (x :: xs) = x :: vectTake k xs

tryIndex : Integer -> Vect n a -> Maybe a
tryIndex {n} i vector = do
  i' <- integerToFin i n
  return $ index i' vector

sumEntries : Num a => (pos : Integer) -> Vect n a -> Vect n a -> Maybe a
sumEntries pos [] [] = Nothing
sumEntries {n} pos xs ys = do
  pos' <- integerToFin pos n
  return $ index pos' xs + index pos' ys
