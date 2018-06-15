module Views.SharedViews exposing (..)

import Messages exposing (Msg(..))
import Css exposing (..)
import Css.Colors exposing (..)
import Css.Media exposing (minWidth, screen, withMediaQuery)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Attributes
import Types exposing (Content, Hero)
import ViewHelpers exposing (formatDate, normalLinkItem, footerLinkItem, navigationOnClick)
import RemoteData exposing (WebData, RemoteData(..))
import Markdown
import Views.SharedStyles exposing (..)


renderFooter : Html Msg
renderFooter =
    footer
        [ css
            [ backgroundColor (hex "#134374")
            , color gray
            , padding2 (Css.em 3) zero
            , textAlign center
            , flex3 (int 0) (int 0) (px 40)
            , displayFlex
            , flexDirection column
            , justifyContent spaceAround
            , alignItems center
            , width (pct 100)
            ]
        ]
        [ p
            [ css
                [ flex (int 1)
                , displayFlex
                , flexDirection column
                , justifyContent center
                , alignItems center
                , textAlign center
                ]
            ]
            [ text "All code for this site is open source and written in Elm. "
            , text "! — © 2017 Johnny art center"
            , iframe
                [ css
                    [ border zero
                    , width (px 100)
                    , height (px 20)
                    ]
                , src "https://ghbtns.com/github-btn.html?user=meilab&repo=johnny-art&type=star&count=true"
                ]
                []
            ]
        ]


renderMarkdown : WebData String -> Html Msg
renderMarkdown markdown =
    article
        [ css
            [ displayFlex
            , flexDirection column
            , alignItems center
            , width (pct 100)
            ]
        ]
        [ convertMarkdownToHtml markdown ]


convertMarkdownToHtml : WebData String -> Html Msg
convertMarkdownToHtml markdown =
    case markdown of
        Success data ->
            fromUnstyled
                (Markdown.toHtml
                    [ Html.Attributes.style
                        [ ( "width", "90%" ) ]
                    ]
                    data
                )

        Failure err ->
            Debug.log (toString (err))
                text
                "There was an error"

        _ ->
            text "Loading"


hero : Hero -> Attribute Msg -> Html Msg
hero heroInfo heroClass =
    div
        [ css
            [ color white

            --, backgroundImage (url heroInfo.srcUrl)
            --, backgroundImage (linearGradient (stop2 (hex "#bb4242") <| pct 0) (stop2 (hex "#efab4a") <| pct 100) [])
            , property "background-image" ("url(" ++ heroInfo.srcUrl ++ "), linear-gradient(to left, #bb4242 0%, #efab4a 100%), -webkit-linear-gradient(right, #bb4242 0%, #efab4a 100%)")
            , height (vh 100)
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
            , withMediaQuery [ "screen and (min-width: 48em)" ]
                [ height (vh 60)
                , minHeight (px 240)
                , padding2 (pct 15) zero
                ]
            ]
        ]
        [ h3 [ css [ fontSize (Css.rem 2.5) ] ] [ text heroInfo.des ]
        , h1 [ css [ fontSize (Css.rem 3) ] ] [ text heroInfo.title ]

        {-
           , input
               [ placeholder "搜索课程和音视频资源"
               , onInput UpdateTitleFilter
               , class [ Searcher ]
               ]
               []
        -}
        ]
