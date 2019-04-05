<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <title>班级圈</title>
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">
    <link rel="stylesheet" href="teacher/css/banjiquan.css">
    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
    <script src="teacher/lib/jquery/jquery.js"></script>
    <script src="teacher/lib/bootstrap/js/bootstrap.js"></script>
    <script src="teacher/js/shijianjuli/TimeDifference.js"></script>
    <script src="teacher/js/main.js"></script>

</head>
<body>
<header>
    <span class="glyphicon glyphicon-menu-left">班级圈</span>
    <div><a href="meirizuoye_fabu.html">发布</a></div>

</header>
<ul id="pn">
    <li class="list0">
        <a class="close" href="javascript:;">X</a>
        <div class="head"><img src="aa.PNG" alt=""/></div>
        <div class="content">
            <p class="text"><span class="name">Andy：</span>哈哈哈哈哈谁还没个妈～//@我的朋友是个呆B: 饮水机那个蕾丝罩我给跪了//@八卦_我实在是太CJ了:仿佛看到了自己家</p>
            <div class="pic"><img src="aa.PNG" width="30%" height="60px" alt="aa.PNG"/></div>
            <div class="good"><span class="date">02-14 23:01</span><a class="dzan" href="javascript:;">赞</a></div>
            <div class="people" total="2980">2980人觉得很赞</div>
            <div class="comment-list">
                <div class="comment" user="self">
                    <div class="comment-left"><img src="aa.PNG" alt=""/></div>
                    <div class="comment-right">
                        <div class="comment-text"><span class="user">老王：</span>我住隔壁我姓王</div>
                        <div class="comment-date">02-14 22:00
                            <a class="comment-zan" href="javascript:;" total="23" my="1">23 取消赞</a>
                            <a class="comment-dele" href="javascript:;">回复</a>
                        </div>
                    </div>
                </div>
                <div class="comment" user="self">
                    <div class="comment-left"><img src="aa.PNG" alt=""/></div>
                    <div class="comment-right">
                        <div class="comment-text"><span class="user">我：</span>看哭了留卡号吧</div>
                        <div class="comment-date">02-14 24:00
                            <a class="comment-zan" href="javascript:;" total="0" my="0">赞</a>
                            <a class="comment-dele" href="javascript:;">删除</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hf">
                <textarea type="text" class="hf-text" autocomplete="off" maxlength="100">评论…</textarea>
                <button class="hf-btn">回复</button>
                <span class="hf-nub">0/100</span>
            </div>
        </div>
    </li>
    <li class="list0">
        <a class="close" href="javascript:;">X</a>
        <div class="head"><img src="aa.PNG" alt=""/></div>
        <div class="content">
            <p class="text"><span class="name">Andy：</span>哈哈哈哈哈谁还没个妈～//@我的朋友是个呆B: 饮水机那个蕾丝罩我给跪了//@八卦_我实在是太CJ了:仿佛看到了自己家</p>
            <div class="pic"><img src="" alt=""/></div>
            <div class="good"><span class="date">02-14 23:01</span><a class="dzan" href="javascript:;">赞</a></div>
            <div class="people" total="0" style="display: none;"></div>
            <div class="comment-list">
                <div class="comment" user="self">
                    <div class="comment-left"><img src="aa.PNG" alt=""/></div>
                    <div class="comment-right">
                        <div class="comment-text"><span class="user">我：</span>看哭了留卡号吧</div>
                        <div class="comment-date">02-14 24:00
                            <a class="comment-zan" href="javascript:;" total="286" my="1">286 取消赞</a>
                            <a class="comment-dele" href="javascript:;">删除</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hf">
                <textarea type="text" class="hf-text" autocomplete="off" maxlength="100">评论…</textarea>
                <button class="hf-btn">回复</button>
                <span class="hf-nub">0/100</span>
            </div>
        </div>
    </li>
</ul>
<script type="text/javascript">

    var fanhui = $("header span")[0];
    fanhui.onclick= function () {
        //console.log(fanhui);
        top.location = "teacherAction_t_home.action";
        //window.history.back(-1);
    };



    //在页面加载完后立即执行多个函数。
    function addloadEvent(func){
        var oldonload=window.onload;
        if(typeof window.onload !="function"){
            window.onload=func;
        }
        else{
            window.onload=function(){
                if(oldonload){
                    oldonload();
                }
                func();
            }
        }
    }
    addloadEvent(b);
    function b(){
        var pn=document.getElementById("pn");
        var lists=pn.children;
        //删除当前节点
        function remove(node){
            node.parentNode.removeChild(node);
        }
        //上面的点赞
        function praisebox(box,el){
            //获取赞数量容器
            var praise=box.getElementsByClassName("people")[0];
            //获取容器当前total值
            var total=parseInt(praise.getAttribute("total"));
            //获取点击的innerHTML
            var txt=el.innerHTML;
            //创建一个新的total存储用
            var newtotal;
            //判断点击的文字内容
            if(txt=="赞"){
                //total值+1 因为我还没点击赞，所以要点击的时候就多了一个人 total+1
                newtotal=total+1;
                //判断赞数量 把相应文字放到赞容器里
                praise.innerHTML=newtotal==1 ? "我觉得很赞" : "我和" + total +"个人觉得很赞";
                el.innerHTML="取消赞";
            }
            else{
                //反之total值-1
                newtotal=total-1;
                praise.innerHTML=newtotal==0 ? "" : newtotal +"个人觉得很赞";
                el.innerHTML="赞";
            }
            //更新total值
            praise.setAttribute("total",newtotal);
            //如果没有人点赞容器隐藏
            praise.style.display=(newtotal==0) ? "none" : "block";
        }
        //回复评论
        function reply(box){
            //获取评论框
            var textarea=box.getElementsByTagName("textarea")[0];
            //获取包含所有评论的容器
            var comment=box.getElementsByClassName("comment-list")[0];
            //创建新的评论div
            var div=document.createElement("div");
            //赋类名
            div.className="comment";
            //设置属性
            div.setAttribute("user","self");
            //获取每条评论的innerHTML结构，每次只替换textarea的输入内容和 当前发送时间
            var html='<div class="comment-left">'+'<img src="images/T2.jpg" alt=""/>'+'</div>'+
                    '<div class="comment-right">'+
                    '<div class="comment-text"><span>我：</span>'+textarea.value+'</div>'+
                    '<div class="comment-date">'+
                    getTime()+
                    '<a class="comment-zan" href="javascript:;" total="0" my="0">赞</a>'+
                    '<a class="comment-dele" href="javascript:;">删除</a>'+
                    '</div>'+
                    '</div>';
            //插入到新建的评论div
            div.innerHTML=html;
            //把新评论插入到评论列表
            comment.appendChild(div);
            //评论后初始化textarea输入框
            textarea.value="评论…";
            textarea.parentNode.className="hf";
        }
        //获取当前时间回复评论时调用
        function getTime(){
            var t=new Date();
            var y=t.getFullYear();
            var m=t.getMonth()+1;
            var d=t.getDate();
            var h=t.getHours();
            var mi=t.getMinutes();
            m=m<10?"0"+m:m;
            d=d<10?"0"+d:d;
            h=h<10?"0"+h:h;
            mi=mi<10?"0"+mi:mi;
            return y+"-"+m+"-"+d+""+h+":"+mi;
        }
        //回复里点赞
        function praiseReply(el){
            //获取当前total值 也就是所有点赞数量
            var total=parseInt(el.getAttribute("total"));
            //获取当前my值 我的点赞
            var my=parseInt(el.getAttribute("my"));
            //创建新的total
            var newtotal;
            //判断my=0就是我准备要点赞
            if(my==0){
                //我点了赞总数量就要+1
                newtotal=total+1;
                //更新total值
                el.setAttribute("total",newtotal);
                //更新my值
                el.setAttribute("my",1);
                //更新文字 就是我点了后 文字就是取消赞了
                el.innerHTML=newtotal+" 取消赞";
            }else{
                //反之-1
                newtotal=total-1;
                el.setAttribute("total",newtotal);
                el.setAttribute("my",0);
                el.innerHTML=(newtotal==0)?" 赞":newtotal+" 赞";
            }
        }
        //操作回复
        function operateReply(el){
            //每条评论
            var comment=el.parentNode.parentNode.parentNode;
            //整个状态
            var box=comment.parentNode.parentNode.parentNode;
            //评论框
            var textarea=box.getElementsByTagName("textarea")[0];
            //名字
            var user=comment.getElementsByClassName("user")[0];
            //点击的innerHTML
            var txt=el.innerHTML;
            //判断当前点击的是否为回复
            if(txt=="回复"){
                //评论框触发焦点事件 也就是变高
                textarea.onfocus();
                //内容变为回复+当前人的名字
                textarea.value="回复 "+user.innerHTML;
                //调用键盘事件
                textarea.onkeyup();
            }else{
                //否则就是删除节点
                remove(comment);
            }
        }
        //遍历所有状态消息
        for(var i=0;i<lists.length;i++){
            //全部事件代理
            lists[i].onclick=function(e){
                //获取当前点击事件
                var e=e||window.event;
                var el=e.srcElement;
                if(!el){
                    el=e.target;//兼容火狐
                }
                //判断点击的类名
                switch(el.className){
                    //关闭整个状态
                    case "close":
                        remove(el.parentNode);
                        break;
                    //上面的点赞
                    case "dzan":
                        praisebox(el.parentNode.parentNode.parentNode,el);
                        break;
                    //回复评论
                    case "hf-btn hf-btn-on":
                        reply(el.parentNode.parentNode.parentNode);
                        break;
                    //每条评论中点赞
                    case "comment-zan":
                        praiseReply(el);
                        break;
                    case "comment-dele":
                        operateReply(el);
                        break;
                }
            }
            var textarea=lists[i].getElementsByClassName("hf-text")[0];
            //焦点事件
            textarea.onfocus=function(){
                this.parentNode.className='hf hf-on';
                this.value = this.value == '评论…' ? '' : this.value;
            }
            //失焦事件
            textarea.onblur=function(){
                if(this.value==''){
                    this.parentNode.className='hf';
                    this.value ='评论…';
                }
            }
            //键盘事件
            textarea.onkeyup=function(){
                var len=this.value.length;
                var textParentNode=this.parentNode;
                var textBtn=textParentNode.children[1];
                var textNub=textParentNode.children[2];
                if(len==0 /*|| len>100*/){
                    textBtn.className="hf-btn";
                }else{
                    textBtn.className="hf-btn hf-btn-on";
                    /*this.style.color="#333"; */
                }
                textNub.innerHTML=len+"/100";
            }
        }
        //遍历结束
    }
</script>
</body>
</html> 