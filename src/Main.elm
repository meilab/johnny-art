module Main exposing (..)

import Views exposing (view)
import Messages exposing (Msg(..))
import Update exposing (..)
import Models exposing (..)
import Navigation
import Routing exposing (parseLocation)
import Time exposing (Time)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick, onInput)


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }


ghProjectName : String
ghProjectName =
    "johnny-art"


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        base_url =
            case
                location.pathname
                    |> String.split "/"
                    |> List.member ghProjectName
            of
                True ->
                    "/" ++ ghProjectName

                False ->
                    ""

        currentRoute =
            parseLocation location base_url

        url =
            { base_url = base_url }
    in
        changeUrlProcedure (initialModel currentRoute url)
            currentRoute


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (Time.second * 3) (always UpdateSliderIdx)
