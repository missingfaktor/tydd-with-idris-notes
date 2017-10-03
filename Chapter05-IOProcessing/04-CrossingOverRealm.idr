module CrossingOverRealm

import Data.Vect

-- "Realistically, though, inputs to functions don’t come from such a carefully
-- controlled environment where the Idris type checker is available. In
-- practice, when a complete program is compiled and executed, inputs to
-- functions will originate from some external source: perhaps a field on a
-- web page, or user input at the console."
--
-- Dependent pairs help us cross over from dynamic realm to static realm.
-- (My intuition suggests subtyping (OO style) and existentials allow us to do
-- the same.)

readVectLen : (len : Nat) -> IO (Vect len String)
readVectLen Z     = pure []
readVectLen (S k) = do
  x <- getLine
  xs <- readVectLen k
  pure $ x :: xs


data VectUnknown : Type -> Type where
  MkVect : (len : Nat) -> Vect len a -> VectUnknown a

readVect : IO (VectUnknown String)
readVect = do
  x <- getLine
  if x == ""
    then pure $ MkVect _ []
    else do
      MkVect _ xs <- readVect
      pure $ MkVect _ (x :: xs)

printVect : Show a => VectUnknown a -> IO ()
printVect (MkVect len xs) = putStrLn (show xs ++ " (length " ++ show len ++ ")")
