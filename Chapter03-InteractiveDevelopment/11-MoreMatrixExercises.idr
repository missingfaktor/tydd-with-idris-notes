module MoreMatrixExercises

import Data.Vect

%default total

infixr 5 |*|

(|*|) : Nat -> Nat -> Type -> Type
(|*|) rows columns a = Vect rows (Vect columns a)

transpose' : (x : Vect c a) -> (xsTransposed : (c |*| len) a) -> (c |*| (S len)) a
transpose' []        []        = []
transpose' (x :: xs) (y :: ys) = (x :: y) :: transpose' xs ys

transposeMatrix : (r |*| c) a -> (c |*| r) a
transposeMatrix []        = replicate _ []
transposeMatrix (x :: xs) = let xsTransposed = transposeMatrix xs in
                            transpose' x xsTransposed

transposeMatrix' : (r |*| c) a -> (c |*| r) a
transposeMatrix' []        = replicate _ []
transposeMatrix' (x :: xs) = zipWith (::) x (transposeMatrix' xs)

addMatrix : Num a => (n |*| m) a -> (n |*| m) a -> (n |*| m) a
addMatrix [] []               = []
addMatrix (x :: xs) (y :: ys) = zipWith (+) x y :: addMatrix xs ys

-- This one was too hard for me so I copied it from Brady's repository.

multVecs : Num a => (xs : Vect n a) -> (ys : Vect n a) -> a
multVecs xs ys = sum (zipWith (*) xs ys)

mkRow : Num a => (x : Vect n a) -> (ys_trans : (p |*| n) a) -> Vect p a
mkRow x []        = []
mkRow x (y :: xs) = multVecs x y :: mkRow x xs

multiplyMatrixHelper : Num a => (xs : (m |*| n) a) -> (ysTransposed : (p |*| n) a) -> (m |*| p) a
multiplyMatrixHelper []        ysTransposed = []
multiplyMatrixHelper (x :: xs) ysTransposed = mkRow x ysTransposed :: multiplyMatrixHelper xs ysTransposed

multiplyMatrix : Num a => (n |*| m) a -> (m |*| p) a -> (n |*| p) a
multiplyMatrix xs ys = let ysTransposed = transposeMatrix ys in
                       multiplyMatrixHelper xs ysTransposed
