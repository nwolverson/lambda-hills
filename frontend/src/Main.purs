module Main where

import Prelude

import Control.Monad.Aff (launchAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION)
import Network.HTTP.Affjax (AJAX, AffjaxResponse, get)

main :: forall e. Eff (console :: CONSOLE, exception :: EXCEPTION, ajax :: AJAX | e) Unit
main = void $ launchAff do
  msg :: AffjaxResponse String <- get "https://2x2m0fmfse.execute-api.eu-west-1.amazonaws.com/dev/hello"
  liftEff $ log msg.response
