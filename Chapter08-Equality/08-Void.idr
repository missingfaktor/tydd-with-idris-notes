module Main

-- `Void` is an empty type. It's useful for proving that something doesn't hold.
-- A type `X -> Void` indicates that it's impossible to construct any values of
-- type `X`. Or that `X` is a contradiction.

twoPlusTwoNotFive : (2 + 2 = 5) -> Void
twoPlusTwoNotFive Refl impossible

-- Here we also learn that `impossible` is not just an optional, documentation
-- only thing to be used for indicating impossible cases. Sometimes impossible
-- case is the only case, and you are required to have this implementation then.

numberCannotEqualItsSuccessor : (x : Nat) -> x = S x -> Void
numberCannotEqualItsSuccessor _ Refl impossible

-- "If you have a proof that an impossible value has happened,
-- you can do anything. `void : Void -> a` expresses this."
--
-- It's not clear to me yet how this function will be used...
