module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)
import Routing exposing (Route(..), parseLocation)
import Navigation exposing (Location)
import RemoteData exposing (RemoteData)
import ContentUtils
import Types exposing (Content)
import FetchContent
import Config exposing (heroInfoInit)
import Array exposing (Array)


changeUrlCommand : Model -> Route -> Content -> Cmd Msg
changeUrlCommand model route content =
    case route of
        AboutRoute ->
            FetchContent.fetch content model.url.base_url

        _ ->
            Cmd.none


changeUrlProcedure : Model -> Route -> ( Model, Cmd Msg )
changeUrlProcedure model route =
    case getContentForRoute route of
        Nothing ->
            ( { model | route = NotFoundRoute }, Navigation.modifyUrl (model.url.base_url ++ "/404") )

        Just content ->
            let
                newContent =
                    { content | markdown = RemoteData.Loading }

                newCmd =
                    changeUrlCommand model route newContent
            in
                ( { model
                    | currentContent = newContent
                    , route = route
                  }
                , newCmd
                )


getContentForRoute : Route -> Maybe Content
getContentForRoute =
    ContentUtils.findByRoute ContentUtils.allContent


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location model.url.base_url
            in
                changeUrlProcedure
                    model
                    newRoute

        NewUrl url ->
            model
                ! [ Navigation.newUrl url
                  ]

        FetchedContent response ->
            let
                currentContent =
                    model.currentContent

                newContent =
                    { currentContent | markdown = response }
            in
                ( { model | currentContent = newContent }
                , Cmd.none
                )

        UpdateSliderIdx ->
            let
                totalSliders =
                    Array.length heroInfoInit

                newIdx =
                    (model.ui.sliderIdx + 1) % totalSliders

                newUi =
                    Ui newIdx
            in
                ( { model | ui = newUi }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
