module Haskell.Transform where

import Data.Text
import qualified Haskell.Types as HT

mkSuccessResponse :: Maybe Text -> a -> HT.Response a
mkSuccessResponse message payload =
  HT.Success
    { message = message
    , payload = payload
    }

mkErrorResponse :: Maybe Text -> String -> HT.Response a
mkErrorResponse message code =
  HT.Failure
    { code = code
    , message = message
    }

mkPersonResponse :: Maybe Text -> HT.Person -> HT.PersonResponse
mkPersonResponse message person = mkSuccessResponse message person

mkPersonResponse' :: Maybe Text -> String -> Int -> HT.PersonResponse
mkPersonResponse' message name age =
  HT.Success
    { message = message
    , payload = HT.Person
      { name = name
      , age = age
      }
    }

mkPerson :: String -> Int -> HT.Person
mkPerson name age =
  HT.Person
    { name = name
    , age = age
    }

mkMessage :: Text -> HT.Message
mkMessage message = HT.Message
  { message = message
  }

data TcpResponse a = HttpResponse
  { httpCode :: String
  , body :: HT.Response a
  }

