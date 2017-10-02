module Main

myRepl : (greet: String) -> (evaluate: String -> String) -> IO ()
myRepl greet evaluate = do
  putStrLn greet
  read' <- getLine
  let out = evaluate read'
  putStrLn out
  myRepl greet evaluate

myReplWith : (currentState: a) ->
             (greet: String) ->
             (evaluate: a -> String -> Maybe (String, a)) ->
             IO ()
myReplWith currentState greet evaluate = do
  putStrLn greet
  read' <- getLine
  case evaluate currentState read' of
       Just (out, changedState) => do
         putStrLn out
         myReplWith changedState greet evaluate
       Nothing =>
         return ()

myRepl' : (greet: String) -> (evaluate: String -> String) -> IO ()
myRepl' greet evaluate = myReplWith () greet (\_, s => Just (evaluate s, ()))
