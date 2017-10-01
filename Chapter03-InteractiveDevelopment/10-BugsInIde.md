I ran into 2 bugs in only a few minutes. :(

1. If you create your hole like `let x = bar in ?foo`, things work fine. If instead you do `let x = bar in ?foo x`, Ctrl+Alt+L goes bananas. It doesn't take into account the argument already passed. This would have been really nice to have.
2. If you name your hole with an ending prime, like `?transpose'`, then expression search will replace it only until the prime symbol.
