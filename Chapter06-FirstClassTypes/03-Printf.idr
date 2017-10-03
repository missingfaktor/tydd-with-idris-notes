module Main

data Format : Type where
  Number : Format -> Format
  Str : Format -> Format
  Chr : Format -> Format
  Real : Format -> Format
  Lit : String -> Format -> Format
  End : Format

PrintfType : Format -> Type
PrintfType (Number fmt)  = (i : Int) -> PrintfType fmt
PrintfType (Str fmt)     = (str : String) -> PrintfType fmt
PrintfType (Chr fmt)     = (ch : Char) -> PrintfType fmt
PrintfType (Real fmt)    = (d : Double) -> PrintfType fmt
PrintfType (Lit str fmt) = PrintfType fmt
PrintfType End           = String

printfFmt : (fmt : Format) -> (acc : String) -> PrintfType fmt
printfFmt (Number fmt)  acc = \i => printfFmt fmt (acc ++ show i)
printfFmt (Str fmt)     acc = \str => printfFmt fmt (acc ++ str)
printfFmt (Chr fmt)     acc = \chr => printfFmt fmt (acc ++ show chr)
printfFmt (Real fmt)    acc = \real => printfFmt fmt (acc ++ show real)
printfFmt (Lit lit fmt) acc = printfFmt fmt (acc ++ lit)
printfFmt End           acc = acc

toFormat : (xs : List Char) -> Format
toFormat [] = End
toFormat ('%' :: 'd' :: chars) = Number (toFormat chars)
toFormat ('%' :: 's' :: chars) = Str (toFormat chars)
toFormat ('%' :: 'c' :: chars) = Chr (toFormat chars)
toFormat ('%' :: 'f' :: chars) = Real (toFormat chars)
toFormat (c :: chars)          = case toFormat chars of
                                      Lit lit chars' => Lit (strCons c lit) chars'
                                      fmt            => Lit (strCons c "") fmt
