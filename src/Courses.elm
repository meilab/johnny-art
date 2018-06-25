module Courses exposing (..)

import Types exposing (Hero, Course, ContentType(..))
import Teachers
import RemoteData exposing (RemoteData)
import Routing exposing (Route(..))


xiaoshengchu : Course
xiaoshengchu =
    { slug = "course/xiaoshengchu"
    , route = CourseDetailRoute "xiaoshengchu"
    , title = "小升初"
    , videoUrl = "http://player.youku.com/embed/XMzQ3OTk1NTA1Ng"
    , name = "xiaoshengchu"
    , teachers = [ Teachers.cyh ]
    , markdown = RemoteData.NotAsked
    , preview = "Hello World in Elm"
    , hero = Hero "images/cover1.jpg" "" ""
    , introPic = "images/xiaoshengchu.jpg"
    , poster = "images/poster/xiaoshengchu.jpg"
    }


xiaozhuchi : Course
xiaozhuchi =
    { slug = "course/xiaozhuchi"
    , route = CourseDetailRoute "xiaozhuchi"
    , title = "小小主持人"
    , videoUrl = "http://player.youku.com/embed/XMzY1NDMzOTAwOA"
    , name = "xiaozhuchi"
    , teachers = [ Teachers.cyh ]
    , markdown = RemoteData.NotAsked
    , preview = "Hello World in Elm"
    , hero = Hero "images/cover1.jpg" "" ""
    , introPic = "images/xiaozhuchi.jpg"
    , poster = "images/poster/xiaozhuchi.jpg"
    }


yikao : Course
yikao =
    { slug = "course/yikao"
    , route = CourseDetailRoute "yikao"
    , title = "播音主持艺考"
    , videoUrl = "http://player.youku.com/embed/XNTk1ODM2MTQ4"
    , name = "yikao"
    , teachers = [ Teachers.cyh ]
    , markdown = RemoteData.NotAsked
    , preview = "Hello World in Elm"
    , hero = Hero "images/cover1.jpg" "" ""
    , introPic = "images/yikao.jpg"
    , poster = "images/poster/yikao.jpg"
    }


courses : List Course
courses =
    [ xiaoshengchu
    , xiaozhuchi
    , yikao
    ]
