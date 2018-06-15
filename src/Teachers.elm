module Teachers exposing (..)

import Types exposing (Teacher)
import Routing exposing (Route(..))


ww : Teacher
ww =
    { name = "吴老师"
    , avatar = "/images/avatar/cyh.jpg"
    , route = TeacherDetailRoute "ww"
    , slug = "/ww"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    }


cyh : Teacher
cyh =
    { name = "晓昊"
    , avatar = "/images/avatar/cyh.jpg"
    , route = TeacherDetailRoute "cyh"
    , slug = "/cyh"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    }


xw : Teacher
xw =
    { name = "小雯"
    , avatar = "/images/avatar/cyh.jpg"
    , route = TeacherDetailRoute "xw"
    , slug = "/xw"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    }


teachers : List Teacher
teachers =
    [ ww, cyh, xw ]
