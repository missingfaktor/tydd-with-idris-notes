Idris has type and argument erasure.

> It will analyze a program before compiling it so that any arguments that are only used for type checking won’t be present at runtime.

This is an interesting topic. I have heard typed functional programmers argue over years that type-casing is a bad thing, but a few days ago I stumbled upon a Conor McBride posts saying this isn't so.
- https://stackoverflow.com/questions/46129304/why-cant-i-pattern-match-on-a-type-family/46129701#46129701
- https://stackoverflow.com/questions/23220884/why-is-typecase-a-bad-thing/26012264

In [this](https://www.youtube.com/watch?v=AWeT_G04a0A) talk of his, David Christiansen argues that Idris prohibits pattern matching on types because it breaks parametricity (takes away free theorems), and also takes away type erasure, making programs less efficient. He describes a design pattern called "Universe" that can be used to work around this limitation in Idris.
