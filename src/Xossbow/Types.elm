----------------------------------------------------------------------
--
-- Types.elm
-- Xossbow shared types
-- Copyright (c) 2017 Bill St. Clair <billstclair@gmail.com>
-- Some rights reserved.
-- Distributed under the MIT License
-- See LICENSE.txt
--
----------------------------------------------------------------------

module Xossbow.Types exposing ( Node, nodeVersion, emptyNode
                              , ContentType (..)
                              , Plist, get
                              )

import Time exposing ( Time )

nodeVersion : Int
nodeVersion =
    1

type alias Node =
    { version : Int
    , plist : Plist
    , title : String
    , path : String
    , author : String
    , time : Time
    , contentType : ContentType
    , content : String
    }

emptyNode : Node
emptyNode =
    { version = nodeVersion
    , plist = []
    , title = "Hello"
    , path = "hello"
    , author = "Bill St. Clair"
    , time = -433540800000 + (8 * 3600 * 1000)
    , contentType = Markdown
    , content = "Hello, Xossbow!"
    }

type ContentType
    = Json
    | Markdown
    | Text
    | Code

type alias Plist =
    List (String, String)

get : String -> Plist -> Maybe String
get key plist =
    case plist of
        [] ->
            Nothing
        (k, v) :: rest ->
            if key == k then
                Just v
            else
                get key rest