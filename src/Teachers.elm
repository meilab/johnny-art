module Teachers exposing (..)

import Types exposing (Teacher)
import Routing exposing (Route(..))


ww : Teacher
ww =
    { name = "吴老师"
    , avatar = "/images/avatar/ww.jpg"
    , route = TeacherDetailRoute "ww"
    , slug = "/teacher/ww"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    , tags = [ "国家级播音员", "约翰尼艺术中心创始人", "陕西广播电视台主持人", "原西安人民广播电台《消费直播室》主持人", "2008年获中国广播电视协会\"年度优秀电视经济节目主持人\"一等奖", "陕西西西长安影视文化暨北京十月国际影视文化西安分部 COO" ]
    }


cyh : Teacher
cyh =
    { name = "晓昊"
    , avatar = "/images/avatar/cyh.jpg"
    , route = TeacherDetailRoute "cyh"
    , slug = "/teacher/cyh"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    , tags = [ "国家级播音员", "中央人民广播电台\"中国之声\"听评员", "《央广新闻》，《央广夜读》签约主播" ]
    }


lj : Teacher
lj =
    { name = "凌江"
    , avatar = "/images/avatar/lj.jpg"
    , route = TeacherDetailRoute "lj"
    , slug = "/teacher/lj"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    , tags = [ "播音艺术家", "西安广播电视台资深播音员", "全国小说演播艺术家", "约翰尼艺术中心艺术顾问" ]
    }


zz : Teacher
zz =
    { name = "周政"
    , avatar = "/images/avatar/zz.jpg"
    , route = TeacherDetailRoute "zz"
    , slug = "/teacher/zz"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    , tags = [ "天津卫视御用配音员", "原中央电视台《篮球公园》解说", "金诺佳音资深配音员", "国际级播音员", "约翰尼艺术中心特邀顾问" ]
    }


yxz : Teacher
yxz =
    { name = "叶小舟"
    , avatar = "/images/avatar/yxz.jpg"
    , route = TeacherDetailRoute "yxz"
    , slug = "/teacher/yxz"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    , tags = [ "导演、制片人", "历任国内多家大型电影公司核心岗位", "现任万达影业副总裁", "个人作品：", "《时空终点》", "《索命暹罗之按摩师》(中泰)", "疯狂一家秀", "约翰尼艺术中心特邀顾问" ]
    }


xw : Teacher
xw =
    { name = "小雯"
    , avatar = "/images/avatar/yw.jpg"
    , route = TeacherDetailRoute "xw"
    , slug = "/teacher/xw"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    , tags = [ "西安广播电视台咨询广播节目支持人", "从业十二年", "国家语委普通话一级甲等", "曾获西安广播文艺类二等奖" ]
    }


zj : Teacher
zj =
    { name = "张静"
    , avatar = "/images/avatar/zj.jpg"
    , route = TeacherDetailRoute "zj"
    , slug = "/teacher/zj"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    , tags = [ "《天气预报》节目主持人", "全国气象主持人大赛全国一等奖", "中国气象局\"十佳主持人\"称号", "出演院线电影《双面警察》" ]
    }


zy : Teacher
zy =
    { name = "邹阳"
    , avatar = "/images/avatar/zy.jpg"
    , route = TeacherDetailRoute "zy"
    , slug = "/teacher/zy"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    , tags = [ "陕西广播电视台《第一娱乐》主持人" ]
    }


lky : Teacher
lky =
    { name = "赖空译"
    , avatar = "/images/avatar/lky.jpg"
    , route = TeacherDetailRoute "lky"
    , slug = "/teacher/lky"
    , email = "example@aliyun.com"
    , bio = "Coder"
    , blog = ""
    , tags = [ "后期剪辑特效师", "参与多部电影制作", "《灵异手术》", "《时空终点》" ]
    }


teachers : List Teacher
teachers =
    [ ww, cyh, xw, zj, zy, lky ]


consultants : List Teacher
consultants =
    [ lj, zz, yxz ]
