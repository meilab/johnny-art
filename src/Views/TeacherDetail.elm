module Views.TeacherDetail exposing (teacherDetailView)

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
import Teachers exposing (teachers)


teacherDetailView : Model -> Html Msg
teacherDetailView model =
    let
        heroCss =
            height (vh 100)
    in
        div [ css [ width (pct 100) ] ]
            [ hero
                model.currentContent.hero
                heroCss
            , content model
            ]


content : Model -> Html Msg
content model =
    let
        teacher =
            Teachers.teachers
                |> List.filter (\item -> item.route == model.currentContent.route)
                |> List.head
                |> Maybe.withDefault Teachers.ww
    in
        div [ css [ contentContainerCss ] ]
            [ h1 [ css [] ] [ text teacher.name ]

            --, renderPageMeta model.currentContent
            , renderMarkdown model.currentContent.markdown
            ]
