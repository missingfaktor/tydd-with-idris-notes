module Main

TupleVectType : (size : Nat) -> (element : Type) -> Type
TupleVectType Z     element = ()
TupleVectType (S k) element = (element, TupleVectType k element)

test : TupleVectType 4 Nat
test = (1, 2, 3, 4, ())
