module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = HomeRoute
    | AboutRoute
    | JoinRoute
    | CoursesRoute
    | TeachersRoute
    | PostDetailRoute String
    | CourseDetailRoute String
    | FeatureDetailRoute String
    | TeacherDetailRoute String
    | NotFoundRoute


parseBaseUrl : String -> Parser a a -> Parser a a
parseBaseUrl base_url item =
    case base_url of
        "" ->
            item

        _ ->
            base_url
                |> String.dropLeft 1
                |> String.split "/"
                |> List.map (s)
                |> List.reverse
                |> List.foldl (</>) (item)


matchers : String -> Parser (Route -> a) a
matchers base_url =
    oneOf
        [ map HomeRoute (parseBaseUrl base_url top)
        , map AboutRoute (parseBaseUrl base_url (s "about"))
        , map JoinRoute (parseBaseUrl base_url (s "join"))
        , map CoursesRoute (parseBaseUrl base_url (s "courses"))
        , map TeachersRoute (parseBaseUrl base_url (s "teachers"))
        , map PostDetailRoute (parseBaseUrl base_url top </> string)
        , map TeacherDetailRoute (parseBaseUrl base_url top </> string)
        , map CourseDetailRoute (parseBaseUrl base_url top </> string)
        , map FeatureDetailRoute (parseBaseUrl base_url top </> string)
        ]


parseLocation : Location -> String -> Route
parseLocation location base_url =
    case (parsePath (matchers base_url) location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


urlFor : String -> Route -> String
urlFor base_url route =
    case route of
        HomeRoute ->
            base_url ++ "/"

        AboutRoute ->
            base_url ++ "/about"

        JoinRoute ->
            base_url ++ "/join"

        CoursesRoute ->
            base_url ++ "/courses"

        TeachersRoute ->
            base_url ++ "/teachers"

        TeacherDetailRoute slug ->
            base_url ++ slug

        PostDetailRoute slug ->
            base_url ++ slug

        CourseDetailRoute slug ->
            base_url ++ slug

        FeatureDetailRoute slug ->
            base_url ++ slug

        NotFoundRoute ->
            base_url


routingItem : String -> List ( String, String, Route, String )
routingItem base_url =
    [ ( "Home", "", HomeRoute, base_url ++ "/" )
    , ( "Courses", "", CoursesRoute, base_url ++ "/courses" )
    , ( "About", "", AboutRoute, base_url ++ "/about" )
    , ( "Teachers", "", TeachersRoute, base_url ++ "/teachers" )
    ]


footerRoutingItem : List ( String, String, String )
footerRoutingItem =
    [ ( "Github", "fa fa-github fa-stack-1x fa-inverse", "https://github.com/meilab" )

    --, ( "Wechat", "fa fa-weixin fa-stack-1x fa-inverse", "https://weixin.com" )
    , ( "Weibo", "fa fa-weibo fa-stack-1x fa-inverse", "http://weibo.com/meilab" )
    , ( "Linkedin", "fa fa-linkedin fa-stack-1x fa-inverse", "https://linkedin.com/in/meilab" )
    ]
