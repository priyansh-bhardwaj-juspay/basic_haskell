module Haskell.Types where

import Data.Text

data Person = Person
  { name :: String
  , age :: Int  
  }

data Days = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday  

data Response a = Success
  { message :: Maybe Text
  , payload :: a
  }
  | Failure
  { code :: String
  , message :: Maybe Text
  }

type PersonResponse = Response Person

newtype Message = Message
  { message :: Text
  }
