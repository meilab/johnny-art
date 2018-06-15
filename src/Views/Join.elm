module Views.Join exposing (joiningView)

import Models exposing (..)
import Authors
import Messages exposing (Msg(..))
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)


joiningView : Html Msg
joiningView =
    div
        [ css [ contentContainerCss ]
        ]
        []
