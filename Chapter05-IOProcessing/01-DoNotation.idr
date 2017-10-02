module DoNotation

printLonger : IO ()
printLonger = do
  putStrLn "\nFirst string:"
  l1 <- getLine
  putStrLn "\nSecond string:"
  l2 <- getLine
  putStrLn $ show $ max (length l1) (length l2)  
