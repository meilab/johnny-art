module Models exposing (..)

import Routing exposing (Route)
import Types exposing (Content)
import Contents


type alias Url =
    { base_url : String }


type alias Ui =
    { sliderIdx : Int
    }


type alias Model =
    { route : Route
    , url : Url
    , ui : Ui
    , currentContent : Content
    }


initialModel : Route -> Url -> Model
initialModel route url =
    { route = route
    , url = url
    , ui = Ui 1
    , currentContent = Contents.home
    }
