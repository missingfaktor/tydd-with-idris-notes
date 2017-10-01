module ArithmetricExpression

%default total

-- BECAUSE SMALLTALK WAY IS THE RIGHT WAY!!!111
infixl 5 .+.
infixl 5 .-.
infixl 5 .*.

data Expression : Type where
  Number : Integer -> Expression
  (.+.) : Expression -> Expression -> Expression
  (.-.) : Expression -> Expression -> Expression
  (.*.) : Expression -> Expression -> Expression

implicit
liftNumber : Integer -> Expression
liftNumber = Number

evaluate : Expression -> Integer
evaluate (Number x) = x
evaluate (x .+. y)  = evaluate x + evaluate y
evaluate (x .-. y)  = evaluate x - evaluate y
evaluate (x .*. y)  = evaluate x * evaluate y
