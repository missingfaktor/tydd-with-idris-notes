module Palindrome

simplePalindrome : String -> Bool
simplePalindrome string = string == reverse string

caseInsensitivePalindrome : String -> Bool
caseInsensitivePalindrome string = toLower string == toLower (reverse string)

palindrome10 : String -> Bool
palindrome10 string = (length string > 10) && (simplePalindrome string)

palindrome: Nat -> String -> Bool
palindrome n string = (length string > n) && (simplePalindrome string)

counts : String -> (Nat, Nat)
counts string = (length $ words string, length string)

top10 : Ord a => List a -> List a
top10 = Prelude.List.take 10 . reverse . sort

count : (a -> Bool) -> List a -> Nat
count p []        = 0
count p (x :: xs) = (if p x then 1 else 0) + (count p xs)

overLength : Nat -> List String -> Nat
overLength n = count $ (> n) . length
