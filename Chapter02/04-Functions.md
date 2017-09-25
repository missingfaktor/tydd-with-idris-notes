> TYPE DECLARATIONS ARE REQUIRED! [..] In a language with first-class types, however, this generally turns out to be impossible. In any case, it’s undesirable to omit type declarations in type-driven development. Our philosophy is to use types to help us write programs, rather than to use programs to help us infer types!

A few years ago when dependent types weren't popular, typed functional folks had the attitude of "type inference of GTFO". Subtyping was deemed awful primarily on the account that it makes full type inference impossible. There was a StackOverflow answer from Hammar where I learned for the first time that some advanced features that had just been introduced to Haskell at the time created a similar situation there, and this happened in dependently typed language too, and that this trade-off was not to be dismissed outright.

--

Identity function:

```idris
Idris> :t id
id : a -> a

Idris> id 5
5 : Integer

Idris> id Int
Int : Type

Idris> id Type
Type : Type

Idris> id {a = Int}
id : Int -> Int

Idris> id {a = 4}
When checking argument a to function Prelude.Basics.id:
        Type is not a numeric type
```

A value has a type, but it itself is NOT a type. A type has a type, but it is also a type.

I had a wee epiphany with regards to this today: In Scala, we have singleton types. So `4.type` is a valid type, and has only one value: 4 (duh). You can keep refining types, narrowing them down to smaller and smaller spaces, until you get singleton types. So in some sense, any value also corresponds to (or maybe, even "is"?) a singleton type. This is kind of what protocols do to classes in the OO world too. You don't have the strange "object has a class, class has a class" thing in the prototype world.
