module Main

import Data.Vect

-- Prelude has a more generic version of EqNat called (=), whose data
-- constructor is called Refl instead of Same.
-- There is also a more generic version of sameS called cong (for congruence),
-- which can be thought of as lifting structural equality into Leibniz
-- equality.

-- Let's write our old example again with these data types.

checkEqNat : (num1 : Nat) -> (num2 : Nat) -> Maybe (num1 = num2)
checkEqNat Z Z = Just Refl
checkEqNat Z (S k) = Nothing
checkEqNat (S k) Z = Nothing
checkEqNat (S k) (S j) = [| cong (checkEqNat k j) |]

exactLength : (len : Nat) -> (input : Vect m a) -> Maybe (Vect len a)
exactLength { m } len input = case checkEqNat m len of
                                   Nothing => Nothing
                                   Just Refl => Just input
