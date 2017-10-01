module Vehicle

%default total

data PowerSource: Type where
  Petrol: PowerSource
  Pedal: PowerSource

data Vehicle : PowerSource -> Type where
  Bicycle : Vehicle Pedal
  Unicycle : Vehicle Pedal
  Motorcycle : (fuel : Nat) -> Vehicle Petrol
  Car : (fuel : Nat) -> Vehicle Petrol
  Bus : (fuel : Nat) -> Vehicle Petrol

wheels : Vehicle _ -> Nat
wheels Bicycle        = 2
wheels (Car _)        = 4
wheels (Bus _)        = 4
wheels Unicycle       = 1
wheels (Motorcycle _) = 2 -- I just discovered you can hit Ctrl+Alt+A to
                          -- generate cases for newly added data constructors!

refuel : Vehicle Petrol -> Vehicle Petrol
refuel (Car _)              = Car 100
refuel (Bus _)              = Bus 100
refuel (Motorcycle fuel)    = Motorcycle 100
refuel Bicycle              impossible
refuel Unicycle             impossible
                           -- Idris does not generate this case on case-split.
                           -- One can still add "impossible" cases for
                           -- documentation, and explicitly mark them as
                           -- `impossible`, and Idris will check for you that
                           -- they indeed are.


-- NEW TERMINOLOGY!
--
-- Type family:
-- "Dependent data types like Vehicle are therefore sometimes referred to as
-- families of types, because you’re defining multiple related types at the
-- same time. The power source is an index of the Vehicle family. The index
-- tells you exactly which Vehicle type you mean."
--
-- Index: (Seems like a loose term)
-- "A parameter is unchanged across the entire structure. In this (Vect) case,
-- every element of the vector has the same type.
-- An index may change across a structure. In this case, every subvector has a
-- different length."
