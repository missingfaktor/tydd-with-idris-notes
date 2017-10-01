> TOTAL FUNCTIONS AND LONG-RUNNING PROGRAMS
>
> A total function is guaranteed to produce a finite prefix of a potentially infinite result. As you’ll see in chapter 11, you can write command shells or servers as total functions that guarantee a response for every user input, indefinitely.

I always had this question of how long/forever running processes are managed under a total system. I do not comprehend what "finite prefix" above means. Eagerly looking forward to chapter 11. (Long way to go!)

> Total functions and the halting problem
>
> The halting problem is the problem of determining whether a program terminates for some specific input. Thanks to Alan Turing, we know that it’s not possible to write a program that solves the halting problem in general. Given this, it’s reasonable to wonder how Idris can determine that a function is total, which is essentially checking that a function terminates for all inputs.
>
> Although it can’t solve the problem in general, Idris can identify a large class of functions that are definitely total. You’ll learn more about how it does so, along with some techniques for writing total functions, in chapters 10 and 11.

Hmm. :spaghetti:
