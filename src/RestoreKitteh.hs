module RestoreKitteh (restoreKitteh) where

import Web.Scotty.Lucid
import Data.Text
import Lucid
import Lucid.Base

import Types

restoreKitteh :: Html ()
restoreKitteh = html_ ("removeKitteh to be completed")
