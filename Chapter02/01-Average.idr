module Average

import Data.Vect

average : (string: String) -> Double
average string = let numberOfWords = wordCount string
                     totalLength = sum $ allLengths $ words string in
                     cast totalLength / cast numberOfWords
  where
    wordCount : String -> Nat
    wordCount = length . words

    allLengths : List String -> List Nat
    allLengths = map length

showAverage : String -> String
showAverage string = "The average word length is " ++ show (average string) ++ "\n"

main : IO ()
main = repl "Enter a string: " showAverage
