module Contents exposing (..)

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
    , title = "Johnny-Art"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/hero/cover1.jpg" "" ""
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
    , hero = Hero "images/hero/about.jpg" "" ""
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
    , hero = Hero "images/hero/cover1.jpg" "" ""
    }


courselist : Content
courselist =
    { slug = "courselist"
    , route = CoursesRoute
    , contentType = Page
    , name = "courselist"
    , title = "Courses"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/hero/courses.jpg" "" ""
    }


teacherList : Content
teacherList =
    { slug = "teacherlist"
    , route = TeachersRoute
    , contentType = AuthorPage
    , name = "teacherlist"
    , title = "Teachers"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "images/hero/teachers.jpg" "" ""
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
    , hero = Hero "images/hero/cover1.jpg" "" ""
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
    , hero = Hero "images/hero/cover1.jpg" "" ""
    }


pages : List Content
pages =
    [ home
    , about
    , join
    , courselist
    , teacherList
    , notFoundContent
    , notFound404
    ]


helloWorld : Content
helloWorld =
    { slug = "/hello-world"
    , route = PostDetailRoute "hello-world"
    , title = "Hello World"
    , name = "hello-world"
    , publishedDate = fromCalendarDate 2017 Sep 25
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , contentType = Post
    , preview = "Hello World in Elm"
    , hero = Hero "images/hero/cover1.jpg" "" ""
    }


posts : List Content
posts =
    [ helloWorld
    ]


ww : Content
ww =
    { slug = "teacher/ww"
    , route = TeacherDetailRoute "ww"
    , contentType = Page
    , name = "ww"
    , title = "Wu Wei"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/ww.jpg" "" ""
    }


cyh : Content
cyh =
    { slug = "teacher/cyh"
    , route = TeacherDetailRoute "cyh"
    , contentType = Page
    , name = "cyh"
    , title = "Chen Yinghao"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/ww.jpg" "" ""
    }


xw : Content
xw =
    { slug = "teacher/xw"
    , route = TeacherDetailRoute "xw"
    , contentType = Page
    , name = "xw"
    , title = "Xiao Wen"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/ww.jpg" "" ""
    }


zj : Content
zj =
    { slug = "teacher/zj"
    , route = TeacherDetailRoute "zj"
    , contentType = Page
    , name = "zj"
    , title = "Zhang Jing"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/ww.jpg" "" ""
    }


zy : Content
zy =
    { slug = "teacher/zy"
    , route = TeacherDetailRoute "zy"
    , contentType = Page
    , name = "zy"
    , title = "Zou Yang"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/ww.jpg" "" ""
    }


lky : Content
lky =
    { slug = "teacher/lky"
    , route = TeacherDetailRoute "lky"
    , contentType = Page
    , name = "lky"
    , title = "Lai Kongyi"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/ww.jpg" "" ""
    }


teachers : List Content
teachers =
    [ ww, cyh, xw, zj, zy, lky ]


lj : Content
lj =
    { slug = "teacher/lj"
    , route = TeacherDetailRoute "lj"
    , contentType = Page
    , name = "lj"
    , title = "Ling Jiang"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/ww.jpg" "" ""
    }


zz : Content
zz =
    { slug = "teacher/zz"
    , route = TeacherDetailRoute "zz"
    , contentType = Page
    , name = "zz"
    , title = "Zhou Zheng"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/ww.jpg" "" ""
    }


yxz : Content
yxz =
    { slug = "teacher/yxz"
    , route = TeacherDetailRoute "yxz"
    , contentType = Page
    , name = "yxz"
    , title = "Ye Xiaozhou"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/ww.jpg" "" ""
    }


consultants : List Content
consultants =
    [ lj, zz, yxz ]


xiaoshengchu : Content
xiaoshengchu =
    { slug = "course/xiaoshengchu"
    , route = CourseDetailRoute "xiaoshengchu"
    , contentType = Page
    , name = "xiaoshengchu"
    , title = "Xiao Shengchu"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/xiaoshengchu.jpg" "" ""
    }


xiaozhuchi : Content
xiaozhuchi =
    { slug = "course/xiaozhuchi"
    , route = CourseDetailRoute "xiaozhuchi"
    , contentType = Page
    , name = "xiaozhuchi"
    , title = "Xiao Zhuchi"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/xiaozhuchi.jpg" "" ""
    }


yikao : Content
yikao =
    { slug = "course/yikao"
    , route = CourseDetailRoute "yikao"
    , contentType = Page
    , name = "yikao"
    , title = "Yi Kao"
    , publishedDate = fromCalendarDate 2018 Jun 15
    , author = Authors.wy
    , markdown = RemoteData.NotAsked
    , preview = ""
    , hero = Hero "/images/hero/yikao.jpg" "" ""
    }


courses : List Content
courses =
    [ xiaoshengchu, xiaozhuchi, yikao ]
