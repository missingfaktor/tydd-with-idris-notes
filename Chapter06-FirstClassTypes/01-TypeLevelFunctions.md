> Totality and type-level functions
> In general, it’s best to consider type-level functions in exactly the same way as ordinary functions, as we’ve done so far. This isn’t always the case, though. There are a couple of technical differences that are useful to know about:
> - Type-level functions exist at compile time only. There’s no runtime representation of Type, and no way to inspect a Type directly, such as pattern matching.
> - Only functions that are total will be evaluated at the type level. A function that isn’t total may not terminate, or may not cover all possible inputs. Therefore, to ensure that type-checking itself terminates, functions that are not total are treated as constants at the type level, and don’t evaluate further.

Hmm. I didn't know the "functions that are not total are treated as constants at the type level, and don’t evaluate further" bit. I wonder what its implications are.
