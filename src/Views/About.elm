module Views.About exposing (aboutView)

import Models exposing (..)
import Authors
import Messages exposing (Msg(..))
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)


aboutView : Model -> Html Msg
aboutView model =
    let
        heroCss =
            height (vh 60)
    in
        div [ css [ width (pct 100) ] ]
            [ hero
                model.currentContent.hero
                heroCss
            , content model
            ]


content : Model -> Html Msg
content model =
    div [ css [ contentContainerCss ] ]
        [ h1 [ css [] ] [ text model.currentContent.title ]

        --, renderPageMeta model.currentContent
        , renderMarkdown model.currentContent.markdown
        ]
