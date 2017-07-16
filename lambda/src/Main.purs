module Main where

import Prelude

import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (Error)
import Control.Monad.Eff.Uncurried (EffFn2, EffFn3, mkEffFn3, runEffFn2)
import Data.Foreign (Foreign, toForeign)
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)

foreign import data Context :: Type

type LambdaFn eff = EffFn3 eff Foreign Context (EffFn2 eff (Nullable Error) Foreign Unit) Unit

handler :: forall eff. LambdaFn (console :: CONSOLE | eff)
handler = mkEffFn3 \_ _ cb -> do
  runEffFn2 cb (toNullable Nothing) (toForeign "Hello from PureScript")
  log $ "PureScript handler!"
