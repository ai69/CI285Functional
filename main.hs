{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

import       Data.Text (Text, unpack)
import       Yesod

data App = App

mkYesod "App" [parseRoutes|
/              HomeR GET
/add/#Int/#Int AddR GET
/sub/#Int/#Int SubR GET
/mul/#Int/#Int MultR GET
/div/#Int/#Int DivR GET
-- /pi/#Int/#Int	PiR GET

|]

instance Yesod App

getHomeR :: Handler TypedContent
getHomeR = selectRep $ do
    provideRep $ defaultLayout $ do
        [shamlet|
<p>Welcome to Azhar's Calculator|]
 
getAddR :: Int -> Int -> Handler TypedContent
getAddR x y = selectRep $ do
     provideRep $ return
         [shamlet|
               <p>#{res}
         |]
     provideJson res
   where
     res = x + y

getSubR :: Int -> Int -> Handler TypedContent
getSubR x y = selectRep $ do
     provideRep $ return
         [shamlet|
               <p>#{res}
         |]
     provideJson res
   where
     res = x - y

getMultR :: Int -> Int -> Handler TypedContent
getMultR x y = selectRep $ do
     provideRep $ return
         [shamlet|
               <p>#{res}
         |]
     provideJson res
   where
     res = x * y

getDivR :: Int -> Int -> Handler TypedContent
getDivR x y = selectRep $ do
     provideRep $ return
         [shamlet|
               <p>#{res}
         |]
     provideJson res
   where
     res = x `div` y

{-getPiR :: Int -> Int -> Handler TypedContent
getPiR x y = selectRep $ do
     provideRep $ return
         [shamlet|
               <p>#{res}
         |]
     provideJson res
   where
     res = x * y
   where 
      y = 3.14159265359
-}
{-
getHomeR :: Handler Value
getHomeR = returnJson $ Person
-}
main :: IO ()
main = warp 3000 App
