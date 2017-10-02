module Main

import System

guess : (target : Nat) -> (guesses: Nat) -> IO ()
guess target Z = putStrLn "Out of guesses. You lost."
guess target guesses@(S _) = do
  putStrLn ("You have " ++ show guesses ++ " guesses.")
  putStrLn "Guess!"
  guessed <- cast {to = Nat} `map` getLine
  if guessed == target
    then putStrLn "Correct!"
    else do
      putStrLn "Derp! Wrong."
      guess target (guesses - 1)

randomNumber : (lower: Nat) -> (upper: Nat) -> {auto smaller: LTE lower upper} -> IO Nat
randomNumber lower upper = do
  t <- time
  pure (lower + (cast t `mod` (upper - lower)))

main : IO ()
main = do
  rand <- randomNumber 1 1000
  guess rand 5
