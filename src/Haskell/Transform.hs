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
mkPersonResponse = mkSuccessResponse
