module Haskell.Types where

import Data.Text

data Person = Person
  { name :: String
  , age :: Int  
  }
  deriving Show

data Days = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday  

data Response a = Success
  { message :: Maybe Text
  , payload :: a
  }
  | Failure
  { code :: String
  , message :: Maybe Text
  }
  deriving Show

data HttpResponse a = HttpResponse
  { httpCode :: String
  , body :: Response a
  }

type PersonResponse = Response Person

newtype Message = Message
  { message :: Text
  }
