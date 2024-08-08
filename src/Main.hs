module Main where

import           Haskell.Basic     as HB
import           Haskell.Compute   as HC
import           Haskell.Transform as HT

-- JAF:The function 'main' declared in Haskell is an IO action that executes a sequence of operations. It starts by creating a
-- list 'l' of integers, calculates its length using 'listLength' function from a hypothetical module 'HB', and then
-- computes the sum of two given numbers 'a' and 'b' using 'add' function from another hypothetical module 'HC'. After
-- these calculations, it prints out a greeting message followed by the results of the length of the list and the sum of
-- the two numbers to the standard output.
main :: IO ()
main = do
  let l = [1,2,3,44,5,6,7,7,7,65,54]
      length = HB.listLength l
  let a = 5
      b = 6
      result = HC.add a b
  putStrLn "Hello, Haskell!"
  putStrLn (show length)
  putStrLn (show result)
  let person = HT.mkPerson "Priyansh" 23
      response = HT.mkSuccessResponse (Just "Success") person
  print response

