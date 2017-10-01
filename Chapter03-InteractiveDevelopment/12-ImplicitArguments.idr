-- I love how in Idris implicit arguments essentially subsume type variables
-- with special status in other languages – they are merely implicit arguments
-- inferred by the compiler! Idris version is capable of inferring any values
-- whatsoever. The choice of syntax is awesome too!

identity' : (t: Type) -> t -> t
identity' _ x = x

identity'' : {t: Type} -> t -> t
identity'' x = x

{-
*12-ImplicitArguments> identity' Int 4
4 : Int

*12-ImplicitArguments> identity' _ 4
4 : Integer

*12-ImplicitArguments> identity'' 4
4 : Integer

*12-ImplicitArguments> identity'' {t=Int} 4
4 : Int
-}

-- "An underscore (_) in a function call means that you want Idris to work out
-- an implicit value for the argument, given the information in the rest of
-- the expression."
--
-- Underscore, when used in patterns, means "anything goes", but in regular
-- expressions, means "work this out for me"! Perhaps Scala borrowed its 50
-- shades of underscore from Idris (or other dependently typed language)?
