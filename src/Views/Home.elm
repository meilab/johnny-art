module Views.Home exposing (homeView)

import Models exposing (..)
import Routing exposing (Route(..), urlFor)
import Messages exposing (Msg(..))
import Css exposing (..)
import Css.Colors exposing (..)
import Css.Media exposing (minWidth, screen, withMediaQuery)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, class, href, src)
import Html.Styled.Events exposing (onClick, onInput)
import Reviews exposing (parentsReview, kidsReview)
import Courses exposing (courses)
import Features exposing (features)
import ViewHelpers exposing (formatDate, navigationOnClick, externalLink)
import Views.SharedViews exposing (..)
import Views.SharedStyles exposing (..)
import Types exposing (Hero, Course, Feature, Teacher, ParentReview, KidReview)
import Array exposing (get)
import Config exposing (heroInfoInit)
import Teachers exposing (teachers, consultants)


homeView : Model -> Html Msg
homeView model =
    let
        heroInfo =
            case get model.ui.sliderIdx heroInfoInit of
                Just info ->
                    info

                Nothing ->
                    Hero "" "" ""

        heroCss =
            Css.batch []
    in
        div
            [ css
                [ displayFlex
                , flexDirection column
                , alignItems center
                , width (pct 100)
                ]
            ]
            [ hero
                heroInfo
                heroCss

            --, renderTopQuote
            --, renderCourses model
            , renderFeatures model
            , renderParentsReviews
            , renderKidsReviews
            , renderMembers model.url.base_url
                "教师团队"
                teachers
                (backgroundColor (rgba 255 255 255 0.7))
                (color (hex "#3e3e3e"))
            , renderMembers
                model.url.base_url
                "顾问团队"
                consultants
                (backgroundColor (hex "#303030"))
                (color white)
            , renderCta model.url.base_url

            --, content model
            ]


renderParentsReviews : Html Msg
renderParentsReviews =
    div
        [ css
            [ width (pct 100)
            , backgroundColor (hex "#0a57a3")
            , backgroundImage (linearGradient (stop <| rgba 0 0 0 0) (stop <| rgba 0 0 0 0.5) [])
            , columnGrid
            , padding2 (px 30) zero
            ]
        ]
        [ div
            [ css
                [ maxWidth (px 1200)
                , padding (px 10)
                ]
            ]
            [ h2
                [ css
                    [ color white
                    , marginBottom (px 10)
                    ]
                ]
                [ text "家长怎么说" ]
            , div
                [ css
                    [ rowGrid
                    , justifyContent spaceBetween
                    ]
                ]
                (parentsReview
                    |> List.map renderParentReviewItem
                )
            ]
        ]


renderParentReviewItem : ParentReview -> Html Msg
renderParentReviewItem reviewer =
    div
        [ css
            [ reviewItemCss
            ]
        ]
        [ div
            [ css [ reviewMetaCss ] ]
            [ img [ src reviewer.avatar, css [ avatarImgCss ] ] []
            , div [ css [ columnGrid, flex (int 1) ] ]
                [ text reviewer.name
                , text ":"
                , text (reviewer.kidName ++ "的" ++ reviewer.role)
                ]
            ]
        , blockquote [ css [ blockquoteCss ] ] [ text reviewer.comment ]
        ]


renderKidsReviews : Html Msg
renderKidsReviews =
    div
        [ css
            [ width (pct 100)
            , backgroundColor (hex "#296")
            , backgroundImage (linearGradient (stop <| rgba 0 0 0 0) (stop <| rgba 0 0 0 0.5) [])
            , columnGrid
            , padding2 (px 30) zero
            ]
        ]
        [ div
            [ css
                [ maxWidth (px 1200)
                , padding (px 10)
                ]
            ]
            [ h2 [ css [ color white, marginBottom (px 10) ] ] [ text "学员怎么说" ]
            , div
                [ css
                    [ rowGrid
                    , justifyContent spaceBetween
                    ]
                ]
                (kidsReview
                    |> List.map renderKidReviewItem
                )
            ]
        ]


renderKidReviewItem : KidReview -> Html Msg
renderKidReviewItem reviewer =
    div [ css [ reviewItemCss ] ]
        [ div [ css [ reviewMetaCss ] ]
            [ img [ src reviewer.avatar, css [ avatarImgCss ] ] []
            , div [ css [ columnGrid ] ]
                [ text reviewer.name
                ]
            ]
        , blockquote [ css [ blockquoteCss ] ] [ text reviewer.comment ]
        ]


renderCta : String -> Html Msg
renderCta base_url =
    let
        onClickCmd =
            (NewUrl (base_url ++ "/join"))
    in
        div
            [ css
                [ color white
                , backgroundImage (url "images/cta-bg2.jpg")

                --, backgroundImage (linearGradient (stop2 (hex "#bb4242") <| pct 0) (stop2 (hex "#efab4a") <| pct 100) [])
                --, property "background" "url(\"images/cta-bg.jpg\"), -webkit-radial-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.8))"
                , minHeight (px 600)
                , width (pct 100)
                , backgroundColor (hex "#222")

                --, backgroundAttachment fixed
                , backgroundRepeat noRepeat
                , backgroundSize cover
                , displayFlex
                , flexDirection column
                , justifyContent center
                , alignItems center
                , textAlign center
                ]
            ]
            [ div [ css [ maxWidth (px 600) ] ]
                [ h1 [] [ text "加入约翰尼艺术中心开启艺术之旅吧" ]
                , button
                    [ onClick onClickCmd
                    , css
                        [ backgroundColor (hex "#e66225")
                        , maxWidth (pct 80)
                        , Css.minWidth (px 400)
                        , height (px 80)
                        , color white
                        , borderRadius (px 40)
                        , margin2 zero auto
                        , textDecoration none
                        , hover [ backgroundColor (hex "#e9723b") ]
                        ]
                    ]
                    [ div [ css [ bigBold ] ] [ text "Join Now" ] ]
                ]
            ]


renderTopQuote : Html Msg
renderTopQuote =
    div
        [ css
            [ backgroundColor gray
            , color (hex "#444")
            , width (pct 100)
            ]
        ]
        [ blockquote
            [ css
                [ displayFlex
                , flexDirection column
                , maxWidth (px 768)
                , justifyContent center
                , alignItems center
                ]
            ]
            [ div [ css [ avatarContainerCss ] ]
                [ img
                    [ src "images/avatar/liuyang.jpg"
                    , css [ avatarImgCss ]
                    ]
                    []
                ]
            , div [ css [ columnGrid ] ]
                [ text "约翰尼艺术中心的小小主持人课程给我的体验非常棒，我非常喜欢，老师的课程节奏张弛有度，在轻松愉悦的环境下掌握了知识技能，实战环节的设计很有感觉，总之非常棒。"
                , cite [ css [ margin (px 10) ] ] [ text ("-" ++ "刘洋") ]
                ]
            ]
        ]


renderCourses : Model -> Html Msg
renderCourses model =
    div [ css [ maxWidth (px 768) ] ]
        [ div
            [ css
                [ rowGrid
                , justifyContent spaceBetween
                ]
            ]
            (courses
                |> List.map (renderCourseItem model.url.base_url)
            )
        ]


renderFeatures : Model -> Html Msg
renderFeatures model =
    div [ css [ maxWidth (px 1200) ] ]
        [ div
            [ css
                [ rowGrid
                , justifyContent spaceBetween
                , padding (px 20)
                ]
            ]
            (features
                |> List.map (renderFeatureItem model.url.base_url)
            )
        ]


renderFeatureItem : String -> Feature -> Html Msg
renderFeatureItem base_url feature =
    let
        slug =
            feature.slug

        onClickCmd =
            (NewUrl (base_url ++ slug))
    in
        div
            [ css
                [ columnGrid
                , height (pct 100)
                , flex (pct 90)
                , borderRadius (px 10)
                , margin2 (px 20) zero
                , withMediaQuery [ "screen and (min-width: 48em)" ]
                    [ flex3 (int 0) (int 0) (pct 48)
                    ]
                ]
            ]
            [ img
                [ src feature.pic
                , css
                    [ height auto
                    , width auto
                    , cursor pointer
                    ]
                , href slug
                , navigationOnClick (onClickCmd)
                ]
                []
            , div
                [ css
                    [ rowGrid
                    , minHeight (pct 50)
                    ]
                ]
                [ div
                    [ css
                        [ flex3 (int 0) (int 0) (pct 20)
                        , height (pct 100)
                        , columnGrid
                        , justifyContent flexStart
                        , alignItems center
                        , marginTop (px 20)
                        ]
                    ]
                    [ img [ src feature.icon, css [ iconCss ] ] [] ]
                , div
                    [ css
                        [ flex (int 1)
                        , columnGrid
                        , justifyContent spaceBetween
                        ]
                    ]
                    [ div []
                        [ h3
                            [ css
                                [ color (hex "#21505C")
                                , fontSize (px 23)
                                , fontWeight (int 400)
                                , lineHeight (Css.em 1.6)
                                , margin2 (Css.em 0.3) zero
                                , textAlign left
                                ]
                            ]
                            [ text feature.name ]
                        , p
                            [ css
                                [ fontSize (px 15)
                                , lineHeight (Css.em 1.7)
                                , marginBottom (Css.em 5)
                                ]
                            ]
                            [ text feature.detail ]
                        ]
                    , button
                        [ href slug
                        , navigationOnClick (onClickCmd)
                        , css
                            [ cursor pointer
                            , color (hex "#1797B1")
                            , border3 (px 1) solid (hex "#1797B1")
                            , borderRadius (px 5)
                            , marginBottom (px 25)
                            , width (pct 90)
                            , height (px 30)
                            , textDecoration none
                            , hover
                                [ backgroundColor (hex "#1797B1")
                                , color white
                                ]
                            ]
                        ]
                        [ text "Learn More" ]
                    ]
                ]
            ]


renderCourseItem : String -> Course -> Html Msg
renderCourseItem base_url course =
    let
        slug =
            course.slug

        onClickCmd =
            (NewUrl (base_url ++ slug))
    in
        div [ css [ gridItem ] ]
            [ a
                [ href slug
                , navigationOnClick (onClickCmd)
                ]
                [ h2 [ css [ bigTitle ] ] [ text course.title ]
                , img
                    [ src course.introPic
                    , css [ maxWidth (pct 100), height (px 400), width auto ]
                    ]
                    []
                ]

            --, renderTeachers base_url course.teachers
            ]


renderMembers : String -> String -> List Teacher -> Style -> Style -> Html Msg
renderMembers base_url info members bgCss colorCss =
    div [ css [ columnGrid, width (pct 100), bgCss ] ]
        [ div
            [ css
                [ maxWidth (pct 80)
                , columnGrid
                , alignItems flexStart
                , padding2 (px 20) zero
                , colorCss
                ]
            ]
            [ div [ css [ fontSize (Css.em 2.25), marginBottom (px 20) ] ]
                [ text info ]
            , div [ css [ rowGrid, justifyContent flexStart ] ]
                (members
                    |> List.map (renderMember base_url colorCss)
                )
            ]
        ]


renderMember : String -> Style -> Teacher -> Html Msg
renderMember base_url colorCss teacher =
    let
        slug =
            teacher.slug

        onClickCmd =
            (NewUrl (base_url ++ slug))
    in
        a
            [ href slug
            , navigationOnClick (onClickCmd)
            , css
                [ gridItem
                , justifyContent flexStart
                , textDecoration none
                , colorCss
                ]
            ]
            [ img
                [ src teacher.avatar
                , css [ avatarImgCss, width (Css.em 8), height (Css.em 8) ]
                ]
                []
            , p [ css [ fontSize (Css.em 1.25), fontWeight (int 700) ] ] [ text teacher.name ]
            , div [ css [ columnGrid ] ] (teacher.tags |> List.map renderTeacherTags)
            ]


renderTeacherTags : String -> Html Msg
renderTeacherTags tag =
    div [ css [ paddingTop (px 10) ] ]
        [ text tag ]



{-
   content : Model -> Html Msg
   content model =
       div [ css [ contentContainerCss ] ]
           [ h1 [] [ text model.currentContent.title ]
           , renderPageMeta model.currentContent
           , renderMarkdown model.currentContent.markdown
           , renderPosts model
           , morePostsLink model
           , renderTags model.tagFilter model.tags
           ]


   renderPosts : Model -> Html Msg
   renderPosts model =
       div [ css [ ContentContainer ] ]
           (posts
               |> filterByTitle model.titleFilter
               |> filterByTag model.tagFilter
               |> List.take 5
               |> List.map (renderPostPreview model.url.base_url)
           )


   morePostsLink : Model -> Html Msg
   morePostsLink model =
       let
           slug =
               urlFor model.url.base_url ArchiveRoute
       in
           div [ css [ MorePostsLink ] ]
               [ a
                   [ href slug
                   , navigationOnClick (NewUrl slug)
                   ]
                   [ text "View All Recipes"
                   , i [ class "fa fa-arrow-right" ] []
                   ]
               ]
-}
