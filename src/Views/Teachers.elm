module Views.Teachers exposing (teachersView)

import Models exposing (..)
import Teachers exposing (teachers)
import Messages exposing (Msg(..))
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Types exposing (Teacher)
import ViewHelpers exposing (formatDate, externalLink)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)


teachersView : Model -> Html Msg
teachersView model =
    div [ css [ contentContainerCss ] ]
        [ div [ css [ columnGrid ] ]
            (teachers
                |> List.map renderTeacher
            )
        ]


renderTeacher : Teacher -> Html Msg
renderTeacher teacher =
    div
        [ css [ columnGrid ] ]
        [ h1 [] [ text teacher.name ]
        , h2 [] [ text teacher.bio ]
        , div [ css [ columnGrid ] ]
            [ span [] [ text teacher.blog ]
            , span [] [ text teacher.email ]
            ]
        ]
