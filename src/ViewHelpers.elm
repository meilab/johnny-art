module ViewHelpers exposing (..)

import Css exposing (..)
import Css.Colors exposing (..)
import Css.Media exposing (minWidth, screen, withMediaQuery)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src, class)
import Html.Styled.Events exposing (onWithOptions)
import Messages exposing (Msg(..))
import Routing exposing (Route, routingItem, urlFor)
import Json.Decode as JD
import Models exposing (Model)
import Date.Extra
import Date exposing (Date)
import Views.SharedStyles exposing (menuItem, linkCss, listedMenu)


navigationOnClick : Msg -> Attribute Msg
navigationOnClick msg =
    onWithOptions "click"
        { stopPropagation = False
        , preventDefault = True
        }
        (JD.succeed msg)


headerNav : Model -> Html Msg
headerNav model =
    div
        [ css
            [ position absolute
            , width (pct 100)
            , padding2 zero (px 10)
            , top (px 10)
            ]
        ]
        [ navigation model
            (css
                [ displayFlex
                , justifyContent center
                , color white
                , textTransform uppercase
                , withMediaQuery [ "screen and (min-width: 48em)" ]
                    [ justifyContent flexStart ]
                ]
            )
            (css [ listedMenu ])
        ]


navigation : Model -> Attribute Msg -> Attribute Msg -> Html Msg
navigation model navClass menuClass =
    nav [ navClass ]
        [ ul [ menuClass ]
            (List.map (navItem model) (routingItem model.url.base_url))
        ]


navItem : Model -> ( String, String, Route, String ) -> Html Msg
navItem model ( title, iconClass, route, slug ) =
    let
        isCurrentLocation =
            model.route == route

        ( onClickCmd, selectedClass ) =
            case ( isCurrentLocation, route ) of
                ( False, route ) ->
                    ( route |> (urlFor model.url.base_url) |> NewUrl
                    , css []
                    )

                _ ->
                    ( NoOp
                    , css []
                    )
    in
        linkItem selectedClass
            onClickCmd
            (css [])
            iconClass
            slug
            title


linkItem : Attribute Msg -> Msg -> Attribute Msg -> String -> String -> String -> Html Msg
linkItem liClass onClickCmd aClass iconClass slug textToShow =
    li
        [ css [ menuItem ]
        , liClass
        ]
        [ a
            [ href slug
            , navigationOnClick (onClickCmd)
            , aClass
            , css
                [ linkCss
                , hover
                    [ color orange ]
                ]
            ]
            [ i [ class iconClass ] []
            , text textToShow
            ]
        ]


normalLinkItem : String -> String -> String -> Html Msg
normalLinkItem base_url slug textToShow =
    linkItem (css [])
        (NewUrl (base_url ++ slug))
        (css [])
        ""
        slug
        textToShow


externalLink : String -> String -> Html Msg
externalLink url textToShow =
    a
        [ css [ linkCss ]
        , href url
        ]
        [ text textToShow ]


footerLinkItem : ( String, String, String ) -> Html Msg
footerLinkItem ( _, iconClass, slug ) =
    li [ css [ menuItem ] ]
        [ a
            [ href slug ]
            [ span [ class "fa-stack fa-lg" ]
                [ i [ class "fa fa-circle fa-stack-2x" ] []
                , i [ class iconClass ] []
                ]
            ]
        ]


formatDate : Date -> String
formatDate =
    Date.Extra.toFormattedString "MMMM ddd, y"
