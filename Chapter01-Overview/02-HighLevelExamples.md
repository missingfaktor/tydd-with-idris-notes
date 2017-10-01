Matrix data type, with dimensions as part of its type. More to come in later chapters.

## State machines:

> State machines are often present, implicitly, in real-world systems. For example, when you open, read, and then close a file, you change the state of the file with the open and close operations. As you’ll see in chapter 13, types allow you to make these state changes explicit, guarantee that you’ll execute operations only when they’re valid, and help you use resources correctly.

> By defining valid state transitions explicitly in types, you get strong and machine-checkable guarantees about the correctness of their implementation.

## Concurrency:

> [..] if you can express the coordination between processes in types, you can be sure that a concurrent program that type-checks has properly coordinated processes.
