Idris REPL is similar to those of Scala and Haskell, with some important differences.

### The usual suspects are supported:

- `:t` tells you type of the expression.
- `:module` imports a module.
- `:let` allows you to add definitions.
- `:q` quits the REPL.

### There are some additional niceties:

- Syntax highlighting. Yay!
- Idris supports documentation comments (à la Javadocs), and you can retrieve them with `:doc`.
- `:core` gives you insights into internal representations of data types and functions.
- `:total` checks if a function is total.
- `:printdef` prints definitions.

### Cons:

- Multi-line code (like with `:{`-`:}` in Haskell REPL, and `:paste` in Scala REPL) does not seem to be supported. This makes defining data types, for instance, messy.
- The REPL feels quite buggy in general. Some examples:

```idris
Idris> :let x = 11

Idris> x
11 : Integer

Idris> :let f x = x + 1

Idris> f 12
Too many arguments for f

Idris> f
12 : Integer

Idris> :let f = \x => x + 1

Idris> f 12
13 : Integer

Idris> :module Data.Vect

*Data/Vect> :let y: Fin 8 = 6

*Data/Vect> :let z: Fin 9 = y

*Data/Vect> z
(input):Can't infer argument y to z
```
