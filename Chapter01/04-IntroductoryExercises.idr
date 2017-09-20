module IntroductoryExercises

import Data.Vect

_1_1 : Vect n elem -> Vect n elem
_1_1 = reverse

_1_2 : Vect n elem -> Vect n elem
_1_2 = id

-- _2_1 : Vect n elem -> Vect (n * 2) elem
-- _2_1 vect = vect ++ vect
--
-- Whoppers. Got to this error quicker than I thought!
--
-- *04-IntroductoryExercises> :r
-- Type checking ./04-IntroductoryExercises.idr
-- 04-IntroductoryExercises.idr:12:6:When checking right hand side of _2_1 with expected type
--        Vect (n * 2) elem
--
-- Type mismatch between
--        Vect (n + n) elem (Type of vect ++ vect)
-- and
--        Vect (mult n 2) elem (Expected type)
--
-- Specifically:
--        Type mismatch between
--                plus n n
--        and
--                mult n 2
-- Holes: IntroductoryExercises._2_1
--
-- I am going to assume the author left this in intentionally. I do not know how to write a proof
-- for 'n + n = n * 2' just yet, so I am just going to change the problem statement for now.
--
-- I will come back to this proof in future.
--

_2_1 : Vect n elem -> Vect (n + n) elem
_2_1 vect = vect ++ vect

_3_1 : Vect (1 + n) elem -> Vect n elem
_3_1 = tail

_3_2 : Vect (1 + n) elem -> Vect n elem
_3_2 = init

-- I searched around a bit for the Bounded type. I could not find it in the standard library. So I Googled for it, and found
-- the following at http://docs.idris-lang.org/en/latest/effects/simpleeff.html:
--
-- Bounded : Int -> Type
-- Bounded x = (n : Int ** So (n >= 0 && n <= x))
--
-- Unfortunately `So` wasn't found. I wonder if it has been renamed.
--
-- Then it occurred to me that there is Fin in the standard library, which sounds like the same thing? And turns out it indeed
-- is. Great!
Bounded : Nat -> Type
Bounded = Fin

_4_1 : Bounded n -> Vect n elem -> elem
_4_1 = index

-- I looked up the docs on Fin, and they say:
--
-- "It's probably not a good idea to use Fin for arithmetic, and they will be exceedingly inefficient at run time."
--
-- That doesn't sound so great. :( As far as I know, refinement/liquid types support bounded numbers easily. If I cannot
-- use bounded numbers in a dependent system, that would make me very sad. Perhaps there are better, faster ways than Fin,
-- and Fin is just a pedagogical starter-pack tool like Haskell's String? Maybe. I will read on...
--
