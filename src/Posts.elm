module Posts exposing (..)

import Types exposing (Hero, Content, ContentType(..))
import Authors
import Date.Extra exposing (fromCalendarDate)
import Date exposing (Month(..))
import RemoteData exposing (RemoteData)
import Routing exposing (Route(..))


helloWorld : Content
helloWorld =
    { slug = "/hello-world"
    , route = PostDetailRoute "hello-world"
    , title = "Hello World"
    , name = "hello-world"
    , publishedDate = fromCalendarDate 2017 Sep 25
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , contentType = Post
    , preview = "Hello World in Elm"
    , hero = Hero "images/cover1.jpg" "" ""
    }


posts : List Content
posts =
    [ helloWorld
    ]
