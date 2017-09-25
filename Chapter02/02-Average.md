The book uses a lot of parentheses, and not much `$`. I tried `$`, and it works, but it does not seem be a function like in Haskell.

```idris
*08-FirstClassTypes> :doc ($)
No documentation for $

*08-FirstClassTypes> :t ($)
No such variable $
```

`let` and `where` are both supported. Nice.

I suspected `repl`, a function introduced here, might not be total, and turns out it isn't.

```idris
*08-FirstClassTypes> :total repl
Prelude.Interactive.repl is possibly not total due to:
    Prelude.Interactive.replWith, which is possibly not total due to recursive path:
    Prelude.Interactive.replWith, Prelude.Interactive.replWith
```

`cast` is an interesting function. (On a sidenote: This is how "implicit" conversions in Scala should always have been done! You see this in `JavaConverters` vs `JavaConversions`, but the idea should be taken further.) The type-class that it comes from seems lawless.

```idris
*08-FirstClassTypes> :doc cast
Prelude.Cast.cast : Cast from to => (orig : from) -> to
    Perform a cast operation.

    The function is Total
```
