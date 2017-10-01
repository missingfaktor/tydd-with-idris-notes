Idris' tuples are basically `HList`s!

```idris
*05-LocalDefinitions> (2, "hello", 1) == (2, ("hello", 1))
True : Bool
```

--

Idris inherits Haskell's strangely specific and arguably unnecessary set of syntaxes for list.

```idris
*05-LocalDefinitions> [1..5]
[1, 2, 3, 4, 5] : List Integer
*05-LocalDefinitions> [1,3..9]
[1, 3, 5, 7, 9] : List Integer
```

--

The list syntax is overloaded for any type with data constructors `[]` and `::`.

--

Overloading functions: Idris seems to do this **a lot**. I find it a bit strange considering the fact that some loud typed functional programmers waged a war against function/method overloading a few years ago, and decreed the feature absurd. Some innocent learners asked a fair question, "but having to remember fewer names is surely a good thing?", but were dismissed. Turns out they were right after all, and the loud TFPers, wrong.

[This SO thread](https://stackoverflow.com/questions/2510108/why-avoid-method-overloading) brings back memories.
