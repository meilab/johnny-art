module Pages exposing (..)

import Authors
import Date.Extra exposing (fromCalendarDate)
import Date exposing (Month(..))
import Types exposing (Hero, Content, ContentType(..))
import RemoteData exposing (RemoteData)
import Routing exposing (Route(..))


home : Content
home =
    { slug = "/"
    , route = HomeRoute
    , contentType = Page
    , name = "index"
    , title = "Elm Recipes"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/cover1.jpg" "" ""
    }


about : Content
about =
    { slug = "/about"
    , route = AboutRoute
    , contentType = Page
    , name = "about"
    , title = "About Johnny art center"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/cover1.jpg" "" ""
    }


join : Content
join =
    { slug = "/join"
    , route = JoinRoute
    , contentType = Page
    , name = "join"
    , title = "Join"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/cover1.jpg" "" ""
    }


courses : Content
courses =
    { slug = "courses"
    , route = CoursesRoute
    , contentType = Page
    , name = "courses"
    , title = "Courses"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/cover1.jpg" "" ""
    }


teachers : Content
teachers =
    { slug = "teachers"
    , route = TeachersRoute
    , contentType = AuthorPage
    , name = "teachers"
    , title = "Teachers"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/cover1.jpg" "" ""
    }


notFoundContent : Content
notFoundContent =
    { slug = "notfound"
    , route = NotFoundRoute
    , contentType = Page
    , name = "not-found"
    , title = "Couldn't find content"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/cover1.jpg" "" ""
    }


notFound404 : Content
notFound404 =
    { slug = "404"
    , route = NotFoundRoute
    , contentType = Page
    , name = "404"
    , title = "You Are lost"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/cover1.jpg" "" ""
    }


pages : List Content
pages =
    [ home
    , about
    , join
    , courses
    , teachers
    , notFoundContent
    , notFound404
    ]
