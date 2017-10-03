module Main

import Data.Vect

readToBlank : IO (List String)
readToBlank = do
  putStrLn "Enter lines"
  line <- getLine
  if line == ""
    then pure []
    else (line ::) `map` readToBlank

readAndSave : IO ()
readAndSave = do
  lines <- readToBlank
  putStrLn "Enter file name"
  fileName <- getLine
  Right () <- writeFile fileName (unlines lines) | Left err => putStrLn (show err)
  pure ()

readVectFile : (filename : String) -> IO (n ** Vect n String)
readVectFile filename = do
    Right h <- openFile filename Read | Left err => pure (_ ** [])
    Right contents <- readContents h | Left err => pure (_ ** [])
    closeFile h
    pure contents
  where
    readContents : File -> IO (Either FileError (n ** Vect n String))
    readContents h = do
      eof <- fEOF h
      if eof
        then pure (Right (_ ** []))
        else do
          Right str <- fGetLine h | Left err => pure (Left err)
          Right (_ ** rest) <- readContents h | Left err => pure (Left err)
          pure (Right (_ ** str :: rest))
