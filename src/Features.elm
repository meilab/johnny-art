module Features exposing (..)

import Types exposing (Feature)
import Routing exposing (Route(..))


type alias Feature =
    { name : String
    , detail : String
    , icon : String
    , pic : String
    , slug : String
    , route : Route
    }


projectbased : Feature
projectbased =
    { name = "实战演练"
    , detail = "我们聚焦于帮助学员在真实场景中进行学习，深度参与到实战当中，每一个主题，每一次课程设置都是根据真实场景，具体的工作内容进行编排，坦白讲，约翰尼艺术中心的老师和学员都不喜欢学院派的刻板教学"
    , icon = "images/icons/icon1.svg"
    , pic = "images/feature1.jpg"
    , slug = "/projectbased"
    , route = FeatureDetailRoute "projectbased"
    }


conciseflow : Feature
conciseflow =
    { name = "科学排课"
    , detail = "学员从哪里开始?每一步怎么做?如何学?达成什么效果？约翰尼艺术中心有一套科学安排的教学体系，一步一步教学员成长，踏上艺术之旅，看得见自己每一次的进步，每一天的精彩"
    , icon = "images/icons/icon2.svg"
    , pic = "images/feature2.jpg"
    , slug = "/conciseflow"
    , route = FeatureDetailRoute "conciseflow"
    }


breakitdown : Feature
breakitdown =
    { name = "分解授课"
    , detail = "在约翰尼，老师们会将需要掌握的重点进行详细的拆解，通过课堂授课，教学视频，课后群聊沟通，作品点评等方式，不只是教给学员怎么做，更要教给学员为什么"
    , icon = "images/icons/icon1.svg"
    , pic = "images/feature1.jpg"
    , slug = "/breakitdown"
    , route = FeatureDetailRoute "breakitdown"
    }


effitient : Feature
effitient =
    { name = "快乐高效"
    , detail = "约翰尼的教学，干货满满，快捷高效。讲师们在课堂上带给大家生动有趣干货满满的内容，课后还有专属视频丰富大家的知识量，更有线上学习小组等形式，让大家高效，便捷的进行学习"
    , icon = "images/icons/icon2.svg"
    , pic = "images/feature2.jpg"
    , slug = "/effitient"
    , route = FeatureDetailRoute "effitient"
    }


features : List Feature
features =
    [ projectbased
    , conciseflow
    , breakitdown
    , effitient
    ]
