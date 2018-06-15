module Reviews exposing (..)

import Types exposing (ParentReview, KidReview)


ww : ParentReview
ww =
    { name = "吴老师"
    , kidName = "仔仔"
    , role = "爸爸"
    , avatar = "/images/avatar/cyh.jpg"
    , comment = "讲得非常好，思路清晰有条理，课程生动有趣，学生都很喜欢，寓教于乐，学习过程轻松愉悦，经过一年的学习，小朋友在演讲，口才，播音方面进步很大，强烈推荐！"
    }


cyh : ParentReview
cyh =
    { name = "晓昊"
    , kidName = "小小昊"
    , role = "爸爸"
    , avatar = "/images/avatar/cyh.jpg"
    , comment = "讲得非常好，思路清晰有条理，课程生动有趣，学生都很喜欢，寓教于乐，学习过程轻松愉悦，经过一年的学习，小朋友在演讲，口才，播音方面进步很大，强烈推荐！"
    }


xw : ParentReview
xw =
    { name = "小雯"
    , kidName = "童童"
    , role = "妈妈"
    , avatar = "/images/avatar/cyh.jpg"
    , comment = "讲得非常好，思路清晰有条理，课程生动有趣，学生都很喜欢，寓教于乐，学习过程轻松愉悦，经过一年的学习，小朋友在演讲，口才，播音方面进步很大，强烈推荐！"
    }


parentsReview : List ParentReview
parentsReview =
    [ ww, cyh, xw ]


wwk : KidReview
wwk =
    { name = "仔仔"
    , avatar = "/images/avatar/cyh.jpg"
    , comment = "讲得非常好，思路清晰有条理，课程生动有趣，学生都很喜欢，寓教于乐，学习过程轻松愉悦，经过一年的学习，小朋友在演讲，口才，播音方面进步很大，强烈推荐！"
    }


cyhk : KidReview
cyhk =
    { name = "小小昊"
    , avatar = "/images/avatar/cyh.jpg"
    , comment = "讲得非常好，思路清晰有条理，课程生动有趣，学生都很喜欢，寓教于乐，学习过程轻松愉悦，经过一年的学习，小朋友在演讲，口才，播音方面进步很大，强烈推荐！"
    }


xwk : KidReview
xwk =
    { name = "童童"
    , avatar = "/images/avatar/cyh.jpg"
    , comment = "讲得非常好，思路清晰有条理，课程生动有趣，学生都很喜欢，寓教于乐，学习过程轻松愉悦，经过一年的学习，小朋友在演讲，口才，播音方面进步很大，强烈推荐！"
    }


kidsReview : List KidReview
kidsReview =
    [ wwk, cyhk, xwk ]
