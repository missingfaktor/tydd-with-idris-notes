longer : String -> String -> Nat
longer word1 word2 =
  let length1 = length word1
      length2 = length word2 in
  if length1 > length2
    then length1
    else length2

pythagoras : Double -> Double -> Double
pythagoras x y = sqrt (square x + square y)
  where
    square x = x * x                           -- I love `where`!
