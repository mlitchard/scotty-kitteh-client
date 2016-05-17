{-# LANGUAGE OverloadedStrings #-}
module Types
  (Buttons (..)
  ,Status (..)
  ) where

import Lucid.Base
import Web.Scotty

data Buttons = Add 
             | Edit
             | Remove
             | List
             | View
             | Restore
               deriving (Show, Read, Eq)

data Status = OFFLINE | ONLINE deriving Show

instance ToHtml Status where
  toHtml    = toHtml . show 
  toHtmlRaw = toHtmlRaw . show

instance ToHtml Buttons where
  toHtml    = toHtml . show 
  toHtmlRaw = toHtmlRaw . show 

instance Parsable Buttons where
  parseParam = readEither
