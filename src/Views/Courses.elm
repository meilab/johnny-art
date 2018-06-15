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
    div [ css [ contentContainerCss ] ]
        [ div [ css [ columnGrid ] ]
            (courses
                |> List.map renderCourse
            )
        ]


renderCourse : Course -> Html Msg
renderCourse course =
    div
        [ css [ columnGrid ] ]
        [ h1 [] [ text course.name ]
        , div [ css [ columnGrid ] ]
            []
        ]
