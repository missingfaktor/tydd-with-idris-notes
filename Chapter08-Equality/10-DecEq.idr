module Main

data Vect : Nat -> Type -> Type where
  Nil : Vect 0 elem
  (::) : (x : elem) -> (xs : Vect len elem) -> Vect (S len) elem

exactLength : (len : Nat) -> (input : Vect m a) -> Maybe (Vect len a)
exactLength { m } len input = case decEq m len of
                                   Yes Refl  => Just input
                                   No contra => Nothing

headUnequal : DecEq a => {xs : Vect n a} -> {ys : Vect n a} -> (contra : (x = y) -> Void) -> ((x :: xs) = (y :: ys)) -> Void
headUnequal contra Refl = contra Refl

tailUnequal : DecEq a => {xs : Vect n a} -> {ys : Vect n a} -> (contra : (xs = ys) -> Void) -> ((x :: xs) = (y :: ys)) -> Void
tailUnequal contra Refl = contra Refl

implementation DecEq a => DecEq (Vect n a) where
  decEq [] [] = Yes Refl
  decEq (x :: xs) (y :: ys) = case (decEq x y, decEq xs ys) of
                                   (Yes Refl, Yes Refl) => Yes Refl
                                   (No contra, _) => No $ headUnequal contra
                                   (_, No contra) => No $ tailUnequal contra
