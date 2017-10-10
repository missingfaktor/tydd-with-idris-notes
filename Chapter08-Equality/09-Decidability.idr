module Main

-- A property of some values is decidable if you can always say whether the
-- property holds or not for specific values.

zeroNotSucc : (0 = S k) -> Void
zeroNotSucc Refl impossible

succNotZero : (S k = 0) -> Void
succNotZero Refl impossible

noRec : (contra : (k = j) -> Void) -> (S k = S j) -> Void
noRec contra Refl = contra Refl

-- ^ "The only possible value prf can take is Refl, and the only way it can
-- take the value Refl is if S k and S j are equal, and therefore k and j are
-- equal."
--
-- Okay, this is intense. Having an input of type (a -> Void) is like saying
-- "Assume, a holds." And then we proceed to prove a contradiction, thereby
-- falsifying the original assumption.

checkEqNat : (num1 : Nat) -> (num2 : Nat) -> Dec (num1 = num2)
checkEqNat Z Z = Yes Refl
checkEqNat Z (S k) = No zeroNotSucc
checkEqNat (S k) Z = No succNotZero
checkEqNat (S k) (S j) = case checkEqNat k j of
                              Yes prf   => Yes (cong prf)
                              No contra => No (noRec contra)

-- "Being able to guarantee that two values are equal (or different) is
-- commonly useful in type-driven development, because showing relationships
-- between larger structures depends on showing relationships between the
-- individual components."
