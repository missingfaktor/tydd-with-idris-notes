module Main

import Data.Vect

data DataStore : Type where
  MakeDataStore : (size : Nat) -> (items : Vect size String) -> DataStore

size : DataStore -> Nat
size (MakeDataStore size' items') = size'

items : (store : DataStore) -> Vect (size store) String
items (MakeDataStore size' items') = items'

addToStore : DataStore -> String -> DataStore
addToStore (MakeDataStore size items) newItem = MakeDataStore _ (addToData items)
  where
    addToData : Vect oldSize String -> Vect (S oldSize) String
    addToData []               = [newItem]
    addToData (item :: items') = item :: addToData items' -- I can't use `items` here. Looks like a bug.

data Command : Type where
  Add : String -> Command
  Get : Integer -> Command
  Size : Command
  Search : String -> Command
  Quit : Command

parseCommand : String -> String -> Maybe Command
parseCommand "add"   str    = Just (Add str)
parseCommand "get"   val    = case all isDigit (unpack val) of
                                   False => Nothing
                                   True  => Just (Get (cast val))
parseCommand "quit"   ""    = Just Quit
parseCommand "size"   ""    = Just Size
parseCommand "search" query = Just (Search query)
parseCommand _        _     = Just Quit

parse : (input : String) -> Maybe Command
parse input = case span (/= ' ') input of
                   (cmd, args) => parseCommand cmd (ltrim args)

getEntry : (position : Integer) -> (store : DataStore) -> Maybe (String, DataStore)
getEntry position store@(MakeDataStore size items) = case integerToFin position size of
                                                          Just validPosition => Just ("Value is " ++ index validPosition items ++ "\n", store)
                                                          Nothing            => Just ("Out of range\n", store)

searchString : (query : String) -> (store : DataStore) -> Maybe (String, DataStore)
searchString query store@(MakeDataStore _ items) =
  let (_ ** matches) = filter (\entry => query `Strings.isInfixOf` entry) items in
  Just ("Matches: " ++ show matches ++ "\n", store)

processInput : DataStore -> String -> Maybe (String, DataStore)
processInput store inp = case parse inp of
                              Nothing => Just ("Invalid command\n", store)
                              Just (Add item) => Just ("ID " ++ show (size store) ++ "\n", addToStore store item)
                              Just (Get position) => getEntry position store
                              Just (Search query) => searchString query store
                              Just Size => Just ("Size is " ++ show (size store) ++ "\n", store)
                              Just Quit => Nothing

main : IO ()
main = replWith (MakeDataStore _ []) "Enter a command: " processInput
