module Main

import Data.Vect

-- Failed attempt. Boolean equality test not enough!
--
-- exactLength : (len : Nat) -> (input : Vect m a) -> Maybe (Vect len a)
-- exactLength { m } len input =
--   case m == len of
--     False => ?wat
--     True => ?wat2

data EqNat : (num1 : Nat) -> (num2 : Nat) -> Type where
  Same : (num : Nat) -> EqNat num num

-- "With dependent types, you can use types such as EqNat to express additional
-- information about other data, in this case expressing that two Nats are
-- guaranteed to be equal. This is a powerful concept, as you’ll soon see, and
-- can take some time to fully appreciate."

-- I did not understand this at all during my first reading of the book, but
-- now I do! The only way to construct `EqNat` is when `num1` equals `num2`, so
-- mere existence of `Same` is enough for Idris type-checker to conclude that
-- `num1` and `num2` are the same!

-- This function is essentially a proof!
sameS : (num1: Nat) -> (num2: Nat) -> EqNat num1 num2 -> EqNat (S num1) (S num2)
sameS num num (Same num) = (Same (S num))

-- The book says:
-- "In principle, you can state and try to prove complex properties of any
-- function in Idris. For example, you could write a function whose type states
-- that reversing a list twice yields the original list. In practice, however,
-- you’ll rarely need to manipulate equalities much more complex than the
-- implementation of sameS."
--
-- This is interesting.

checkEqNat : (num1 : Nat) -> (num2 : Nat) -> Maybe (EqNat num1 num2)
checkEqNat Z Z = Just $ Same _
checkEqNat Z (S k) = Nothing
checkEqNat (S k) Z = Nothing
checkEqNat (S k) (S j) = [| (sameS k j) (checkEqNat k j) |]

-- Attempt 2!
exactLength : (len : Nat) -> (input : Vect m a) -> Maybe (Vect len a)
exactLength { m } len input =
  case checkEqNat m len of
    Nothing => Nothing
    Just (Same _) => Just input
