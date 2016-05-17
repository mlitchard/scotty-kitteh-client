{-# LANGUAGE OverloadedStrings, QuasiQuotes #-}
module Interface (runApp, app) where

import           Data.Aeson (Value(..), object, (.=))
import           Network.Wai (Application)
import           Data.List
import           Lucid
import           Web.Scotty.Lucid
import qualified Web.Scotty as S

import           KittehClient
import           Types
import           AddKitteh
import           EditKitteh
import           ListKitteh
import           RemoveKitteh
import           RestoreKitteh
import           ViewKitteh

app' :: S.ScottyM ()
app' = do
  S.get "/kitteh-pics"    (lucid kittyMenu)
  S.post "/radio_buttons" buttonAction
    --lucid kittyButtons
    
buttonAction = do
  action <- S.param "selection"
  case (lookup action function_map) of
    (Just app_function) -> lucid app_function
    Nothing             -> oopsie 


oopsie = do
  S.html $ "Tell Michael that he hasn't built out all the functionality yet\n"

function_map = [(Add,addKitteh)
               ,(Edit,editKitteh)
               ,(Remove,removeKitteh)
               ,(List,listKittehs)
               ,(View,viewKitteh)
               ,(Restore,restoreKitteh)
              ]

app :: IO Application
app = S.scottyApp app'

runApp :: IO ()
runApp = S.scotty 8080 app'
