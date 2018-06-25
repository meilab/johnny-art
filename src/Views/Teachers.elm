module Views.Teachers exposing (teachersView)

import Models exposing (..)
import Teachers exposing (teachers, consultants)
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
            (teachers
                ++ consultants
                |> List.map (renderTeacher model.url.base_url)
            )
        ]


renderTeacher : String -> Teacher -> Html Msg
renderTeacher base_url teacher =
    let
        slug =
            teacher.slug

        onClickCmd =
            (NewUrl (base_url ++ slug))
    in
        div
            [ css [ gridItem ] ]
            [ img
                [ src teacher.introPic
                , onClick onClickCmd
                , css [ cursor pointer ]
                ]
                []
            , div [ css [ columnGrid ] ]
                [ span [] [ text teacher.blog ]
                , span [] [ text teacher.email ]
                ]
            ]
