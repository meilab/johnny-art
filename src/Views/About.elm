module Views.About exposing (aboutView)

import Models exposing (..)
import Authors
import Messages exposing (Msg(..))
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Types exposing (Author)
import ViewHelpers exposing (formatDate, externalLink)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)


aboutView : Model -> Html Msg
aboutView model =
    div
        [ css [ contentContainerCss ]
        ]
        [ renderMarkdown
            model.currentContent.markdown
        ]
