> import Average will import the definitions from Average.idr, provided that Average.idr is either in the current directory or in some other path that Idris can find.
> import Utils.Average will import the definitions from Average.idr in a subdirectory called Utils, provided that the file and subdirectory exist.

Idris module system does not seem to be very powerful. It's just flat namespaces.

> Modules themselves can be combined into packages and distributed separately. [..] You can learn more about packages and how to create your own from the Idris package documentation at http://idris-lang.org/documentation/packages.

I have to remember this usage of the term "package".
