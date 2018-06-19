module Views exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick, onInput)
import Messages exposing (Msg(..))
import Models exposing (..)
import ViewHelpers exposing (..)
import Types exposing (..)
import RemoteData exposing (WebData, RemoteData(..))
import Routing exposing (Route(..))
import Views.SharedViews exposing (renderFooter)
import Views.Teachers exposing (teachersView)
import Views.Courses exposing (coursesView)
import Views.Home exposing (homeView)
import Views.About exposing (aboutView)
import Views.Join exposing (joiningView)
import Views.Page exposing (pageView)
import Views.TeacherDetail exposing (teacherDetailView)
import Views.SharedViews exposing (hero)


view : Model -> Html Msg
view model =
    let
        contentView =
            case model.route of
                HomeRoute ->
                    homeView model

                AboutRoute ->
                    aboutView model

                CoursesRoute ->
                    coursesView model

                TeachersRoute ->
                    teachersView model

                JoinRoute ->
                    joiningView

                TeacherDetailRoute slug ->
                    teacherDetailView model

                _ ->
                    pageView model
    in
        div
            [ css
                [ displayFlex
                , flexDirection column
                , alignItems center
                , width (pct 100)
                ]
            ]
            [ headerNav model

            --, promotion
            , contentView
            , renderFooter
            ]


promotion : Html Msg
promotion =
    div
        [ css
            [ width (pct 100)
            , backgroundColor (hex "#333")
            , color (hex "#F4DFD0")
            , padding2 (px 5) (px 25)
            , textAlign center
            , fontWeight (int 300)
            , fontSize (Css.rem 1.15)
            ]
        ]
        [ text "夏季促销：即日起报名小小主持人暑期班享受折扣优惠" ]
