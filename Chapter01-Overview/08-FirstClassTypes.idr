module FirstClassTypes

StringOrInt : Bool -> Type
StringOrInt False = String
StringOrInt True  = Int

getStringOrInt : (b: Bool) -> StringOrInt b
getStringOrInt False = "Namaste!"
getStringOrInt True  = 12

valToString : (b: Bool) -> StringOrInt b -> String
valToString False x = x
valToString True x  = cast x
