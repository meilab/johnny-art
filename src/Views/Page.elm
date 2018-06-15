module Views.Page exposing (pageView)

import Models exposing (..)
import Authors
import Messages exposing (Msg(..))
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Types exposing (Author)
import ViewHelpers exposing (formatDate, externalLink)
import Styles.SharedStyles exposing (..)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)


pageView : Model -> Html Msg
pageView model =
    div []
        [ hero
            model.currentContent.hero
            (css [])
        , content model
        ]


content : Model -> Html Msg
content model =
    div [ css [ contentContainerCss ] ]
        [ h1 [ css [] ] [ text model.currentContent.title ]

        --, renderPageMeta model.currentContent
        , renderMarkdown model.currentContent.markdown
        ]
