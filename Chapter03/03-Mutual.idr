module Mutual

{-
"Idris processes input files from top to bottom and requires types and functions
to be defined before use. This is necessary due to complications that arise with
dependent types, where the definition of a function can affect a type."

I don't understand the complications, but for now I will just nod along.
-}

mutual
  isEven : Nat -> Bool
  isEven Z = True
  isEven (S k) = isOdd k

  isOdd : Nat -> Bool
  isOdd Z = False
  isOdd (S k) = isEven k
