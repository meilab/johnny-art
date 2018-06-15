module Courses exposing (..)

import Types exposing (Hero, Course, ContentType(..))
import Teachers
import RemoteData exposing (RemoteData)
import Routing exposing (Route(..))


xiaoshengchu : Course
xiaoshengchu =
    { slug = "/xiaoshengchu"
    , route = CourseDetailRoute "xiaoshengchu"
    , title = "小升初"
    , name = "xiaoshengchu"
    , teachers = [ Teachers.cyh ]
    , markdown = RemoteData.NotAsked
    , preview = "Hello World in Elm"
    , hero = Hero "images/cover1.jpg" "" ""
    , introPic = "images/xiaoshengchu.jpg"
    }


xiaozhuchi : Course
xiaozhuchi =
    { slug = "/xiaozhuchi"
    , route = CourseDetailRoute "xiaozhuchi"
    , title = "小小主持人"
    , name = "xiaozhuchi"
    , teachers = [ Teachers.cyh ]
    , markdown = RemoteData.NotAsked
    , preview = "Hello World in Elm"
    , hero = Hero "images/cover1.jpg" "" ""
    , introPic = "images/xiaozhuchi.jpg"
    }


yikao : Course
yikao =
    { slug = "/yikao"
    , route = CourseDetailRoute "yikao"
    , title = "播音主持艺考"
    , name = "yikao"
    , teachers = [ Teachers.cyh ]
    , markdown = RemoteData.NotAsked
    , preview = "Hello World in Elm"
    , hero = Hero "images/cover1.jpg" "" ""
    , introPic = "images/yikao.jpg"
    }


courses : List Course
courses =
    [ xiaoshengchu
    , xiaozhuchi
    , yikao
    ]
