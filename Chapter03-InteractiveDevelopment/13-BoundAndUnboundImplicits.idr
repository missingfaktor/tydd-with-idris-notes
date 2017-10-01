module BoundAndUnboundImplicits

-- Here `elem` is an unbound implicit
myReverse : List elem -> List elem
myReverse = reverse

-- Here it is bound
myReverse' : {elem: Type} -> List elem -> List elem
myReverse' = reverse

-- "In practice, Idris will not treat every undefined name as an unbound
-- implicit—only names that begin with a lowercase letter and that appear
-- either on their own or in a function argument position."
--
-- test : f m a -> b -> a
-- test = ?doesntMatter
--
-- The above code gives:
--   Type checking ./13-BoundAndUnboundImplicits.idr
--   13-BoundAndUnboundImplicits.idr:15:6:When checking type of BoundAndUnboundImplicits.test:
--   No such variable f
