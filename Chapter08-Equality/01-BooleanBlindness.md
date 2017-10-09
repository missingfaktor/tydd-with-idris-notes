This is by far the most intense chapter in the book!

> You can use first-class types to increase the precision of your types, and to increase confidence in functions behaving correctly, is to write types specifically to express properties of data and the relationships between data.

```idris
(==) : Eq ty => ty -> ty -> Bool
```

`(==)` returns a `Bool`. It says nothing about the relationships among its inputs. Idris type-checker learns nothing from this test. This is traditionally called "boolean blindness".

We can do better.
