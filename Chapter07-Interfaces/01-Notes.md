These are practically the same as type-classes in Haskell, with two differences:

1. Interfaces in Idris can be parameterised by values of any type, and are not limited to types or type constructors. Which is to be expected. 2. They can have multiple implementations.

A few things that are not clear to me:
1. Implementations cannot be pramaterised by types of functions computing types, just by names introduced by `data` or `record` or by primitive types. Why?
2. We can define multiple implementations of an interface. What are the implications of this? Does this just mean orphan instances by default? Does this mean we can optionally name implementations, and choose to pass a specific one explicitly? Does this mean coherence is not guaranteed?
3. Why does Idris use the same notation as Haskell's type-classes, when, clearly (IMO), Agda-like notation would have been superior? In Agda, these are called instance arguments, which are the same thing as implicit arguments, except with a special dedicated resolution algorithm. They show implicit arguments like `{ duh : Duh }`, and instance arguments with `{{ duh : Duh }}`.
