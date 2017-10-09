module Main

sameCons : {xs : List a} -> {ys : List a} -> xs = ys -> x :: xs = x :: ys
sameCons Refl = Refl

sameLists : {xs : List a} -> {ys : List a} -> x = y -> xs = ys -> x :: xs = y :: ys
sameLists Refl Refl = Refl

data ThreeEq : (a : Nat) -> (b : Nat) -> (c : Nat) -> Type where
  AllAreSame : ThreeEq a a a

-- "If x, y, z are equal, then so are x + 1, y + 1, z + 1."
allSameS : (x, y, z : Nat) -> ThreeEq x y z -> ThreeEq (S x) (S y) (S z)
allSameS z z z AllAreSame = AllAreSame
