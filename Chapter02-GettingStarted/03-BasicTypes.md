The book says:

> Because Nats can never be negative, a Nat can only be subtracted from a larger Nat.

So I tried it, and lo!

```idris
*08-FirstClassTypes> 3 - 4
(input):1:3-4:When checking argument smaller to function Prelude.Nat.-:
        Can't find a value of type
                LTE 4 3

*08-FirstClassTypes> :t (-)
Prelude.Interfaces.(-) : Neg ty => ty -> ty -> ty
Prelude.Nat.(-) : (m : Nat) -> (n : Nat) -> {auto smaller : LTE n m} -> Nat
```

That's pretty cool!

I have seen the `auto` keyword before, but cannot recall what it does.

> When an expression [..] can be one of several types, you can make the type explicit with the notation the <type><expression>, to say that type is the required type of expression

This is a very interesting function. It makes me think of `implicitly` in Scala. It, too, felt like a language feature when it saw first, but in fact, is just a plain old function.

```idris
Idris> the Nat 2
2 : Nat

Idris> the Integer 2
2 : Integer

Idris> :t the
the : (a : Type) -> a -> a
```

`cast` is another fun one. This feels like implicit conversions done right. Scala should also have taken this approach. But it's easy to see why it didn't – Implicit conversions came much before implicit parameters (and type classes).

```idris
Idris> :t cast
cast : Cast from to => from -> to

Idris> cast { to = Double } 11
11.0 : Double

Idris> :doc Cast
Interface Cast
    Interface for transforming an instance of a data type to another type.

Parameters:
    from, to

Methods:
    cast : Cast from to => (orig : from) -> to
        Perform a cast operation.

        The function is Total
Implementations:
    Cast String Int
    Cast String Double
    Cast String Integer
    Cast Int String
    Cast Int Double
    Cast Int Integer
    Cast Double String
    Cast Double Int
    Cast Double Integer
    Cast Integer String
    Cast Integer Double
    Cast Char Int
    Monoid a => Eq a => Cast a (Maybe a)
    Monoid a => Cast (Maybe a) a
    Cast Nat Integer
    Cast Integer Nat
        Casts negative Integers to 0.
    Cast String Nat
    Cast Int Nat
        Casts negative Ints to 0.
    Cast Nat Int
    Cast Nat Double
    Cast Int Char
    Cast String (List Char)
    Cast (List Char) String
    Cast Char String
```

A few things here:
- I love that you can selectively specify some type variable arguments in Idris. The inability to do this has been a huge annoyance for me in Scala.
- `Cast` is a "lawless" type-class. This shows that Idris (and Edwin Brady) might not care as much about lawlessness as much of Haskell folks. I feel somewhat vindicated due to this! I have always thought of the law status of some properties as somewhat arbitrary. A type of a function inside type-class is also a property. To say that a type-class must have some properties not captured by type system seemed like a strange expectations. Depending on the strength of your type system, you may be able to capture from nothing to everything.
- Type-classes are called "interface" in Idris. There is a nice discussion on the Idris mailing list here: https://groups.google.com/forum/#!topic/idris-lang/i4AIk8_apGI.
