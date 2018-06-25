module Types exposing (..)

import Date exposing (Date)
import RemoteData exposing (WebData)
import Routing exposing (Route)


type alias Author =
    { name : String
    , avatar : String
    , email : String
    , bio : String
    , blog : String
    , location : String
    , github : String
    }


type alias ParentReview =
    { name : String
    , kidName : String
    , role : String
    , avatar : String
    , comment : String
    }


type alias KidReview =
    { name : String
    , avatar : String
    , comment : String
    }


type alias Hero =
    { srcUrl : String
    , title : String
    , des : String
    }


type ContentType
    = Page
    | AuthorPage
    | TeacherPage
    | CoursePage
    | Post


type alias Content =
    { title : String
    , name : String
    , slug : String
    , route : Route
    , publishedDate : Date
    , author : Author
    , markdown : WebData String
    , contentType : ContentType
    , preview : String
    , hero : Hero
    }


type alias Teacher =
    { name : String
    , avatar : String
    , introPic : String
    , email : String
    , route : Route
    , slug : String
    , bio : String
    , blog : String
    , tags : List String
    }


type alias Course =
    { title : String
    , name : String
    , slug : String
    , route : Route
    , videoUrl : String
    , teachers : List Teacher
    , markdown : WebData String
    , preview : String
    , hero : Hero
    , introPic : String
    , poster : String
    }


type alias Feature =
    { name : String
    , detail : String
    , icon : String
    , pic : String
    , slug : String
    , route : Route
    }


type alias ExternalContent =
    { title : String
    , name : String
    , slug : String
    , publishedDate : Date
    , author : Author
    , intro : String
    }
