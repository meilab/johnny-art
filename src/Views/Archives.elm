module Views.Archives exposing (archiveView)

import Models exposing (..)
import Messages exposing (Msg(..))
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Types exposing (Content)
import Posts exposing (posts)
import ContentUtils exposing (filterByTitle, filterByTag)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)


archiveView : Model -> Html Msg
archiveView model =
    renderArchives model


renderArchives : Model -> Html Msg
renderArchives model =
    div [ css [ contentContainerCss ] ]
        []
