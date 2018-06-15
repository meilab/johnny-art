module Views.Authors exposing (authorView)

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


authorView : Model -> Html Msg
authorView model =
    renderAuthors


renderAuthors : Html Msg
renderAuthors =
    div [ css [ contentContainerCss ] ]
        [ div [ css [ columnGrid ] ]
            (Authors.authors
                |> List.map renderAuthor
            )
        ]


renderAuthor : Author -> Html Msg
renderAuthor author =
    div
        [ css [ columnGrid ] ]
        [ h1 [] [ text author.name ]
        , h2 [] [ text author.bio ]
        , div [ css [ columnGrid ] ]
            [ span [] [ text author.blog ]
            , span [] [ text author.github ]
            , span [] [ text author.location ]
            , span [] [ text author.email ]
            ]
        ]
