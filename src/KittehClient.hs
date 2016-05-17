{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module KittehClient 
  (kittyMenu) where

import Web.Scotty.Lucid
import Data.Text
import Lucid
import Lucid.Base


import AddKitteh
import Types

kittyMenu :: Html ()
kittyMenu = template "hello world " $ do
  h1_ "We like kitteh pics"
  with form_ [method_ "post", action_ "/radio_buttons"] $ do
    addButton "Add"     (toHtml Add)
    addButton "Edit"    (toHtml Edit)
    addButton "Remove"  (toHtml Remove)
    addButton "List"    (toHtml List)
    addButton "View"    (toHtml View)
    addButton "Restore" (toHtml Restore)  
    button_ [type_ "submit"] "Select Action" 

template :: Html () -> Html () -> Html ()
template title body = 
  html_ $ do
    head_ $ title_ title
    body_ body

addButton :: Text -> Html () -> Html ()
addButton button label = do
  input_ [type_ "radio", name_ "selection", value_ button]
  label_ label
