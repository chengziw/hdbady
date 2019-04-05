/*
 * 自己的JS脚步
 * @Author: iceStone
 * @Date:   2015-12-12 10:59:26
 * @Last Modified by:   iceStone
 * @Last Modified time: 2015-12-12 11:01:38
 */

'use strict';

var fanhui = $("header span")[0];
fanhui.onclick= function () {
    //console.log(fanhui);
    top.location = "index.html";
};


var yema = 0;

$(function () {
        $.ajax({
            type: 'post',
            url: 'json/banjiquan.json',

            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
            success: function (data) {

            	yema++;
                var divdianji = $('<div class="dianji">点击加载</div>');


                $("#pn").append(divdianji);



                var i = 10;

                if(data.haseMore){

                    divdianji.click(function () {

                        i++;

                        $.ajax({
                            type: 'post',
                            url: 'json/banjiquan.json',
                            data:{"yema":yema},
                            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
                            success: function (data) {


                            	console.log("yema" + yema);
                            	yema++;





                                ////遍历每一个发送的条目
                                $(data.themeList).each(function (index, value) {







                                    var images = "";
                                    $(this.imageList).each(function (index, value) {

                                        var img = '<a href="'+this.imgUrl+'"><img src="'+this.samllImagUrl+'"></a>';
                                        images=images+img;

                                    })

                                    var zanderen ="";
                                    $(this.praiseUserList).each(function (index, value) {
                                        var username = this.userName+"  , ";
                                        zanderen=zanderen+username;
                                    })




                                    var comments = "";

                                    $(this.commentList).each(function (index, value) {

                                        var comment1 ="";
                                        if(this.self){

                                            comment1 =
                                                '      <div class="comment" user="self">'+
                                                '      <div class="comment-left"><img src="'+this.icon+'" alt=""/></div>'+
                                                '      <div class="comment-right">'+
                                                '      <div class="comment-text"><span class="user">我：</span>'+this.content+'</div>'+
                                                '  <div class="comment-date">'+this.createTime+''+
                                                '  <a class="comment-zan" href="javascript:;" total="0" my="0">赞</a>'+
                                                '      <a class="comment-dele" href="javascript:;">删除</a>'+
                                                '      </div>'+
                                                '      </div>'+
                                                '      </div>';


                                        }else{
                                            comment1 =
                                                '      <div class="comment" user="self">'+
                                                '      <div class="comment-left"><img src="'+this.icon+'" alt=""/></div>'+
                                                '      <div class="comment-right">'+
                                                '      <div class="comment-text"><span class="user">'+this.fromUserName+'：</span>'+this.content+'</div>'+
                                                '  <div class="comment-date">'+this.createTime+''+
                                                '  <a class="comment-zan" href="javascript:;" total="23" my="1">'+this.duoshaogezan+' 取消赞</a>'+
                                                '  <a class="comment-dele" href="javascript:;">回复</a>'+
                                                '      </div>'+
                                                '      </div>'+
                                                '      </div>';

                                        }

                                        comments= comments+comment1;


                                    })

                                    var li = $(
                                        '  <li class="list0">'+
                                        '      <a class="close" href="javascript:;">X</a>'+
                                        '      <div class="head"><img src="'+this.icon+' alt=""/></div>'+
                                        '      <div class="content">'+
                                        '      <p class="text"><span class="name">'+this.userName+'：</span>'+this.content+'</p>'+

                                        '  <div class="pic baguetteBox'+i+' gallery clearfix tupian">'+

                                        images+
                                        '      </div>'+


                                        '      <div class="good"><span class="date">'+this.createTime+'</span><a class="dzan" href="javascript:;">赞</a></div>'+
                                        '  <div class="people" total="'+zanderen+'">'+zanderen+'等觉得很赞</div>'+

                                        '  <div class="comment-list">'+

                                        comments+

                                        '      </div>'+
                                        '      <div class="hf">'+
                                        '      <textarea type="text" class="hf-text" autocomplete="off" maxlength="100">评论…</textarea>'+
                                        '  <button class="hf-btn">回复</button>'+
                                        '      <span class="hf-nub">0/100</span>'+
                                        '      </div>'+
                                        '      </div>'+
                                        '      </li>'

                                    )



                                    $("#pn").append(li,divdianji);


                                })


                                baguetteBox.run('.baguetteBox'+i+'', {
                                    animation: 'fadeIn',
                                });













                                ////////////////////////////////////





                                b();
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

                                        var ss ="";

                                        ss = praise.innerHTML;
                                        //判断点击的文字内容
                                        if(txt=="赞"){
                                            //total值+1 因为我还没点击赞，所以要点击的时候就多了一个人 total+1
                                            newtotal=total+1;

                                            //判断赞数量 把相应文字放到赞容器里
                                            praise.innerHTML=newtotal==1 ? "我觉得很赞" : "我和" + ss ;
                                            el.innerHTML="取消赞";
                                        }
                                        else{
                                            //反之total值-1
                                            newtotal=total;
                                            praise.innerHTML=ss.substring(2);
                                            el.innerHTML="赞";

                                        }
                                        //更新total值
                                        praise.setAttribute("total",newtotal);
                                        //如果没有人点赞容器隐藏
                                        praise.style.display=(newtotal==0) ? "none" : "block";
                                    }
                                    //回复评论
                                    function reply(box,divt){


                                        console.log(divt);


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


                                        var aa = textarea.getAttribute("placeholder");

                                        if(aa==null){

                                            aa="";
                                        }




                                        //获取每条评论的innerHTML结构，每次只替换textarea的输入内容和 当前发送时间
                                        var html='<div class="comment-left">'+'<img src="images/T2.jpg" alt=""/>'+'</div>'+
                                            '<div class="comment-right">'+
                                            '<div class="comment-text"><span>我：</span>'+ aa+textarea.value+'</div>'+
                                            '<div class="comment-date">'+
                                            getTime()+
                                            '<a class="comment-zan" href="javascript:;" total="0" my="0">赞</a>'+
                                            '<a class="comment-dele" href="javascript:;">删除</a>'+
                                            '</div>'+
                                            '</div>';
                                        //插入到新建的评论div
                                        div.innerHTML=html;
                                        console.log(div);
                                        //把新评论插入到评论列表

                                        if(textarea.getAttribute("placeholder") == "" ||textarea.getAttribute("placeholder")==null){

                                            comment.appendChild(div);
                                        }
                                        else{
                                            insertAfter(div,divt);

                                        }

                                        //评论后初始化textarea输入框
                                        textarea.value="评论…";
                                        textarea.parentNode.className="hf";
                                        textarea.setAttribute("placeholder","");
                                    }

                                    // 自定义函数向后插入
                                    function insertAfter( newElement, targetElement)
                                    {
                                        var parent = targetElement.parentNode;
                                        if ( parent.lastChild == targetElement )
                                        {
                                            // 如果最后的节点是目标元素，则直接添加。因为默认是最后
                                            parent.appendChild( newElement );
                                        }
                                        else
                                        {
                                            //如果不是，则插入在目标元素的下一个兄弟节点的前面。也就是目标元素的后面
                                            parent.insertBefore( newElement, targetElement.nextSibling );
                                        }
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

                                    var comment11 = null;
                                    function operateReply(el){
                                        //每条评论
                                        var comment=el.parentNode.parentNode.parentNode;
                                        comment11 = comment;
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
                                            var ss="回复 "+user.innerHTML;
                                            //内容变为回复+当前人的名字
//                placeholder="请输入要发布的内容..."
                                            textarea.setAttribute("placeholder",ss);
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
                                                    reply(el.parentNode.parentNode.parentNode,comment11);
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




                            },
                            error: function () {
                                //alert("error occured!!!");
                            }

                        });





                    })
                }


                else{
                    divdianji.html("没有了...");
                }







                ////遍历每一个发送的条目
                $(data.themeList).each(function (index, value) {



                    var images = "";
                    $(this.imageList).each(function (index, value) {

                        var img = '<a href="'+this.imgUrl+'"><img src="'+this.samllImagUrl+'"></a>';
                        images=images+img;

                    })

                    var zanderen ="";
                    $(this.praiseUserList).each(function (index, value) {
                        var username = this.userName+"  , ";
                        zanderen=zanderen+username;
                    })




                    var comments = "";

                    $(this.commentList).each(function (index, value) {

                        var comment1 ="";
                        if(this.self){

                             comment1 =
                                '      <div class="comment" user="self">'+
                                '      <div class="comment-left"><img src="'+this.icon+'" alt=""/></div>'+
                                '      <div class="comment-right">'+
                                '      <div class="comment-text"><span class="user">我：</span>'+this.content+'</div>'+
                                '  <div class="comment-date">'+this.createTime+''+
                                '  <a class="comment-zan" href="javascript:;" total="0" my="0">赞</a>'+
                                '      <a class="comment-dele" href="javascript:;">删除</a>'+
                                '      </div>'+
                                '      </div>'+
                                '      </div>';


                        }else{
                            comment1 =
                                '      <div class="comment" user="self">'+
                                '      <div class="comment-left"><img src="'+this.icon+'" alt=""/></div>'+
                                '      <div class="comment-right">'+
                                '      <div class="comment-text"><span class="user">'+this.fromUserName+'：</span>'+this.content+'</div>'+
                                '  <div class="comment-date">'+this.createTime+''+
                                '  <a class="comment-zan" href="javascript:;" total="23" my="1">'+this.duoshaogezan+' 取消赞</a>'+
                                '  <a class="comment-dele" href="javascript:;">回复</a>'+
                                '      </div>'+
                                '      </div>'+
                                '      </div>';

                        }

                        comments= comments+comment1;


                    })

                    var li = $(
                        '  <li class="list0">'+
                        '      <a class="close" href="javascript:;">X</a>'+
                        '      <div class="head"><img src="'+this.icon+' alt=""/></div>'+
                        '      <div class="content">'+
                        '      <p class="text"><span class="name">'+this.userName+'：</span>'+this.content+'</p>'+

                        '  <div class="pic baguetteBoxOne gallery clearfix tupian">'+

                        images+
                        '      </div>'+


                        '      <div class="good"><span class="date">'+this.createTime+'</span><a class="dzan" href="javascript:;">赞</a></div>'+
                        '  <div class="people" total="'+zanderen+'">'+zanderen+'等觉得很赞</div>'+

                        '  <div class="comment-list">'+

                        comments+

                        '      </div>'+
                        '      <div class="hf">'+
                        '      <textarea type="text" class="hf-text" autocomplete="off" maxlength="100">评论…</textarea>'+
                        '  <button class="hf-btn">回复</button>'+
                        '      <span class="hf-nub">0/100</span>'+
                        '      </div>'+
                        '      </div>'+
                        '      </li>'

                    )



                    $("#pn").append(li,divdianji);




                })



                baguetteBox.run('.baguetteBoxOne', {
                    animation: 'fadeIn',
                });













                ////////////////////////////////////





              b();
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

                        var ss ="";

                        ss = praise.innerHTML;
                        //判断点击的文字内容
                        if(txt=="赞"){
                            //total值+1 因为我还没点击赞，所以要点击的时候就多了一个人 total+1
                            newtotal=total+1;

                            //判断赞数量 把相应文字放到赞容器里
                            praise.innerHTML=newtotal==1 ? "我觉得很赞" : "我和" + ss ;
                            el.innerHTML="取消赞";
                        }
                        else{
                            //反之total值-1
                            newtotal=total;
                            praise.innerHTML=ss.substring(2);
                            el.innerHTML="赞";

                        }
                        //更新total值
                        praise.setAttribute("total",newtotal);
                        //如果没有人点赞容器隐藏
                        praise.style.display=(newtotal==0) ? "none" : "block";
                    }
                    //回复评论
                    function reply(box,divt){


                        console.log(divt);


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


                        var aa = textarea.getAttribute("placeholder");

                        if(aa==null){

                            aa="";
                        }




                        //获取每条评论的innerHTML结构，每次只替换textarea的输入内容和 当前发送时间
                        var html='<div class="comment-left">'+'<img src="images/T2.jpg" alt=""/>'+'</div>'+
                            '<div class="comment-right">'+
                            '<div class="comment-text"><span>我：</span>'+ aa+textarea.value+'</div>'+
                            '<div class="comment-date">'+
                            getTime()+
                            '<a class="comment-zan" href="javascript:;" total="0" my="0">赞</a>'+
                            '<a class="comment-dele" href="javascript:;">删除</a>'+
                            '</div>'+
                            '</div>';
                        //插入到新建的评论div
                        div.innerHTML=html;
                        console.log(div);
                        //把新评论插入到评论列表

                        if(textarea.getAttribute("placeholder") == "" ||textarea.getAttribute("placeholder")==null){

                            comment.appendChild(div);
                        }
                        else{
                            insertAfter(div,divt);

                        }

                        //评论后初始化textarea输入框
                        textarea.value="评论…";
                        textarea.parentNode.className="hf";
                        textarea.setAttribute("placeholder","");
                    }

                    // 自定义函数向后插入
                    function insertAfter( newElement, targetElement)
                    {
                        var parent = targetElement.parentNode;
                        if ( parent.lastChild == targetElement )
                        {
                            // 如果最后的节点是目标元素，则直接添加。因为默认是最后
                            parent.appendChild( newElement );
                        }
                        else
                        {
                            //如果不是，则插入在目标元素的下一个兄弟节点的前面。也就是目标元素的后面
                            parent.insertBefore( newElement, targetElement.nextSibling );
                        }
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

                    var comment11 = null;
                    function operateReply(el){
                        //每条评论
                        var comment=el.parentNode.parentNode.parentNode;
                        comment11 = comment;
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
                            var ss="回复 "+user.innerHTML;
                            //内容变为回复+当前人的名字
//                placeholder="请输入要发布的内容..."
                            textarea.setAttribute("placeholder",ss);
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
                                    reply(el.parentNode.parentNode.parentNode,comment11);
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




            },
            error: function () {
                //alert("error occured!!!");
            }

        });

}
)

