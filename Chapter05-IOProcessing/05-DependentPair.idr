module DependentPair

import Data.Vect

-- Recover regular pair from a dependent pair
RegularPair : Type -> Type -> Type
RegularPair X Y = DPair X (\_ => Y)

t : RegularPair Int String
t = (11 ** "eleven")

-- Back to reading a vector!
readVect : IO (len ** Vect len String)
readVect = do
  x <- getLine
  if x == ""
    then pure (_ ** [])
    else do
      (_ ** xs) <- readVect
      pure (_ ** (x :: xs))

zipInputs : IO ()
zipInputs = do
  putStrLn "Enter vector 1 (blank like to end)"
  (len1 ** vec1) <- readVect
  putStrLn "Enter vector 2 (blank like to end)"
  (len2 ** vec1) <- readVect
  case exactLength len1 vec2 of
    Nothing    => putStrLn "Vectors are different lengths"
    Just vec2' => printLn (zip vec1 vec2')
