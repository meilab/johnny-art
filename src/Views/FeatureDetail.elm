module Views.FeatureDetail exposing (featureDetailView)

import Models exposing (..)
import Authors
import Messages exposing (Msg(..))
import Css exposing (..)
import Css.Colors exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Types exposing (Teacher)
import ViewHelpers exposing (formatDate, externalLink)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)
import Teachers exposing (teachers)


featureDetailView : Model -> Html Msg
featureDetailView model =
    let
        heroCss =
            height (vh 100)

        teacher =
            Teachers.teachers
                |> List.filter (\item -> item.route == model.currentContent.route)
                |> List.head
                |> Maybe.withDefault Teachers.ww
    in
        div [ css [ width (pct 100) ] ]
            [ hero
                model.currentContent.hero
                heroCss
            , renderInfo teacher
            , renderCourse teacher
            ]


renderInfo : Teacher -> Html Msg
renderInfo teacher =
    div
        [ css
            [ backgroundColor (rgba 0 0 0 0.8)
            , maxWidth (px 650)
            , margin2 zero (pct 5)
            , padding2 (px 20) (px 25)
            , position absolute
            , top (pct 30)
            ]
        ]
        [ div
            [ css [ columnGrid, color white ] ]
            [ img
                [ src teacher.avatar
                , css [ avatarImgCss, width (Css.em 8), height (Css.em 8) ]
                ]
                []
            , p [ css [ fontSize (Css.em 1.25), fontWeight (int 700) ] ] [ text teacher.name ]
            , div [ css [ columnGrid ] ] (teacher.tags |> List.map renderTeacherTags)
            ]
        ]


renderTeacherTags : String -> Html Msg
renderTeacherTags tag =
    div [ css [ paddingTop (px 10) ] ]
        [ text tag ]


renderCourse : Teacher -> Html Msg
renderCourse teacher =
    div []
        []
