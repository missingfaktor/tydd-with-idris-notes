module Main

AdderType : (numberOfArguments : Nat) -> Type
AdderType Z     = Int
AdderType (S k) = (next : Int) -> AdderType k

adder : (numberOfArguments : Nat) -> (accumulator : Int) -> AdderType numberOfArguments
adder Z accumulator     = accumulator
adder (S k) accumulator = \next => adder k (accumulator + next)
