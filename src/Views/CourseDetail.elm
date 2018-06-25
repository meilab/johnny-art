module Views.CourseDetail exposing (courseDetailView)

import Models exposing (..)
import Authors
import Messages exposing (Msg(..))
import Css exposing (..)
import Css.Colors exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src, seamless)
import Html.Styled.Events exposing (onClick)
import Types exposing (Course)
import ViewHelpers exposing (formatDate, externalLink)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)
import Courses exposing (courses)


courseDetailView : Model -> Html Msg
courseDetailView model =
    let
        course =
            Courses.courses
                |> List.filter (\item -> item.route == model.currentContent.route)
                |> List.head
                |> Maybe.withDefault Courses.xiaozhuchi
    in
        div [ css [ columnGrid, width (pct 100), top (px 64) ] ]
            [ renderInfo course
            ]


renderInfo : Course -> Html Msg
renderInfo course =
    div
        [ css
            [ backgroundColor (rgba 0 0 0 0.8)
            , width (pct 100)
            , height (vh 100)
            , margin2 zero (pct 5)
            , padding2 (px 20) (px 25)
            ]
        ]
        [ iframe
            [ --, allowfullscreen True
              --, frameborder zero
              css
                [ width (pct 100)
                , height (pct 90)
                , borderWidth (px 0)
                ]
            , seamless True
            , src course.videoUrl

            --, src "http://v.qq.com/iframe/player.html?vid=k0015trfczz&amp;width=100vw&amp;height=100vh&amp;auto=0"
            ]
            []
        ]
