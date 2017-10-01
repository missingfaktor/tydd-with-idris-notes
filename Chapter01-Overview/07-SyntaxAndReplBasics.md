Idris syntax is incredibly similar to that of Haskell. So much so that if you know Haskell, you can start writing Idris pretty much right away. I am ambivalent on this. On one hand, there is not a lot of new syntax to learn. On the other hand, I would have really preferred it if it used a minimal Lisp-y syntax.

Unlike Haskell, Idris `String`s are not `List Char`. This is good.

I like that Idris uses `:` for `has a type`, and `::` for `cons`.

I am playing with Haskell and Idris REPLs side by side, to understand concepts better.

Here is the first example of first-class status of types in Idris.

```haskell
-- Haskell REPL
haskell> :t True
True :: Bool

haskell> :t Bool
<interactive>:1:1: error: Data constructor not in scope: Bool

haskell> :k Bool
Bool :: *
```

```idris
*04-IntroductoryExercises> :t True
True : Bool

*04-IntroductoryExercises> :t Bool
Bool : Type

*04-IntroductoryExercises> :t Type
Type : Type 1
```

Nice!

If you keep going however, it doesn't seem to work.

```idris
*04-IntroductoryExercises> :t Type 1
builtin:Type mismatch between
        Type (Type of Type)
and
        _ -> _ (Is Type applied to too many arguments?)
*04-IntroductoryExercises> :t (Type 1)
builtin:Type mismatch between
        Type (Type of Type)
and
        _ -> _ (Is Type applied to too many arguments?)
```

I don't know why. On this, the book says:

> That is, Type has type Type 1, Type 1 has type Type 2, and so on forever, as far as we’re concerned. The good news is that Idris will take care of the details for you, and you can always write Type alone.

I cannot make sense of this at this point. Perhaps it will start making sense later...

Holes are apparently a very important part of the language. Holes (among other features of which I have had a sneak peak elsewhere) show that Idris, unlike many other PLs, does not treat editing experience as external to PL and something the PL itself shouldn't bother with. It is built with the whole PX in mind. I like it.

The syntax for holes is the same as that of ["logic variables"](http://docs.datomic.com/getting-started/query-the-data.html) in Datomic. I do not know the origin of this syntax, but it is probably not a coincidence.

Idris REPL is capable of printing holes, types, and functions. Clearly it's doing a bit more than calling `show` on the last value. If this were Smalltalk, I could have just opened up the hood, and see exactly what it's doing. (I say this so often that I am just going to abbreviate it henceforth as ITWS.)
