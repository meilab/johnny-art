module Views.Courses exposing (coursesView)

import Models exposing (..)
import Courses exposing (courses)
import Messages exposing (Msg(..))
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Types exposing (Course)
import ViewHelpers exposing (formatDate, externalLink)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)


coursesView : Model -> Html Msg
coursesView model =
    let
        heroCss =
            height (vh 60)
    in
        div [ css [ columnGrid, width (pct 100) ] ]
            [ hero
                model.currentContent.hero
                heroCss
            , content model
            ]


content : Model -> Html Msg
content model =
    div [ css [ contentContainerCss ] ]
        [ div [ css [ rowGrid ] ]
            (courses
                |> List.map (renderCourse model.url.base_url)
            )
        ]


renderCourse : String -> Course -> Html Msg
renderCourse base_url course =
    let
        slug =
            course.slug

        onClickCmd =
            (NewUrl (base_url ++ slug))
    in
        div
            [ css [ gridItem ]
            , onClick onClickCmd
            ]
            [ img
                [ src course.introPic
                , onClick onClickCmd
                , css [ cursor pointer ]
                ]
                []
            , h2 [] [ text course.title ]
            , div [ css [ columnGrid ] ]
                []
            ]
