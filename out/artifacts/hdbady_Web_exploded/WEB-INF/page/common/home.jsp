<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>华德幼儿园</title>

<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/default/easyui.css" id="swicth-style2">
<link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/icon.css">
<script type="text/javascript" src="js/easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
<link rel="stylesheet" href="js/pagewalkthrough/css/jquery.pagewalkthrough.css">
<script type="text/javascript" src="js/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
<style type="text/css">
*{outline: none;}
body {
    font-size: 13px;
    font-family: "微软雅黑", "宋体", Arial, sans-serif, Verdana, Tahoma;
    background-color: #ffffff;
	background-image:url(images/main_body_bg.jpg);
	background-repeat:repeat-x;
}

.window-mask{ opacity: 0.8;}

a{
    color: #000000;
}
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: underline;
}
a:active {
 text-decoration: none;
}
.cs-north {
    height:48px;
    overflow:hidden;
}
.cs-north-bg {
    width: 100%;
    height: 100%;
    background-color: #E0ECFF;
    background: url(images/header_bg.gif) repeat-x;
}
.cs-north-logo {
    height: 40px;
    margin: 8px 0px 0px 0px;
    display: inline-block;
    color:#FFFFFF;
    font-size:20px;
    text-decoration:none;
    font-family: "微软雅黑";
}
.cs-west {
    width:188px;
    padding:0px;
    border-radius:0px;
}
.cs-south {
    height:5px;background:url('js/easyui-1.4.4/themes/pepper-grinder/images/ui-bg_fine-grain_15_ffffff_60x60.png') repeat-x;padding:0px;text-align:center;
}
.cs-navi-tab {
    padding: 8px;
}
.cs-tab-menu {
    width:120px;
}
.cs-home-remark {
    padding: 10px;
}
.wrapper {
    float: right;
    height: 30px;
    margin-left: 10px;
}
.ui-skin-nav {
    float: right;
    padding: 0;
    margin-right: 10px;
    list-style: none outside none;
    height: 30px;
}

.ui-skin-nav .li-skinitem {
    float: left;
    font-size: 12px;
    line-height: 30px;
    margin-left: 10px;
    text-align: center;
}
.ui-skin-nav .li-skinitem span {
    cursor: pointer;
    width:10px;
    height:10px;
    display:inline-block;
}
.ui-skin-nav .li-skinitem span.cs-skin-on{
    border: 1px solid #FFFFFF;
}

.ui-skin-nav .li-skinitem span.gray{background-color:gray;}
.ui-skin-nav .li-skinitem span.pepper-grinder{background-color:#BC3604;}
.ui-skin-nav .li-skinitem span.blue{background-color:blue;}
.ui-skin-nav .li-skinitem span.cupertino{background-color:#D7EBF9;}
.ui-skin-nav .li-skinitem span.dark-hive{background-color:black;}
.ui-skin-nav .li-skinitem span.sunny{background-color:#FFE57E;}


/*修改tabs样式*/
#mainPanle #tabs .tabs-panels .panel{

}

#mainPanle #tabs .tabs-first{
    margin-left: 1px;
}

#mainPanle #tabs .tabs-panels .panel .panel-body{
	overflow:hidden;
}

/*修改左侧菜单样式*/

.layout-panel-west .panel-header{

    padding-top: 8px;
    padding-bottom: 8px;
    padding-left: 8px;

}

.layout-panel-west .panel-header .panel-title{

    font-size: 13px;
    font-family: "微软雅黑", "宋体", Arial, sans-serif, Verdana, Tahoma;
}



.layout-panel-west .easyui-accordion .panel .panel-header{
    padding-top: 8px;
    padding-bottom: 8px;
    padding-left: 8px;
}

.layout-panel-west .easyui-accordion .panel .panel-header .panel-title{
    font-size: 13px;
    font-family: "微软雅黑", "宋体", Arial, sans-serif, Verdana, Tahoma;
}

.layout-panel-west .easyui-accordion .panel p{
    display: block;
    padding-left: 5px;
}

.ui-skin-nav .easyui-menubutton .l-btn-text{
    color: #000000;
}

/*弹出窗口的边框样式*/

.panel-noscroll>.panel{
 transition:border linear .2s,box-shadow linear .5s;
 -moz-transition:border linear .2s,-moz-box-shadow linear .5s;
 -webkit-transition:border linear .2s,-webkit-box-shadow linear .5s;
 outline:none;
 border-color:#888888;
 box-shadow:0 0 8px #888888;
 -moz-box-shadow:0 0 8px #888888;
 -webkit-box-shadow:0 0 8px #888888;
}

.panel-noscroll>.panel .panel-header{
    /*border: 0px;*/
    border-color: #aaaaaa;
}

.panel-noscroll>.panel .panel-body{
    border: 0px;

}
#openWindow{
    background-color:#E0ECFF;
    overflow: hidden;    
}

.selected-menu{
    color:red;
}

#walkthrough-content{display:none}
#walkthrough-content h3.tiptextfont{}
#walkthrough-content p{line-height:36px;}


</style>
<script type="text/javascript">


/* 引导手册动画，定义所有能操作的步骤 */

/* 总引导教程 */
var allMenuDatas = [
    {
        title: '学校设置',
        contentSelector: '#all-tutorial-1'
    },
    {
        title: '年级设置',
        contentSelector: '#all-tutorial-2'
    },
    {
        title: '用户资料项设置',
        contentSelector: '#all-tutorial-3'
    },
    {
        title: '班级类型设置',
        contentSelector: '#all-tutorial-4'
    },
    {
        title: '课程表设置',
        contentSelector: '#all-tutorial-5'
    },
    {
        title: '教学科目设置',
        contentSelector: '#all-tutorial-6'
    },
    {
        title: '教职工职务设置',
        contentSelector: '#all-tutorial-7'
    },
    {
        title: '组织机构设置',
        contentSelector: '#all-tutorial-8'
    },
    {
        title: '考勤参数设置',
        contentSelector: '#all-tutorial-9'
    },
    {
        title: '角色权限设置',
        contentSelector: '#all-tutorial-10'
    },	
    {
        title: '教职工管理',
        contentSelector: '#all-tutorial-11'
    },
    {
        title: '班级管理',
        contentSelector: '#all-tutorial-12'
    },
    {
        title: '学生管理',
        contentSelector: '#all-tutorial-13'
    },
    {
        title: '学生预约管理',
        contentSelector: '#all-tutorial-14'
    },	
    {
        title: '课程表管理',
        contentSelector: '#all-tutorial-15'
    }
]

/*学生管理 引导教程*/
var studentMangerMenuDatas = [
    {
        title: '学生预约管理',
        contentSelector: '#student-tutorial-1'
    },
    {
        title: '学生管理',
        contentSelector: '#student-tutorial-2'
    },
    {
        title: '学生变动记录',
        contentSelector: '#student-tutorial-3'
    }
	
]


/*教职工管理 引导教程*/
var teacherMangerMenuDatas = [
    {
        title: '教职工管理',
        contentSelector: '#teacher-tutorial-1'
    },
    {
        title: '教职工变动记录',
        contentSelector: '#teacher-tutorial-2'
    }
]


/*班级管理 引导教程*/
var classMangerMenuDatas = [
    {
        title: '班级管理',
        contentSelector: '#class-tutorial-1'
    },
    {
        title: '班级变动记录',
        contentSelector: '#class-tutorial-2'
    }
]


/*课程表管理 引导教程*/
var classtableMangerMenuDatas = [
    {
        title: '课程表管理',
        contentSelector: '#classtable-tutorial-1'
    },
    {
        title: '课程表数量统计',
        contentSelector: '#classtable-tutorial-2'
    }
]


/*考勤管理 引导教程*/
var clockMangerMenuDatas = [

    {
        title: '学生请假管理',
        contentSelector: '#clock-tutorial-1'
    },
    {
        title: '学生日考勤记录',
        contentSelector: '#clock-tutorial-2'
    },
    {
        title: '学生月考勤统计',
        contentSelector: '#clock-tutorial-3'
    },
    {
        title: '教职工请假管理',
        contentSelector: '#clock-tutorial-4'
    },
    {
        title: '教职工日考勤记录',
        contentSelector: '#clock-tutorial-5'
    },
    {
        title: '教职工月考勤统计',
        contentSelector: '#clock-tutorial-6'
    }
]



/*公告问卷 引导教程*/
var noticeMangerMenuDatas = [
    {
        title: '通知公告管理',
        contentSelector: '#notice-tutorial-1'
    },
    {
        title: '问卷调查管理',
        contentSelector: '#notice-tutorial-2'
    }
]

/*收费管理 引导教程*/
var feeMangerMenuDatas = [
    {
        title: '收费项管理',
        contentSelector: '#fee-tutorial-1'
    },
    {
        title: '收费任务管理',
        contentSelector: '#fee-tutorial-2'
    },
    {
        title: '我要收退费',
        contentSelector: '#fee-tutorial-3'
    },
    {
        title: '收退费流水',
        contentSelector: '#fee-tutorial-4'
    },
    {
        title: 'APP收费账户管理',
        contentSelector: '#fee-tutorial-5'
    },
    {
        title: 'APP收费账户流水',
        contentSelector: '#fee-tutorial-6'
    },
    {
        title: '学生账户管理',
        contentSelector: '#fee-tutorial-7'
    },
    {
        title: '学生账户流水',
        contentSelector: '#fee-tutorial-8'
    },
    {
        title: '收费统计报表',
        contentSelector: '#fee-tutorial-9'
    }
]


/*食谱管理 引导教程*/
var cookbookMangerMenuDatas = [
    {
        title: '食谱查询',
        contentSelector: '#cookbook-tutorial-1'
    },
    {
        title: '食谱数量统计',
        contentSelector: '#cookbook-tutorial-2'
    }
]



/*作业管理 引导教程*/
var homeworkMangerMenuDatas = [
                               {
                                   title: '作业查询',
                                   contentSelector: '#homework-tutorial-1'
                               },
                               {
                                   title: '作业统计',
                                   contentSelector: '#homework-tutorial-2'
                               }
]


/*基础参数管理 引导教程*/
var configMangerMenuDatas = [
    {
        title: '学校设置',
        contentSelector: '#config-tutorial-1'
    },
    {
        title: '年级设置',
        contentSelector: '#config-tutorial-2'
    },
    {
        title: '用户资料项设置',
        contentSelector: '#config-tutorial-3'
    },
    {
        title: '班级类型设置',
        contentSelector: '#config-tutorial-4'
    },
    {
        title: '课程表设置',
        contentSelector: '#config-tutorial-5'
    },
    {
        title: '教学科目设置',
        contentSelector: '#config-tutorial-6'
    },
    {
        title: '教职工职务设置',
        contentSelector: '#config-tutorial-7'
    },
    {
        title: '组织机构设置',
        contentSelector: '#config-tutorial-8'
    },
    {
        title: '考勤参数设置',
        contentSelector: '#config-tutorial-9'
    },
    {
        title: '会员参数设置',
        contentSelector: '#config-tutorial-10'
    },
    {
        title: '角色权限设置',
        contentSelector: '#config-tutorial-11'
    }
]


/*引导教程结束*/


var userId = '1';
userId = eval('('+userId+')');

var pcLoginNum = '230';
pcLoginNum = eval('('+pcLoginNum+')');

window.closeWinIsReloadData = 0; // 关闭窗口的时候是否重新刷新页面数据, 0不重新刷新, 1刷新
window.closeDialogIsReloadData = 0; // 关闭dialog窗口的时候是否重新刷新页面数据, 0不重新刷新, 1刷新

window.passDataForHypertextTransfer = null; //定义 JS 跨域传输的 json 数据

window.windowHeight = $(window).height(); //定义全局的高度
window.windowWidth = $(window).width(); //定义全局的高度

var currentCsnaviTabIds = []; // 当前所有菜单的Id
var pagewalkthrough = [];

/* 新增菜单cookie */
function addTeacherMuens(tempUrlObj) {
    var tempTeacherMuenCookie = $.cookie('tempTeacherMuen' + userId);
    var tempTeacherMuens = tempTeacherMuenCookie != undefined? JSON.parse(tempTeacherMuenCookie): [];

    var isExists = false;
    for (var i = 0; i < tempTeacherMuens.length; i++) {
        if (tempTeacherMuens[i].title == tempUrlObj.title) {
            isExists = true;
            break;
        }
    }

    if ( ! isExists) {
        tempTeacherMuens.push(tempUrlObj);
        $.cookie('tempTeacherMuen' + userId, JSON.stringify(tempTeacherMuens), { expires: 365, path: '/' });
    }
}

/* 移除菜单cookie */
function removeTeacherMuens(title) {
    var tempTeacherMuenCookie = $.cookie('tempTeacherMuen'+ userId);
    var tempTeacherMuens = tempTeacherMuenCookie != undefined? JSON.parse(tempTeacherMuenCookie): [];

    var newTempTeacherMuens = [];
    for (var i = 0; i < tempTeacherMuens.length; i++) {
        if (tempTeacherMuens[i].title != title) {
            newTempTeacherMuens.push(tempTeacherMuens[i]);
        }
    }

    $.cookie('tempTeacherMuen' + userId, JSON.stringify(newTempTeacherMuens), { expires: 365, path: '/' });
}

function addTab(title, url){
    var tempUrlObj = {};
    tempUrlObj.url = url;
    tempUrlObj.title = title;

    addTeacherMuens(tempUrlObj);

    $('.selected-menu').removeClass('selected-menu');
    $('.accordion-body').css('display', 'none');
    $('.accordion-header-selected').removeClass('accordion-header-selected');
    $('.selected-menu').removeClass('selected-menu');
    var tempCurrentTab = '.cs-navi-tab[src="' + url +'"]';
    $(tempCurrentTab).addClass('selected-menu');

    $(tempCurrentTab).closest('.accordion-body').css('display', 'block');
    $(tempCurrentTab).closest('.accordion-body').siblings('.accordion-header').addClass('accordion-header-selected');
    $(tempCurrentTab).closest('.accordion-body').siblings('.accordion-header').find('.accordion-collapse').removeClass('accordion-expand');

    if ($('#tabs').tabs('exists', title)){
        $('#tabs').tabs('select', title);//选中并刷新
        var currTab = $('#tabs').tabs('getSelected');
        var url = $(currTab.panel('options').content).attr('src');

        if(url != undefined && currTab.panel('options').title != '首页') {
            $('#tabs').tabs('update',{
                tab:currTab,
                options:{
                    content:createFrame(url)
                }
            })
        }
    } else {
        var content = createFrame(url);
        $('#tabs').tabs('add',{
            title:title,
            content:content,
            closable:true
        });
    }
    tabClose();
}
function createFrame(url) {
    var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
    return s;
}
        
function tabClose() {
    /*双击关闭TAB选项卡*/
    $(".tabs-inner").dblclick(function(){
        var subtitle = $(this).children(".tabs-closable").text();
        $('#tabs').tabs('close',subtitle);
        removeTeacherMuens(subtitle);
    })
    /*为选项卡绑定右键*/
    $(".tabs-inner").bind('contextmenu',function(e){
        $('#mm').menu('show', {
            left: e.pageX,
            top: e.pageY
        });

        var subtitle =$(this).children(".tabs-closable").text();

        $('#mm').data("currtab",subtitle);
        $('#tabs').tabs('select',subtitle);
        return false;
    });
}       
//绑定右键菜单事件
function tabCloseEven() {
    //刷新
    $('#mm-tabupdate').click(function(){
        var currTab = $('#tabs').tabs('getSelected');
        var url = $(currTab.panel('options').content).attr('src');
        if(url != undefined && currTab.panel('options').title != '首页') {
            $('#tabs').tabs('update',{
                tab:currTab,
                options:{
                    content:createFrame(url)
                }
            })
        }
    })
    //关闭当前
    $('#mm-tabclose').click(function(){
        var currtab_title = $('#mm').data("currtab");
        removeTeacherMuens(currtab_title);
        $('#tabs').tabs('close',currtab_title);
    })
    //全部关闭
    $('#mm-tabcloseall').click(function(){
        $('.tabs-inner span').each(function(i,n){
            var t = $(n).text();
            if(t != '首页') {
                $('#tabs').tabs('close',t);
                removeTeacherMuens(t);
            }
        });
    });
    //关闭除当前之外的TAB
    $('#mm-tabcloseother').click(function(){
        var prevall = $('.tabs-selected').prevAll();
        var nextall = $('.tabs-selected').nextAll();        
        if(prevall.length>0){
            prevall.each(function(i,n){
                var t=$('a:eq(0) span',$(n)).text();
                if(t != '首页') {
                    $('#tabs').tabs('close',t);
                    removeTeacherMuens(t);
                }
            });
        }
        if(nextall.length>0) {
            nextall.each(function(i,n){
                var t=$('a:eq(0) span',$(n)).text();
                if(t != '首页') {
                    $('#tabs').tabs('close',t);
                    removeTeacherMuens(t);
                }
            });
        }
        return false;
    });
    //关闭当前右侧的TAB
    $('#mm-tabcloseright').click(function(){
        var nextall = $('.tabs-selected').nextAll();
        if(nextall.length==0){
            //msgShow('系统提示','后边没有啦~~','error');
            alert('后边没有啦~~');
            return false;
        }
        nextall.each(function(i,n){
            var t=$('a:eq(0) span',$(n)).text();
            $('#tabs').tabs('close',t);
            removeTeacherMuens(t);
        });
        return false;
    });
    //关闭当前左侧的TAB
    $('#mm-tabcloseleft').click(function(){
        var prevall = $('.tabs-selected').prevAll();
        if(prevall.length==0){
            alert('到头了，前边没有啦~~');
            return false;
        }
        prevall.each(function(i,n){
            var t=$('a:eq(0) span',$(n)).text();
            $('#tabs').tabs('close',t);
            removeTeacherMuens(t);
        });
        return false;
    });

    //退出
    $("#mm-exit").click(function(){
        $('#mm').menu('hide');
    })
}

$(function() {
    tabCloseEven();

    $('.cs-navi-tab').click(function() {
        var $this = $(this);
        var href = $this.attr('src');
        var title = $this.text();
        addTab(title, href);
    });

    var themes = {
        'gray' : 'js/easyui-1.4.4/themes/gray/easyui.css',
        'pepper-grinder' : 'js/easyui-1.4.4/themes/pepper-grinder/easyui.css',
        'blue' : 'js/easyui-1.4.4/themes/default/easyui.css',
        'cupertino' : 'js/easyui-1.4.4/themes/cupertino/easyui.css',
        'dark-hive' : 'js/easyui-1.4.4/themes/dark-hive/easyui.css',
        'sunny' : 'js/easyui-1.4.4/themes/sunny/easyui.css'
    };

    var skins = $('.li-skinitem span').click(function() {
        var $this = $(this);
        if($this.hasClass('cs-skin-on')) return;
        skins.removeClass('cs-skin-on');
        $this.addClass('cs-skin-on');
        var skin = $this.attr('rel');
        $('#swicth-style').attr('href', themes[skin]);
        setCookie('cs-skin', skin);
        skin == 'dark-hive' ? $('.cs-north-logo').css('color', '#FFFFFF') : $('.cs-north-logo').css('color', '#000000');
    });

    if(getCookie('cs-skin')) {
        var skin = getCookie('cs-skin');
        $('#swicth-style').attr('href', themes[skin]);
        $this = $('.li-skinitem span[rel='+skin+']');
        $this.addClass('cs-skin-on');
        skin == 'dark-hive' ? $('.cs-north-logo').css('color', '#FFFFFF') : $('.cs-north-logo').css('color', '#000000');
    }

    /* 初始化菜单 */
    $('#tabs').tabs({
        border:false,
        onClose:function(title, index){
            removeTeacherMuens(title);
        },
        onSelect:function (title) {
            $('.selected-menu').removeClass('selected-menu');
            $('.accordion-body').css('display', 'none');
            $('.accordion-header-selected').removeClass('accordion-header-selected');

            /* 处理图标 */
            $.each($('.accordion-collapse'), function (k, v) {
               if ( ! $(v).hasClass('accordion-expand')) {
                   $(v).addClass('accordion-expand');
               }
            });

            $.each($('.cs-navi-tab'), function (k, v) {
                   if ($(v).text() == title) {
                       $(v).closest('.accordion-body').css('display', 'block');
                       $(v).closest('.accordion-body').siblings('.accordion-header').addClass('accordion-header-selected');
                       $(v).closest('.accordion-body').siblings('.accordion-header').find('.accordion-collapse').removeClass('accordion-expand');
                       $(v).addClass('selected-menu');
                       return false;
                   }
            });
        }
    });
});

/* 显示错误信息 */
function showMessage(title, errorMsg) {
    $.messager.show({
        title: title,
        msg: errorMsg
    });
}

/* 显示错误信息 */
function showAlert(title, errorMsg, type) {
    type = type == undefined? 'error': type;
    $.messager.alert({
        title: title,
        msg: errorMsg,
        icon: type
    });
}

function setCookie(name,value) {//两个参数，一个是cookie的名子，一个是值
    var Days = 30; //此 cookie 将被保存 30 天
    var exp = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

function getCookie(name) {//取cookies函数        
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
     if(arr != null) return unescape(arr[2]); return null;
}

//新手引导 方法
function noviceGuide(){
    $("#noviceGuide").css({width:windowWidth, height:windowHeight}).show();
    var html = '<div id="noviceGuideImg"></div>';
    //第一步
    $("#noviceGuide").html(html);
}

$(function(){
    //noviceGuide();

    $(".panel-tool").on("click",function(){
        parent.$('#openWindow').window('close',true);
    })
    //自动问候

    var now=new Date();
    var hr;
    hr=now.getHours();

    if (hr>=0 && hr<=4)
    {
        $("#welcomeword").html("深夜好");
    }

    if (hr>4 && hr<=7)
    {
        $("#welcomeword").html("清晨好");
    }

    if (hr>7 && hr<=9)
    {
        $("#welcomeword").html("早上好");
    }

    if (hr>9 && hr<=11)
    {    
        $("#welcomeword").html("上午好");        
    }

    if (hr>11 && hr<=14)
    {
        $("#welcomeword").html("中午好");
    }

    if (hr>14 && hr<=17)
    {
        $("#welcomeword").html("下午好");
    }

    if (hr>17 && hr<=19)
    {
        $("#welcomeword").html("傍晚好");
    }

    if (hr>19 && hr<=23)
    {
        $("#welcomeword").html("晚上好");
    }

    if (hr>23 && hr<=24)
    {
        $("#welcomeword").html("深夜好");
    }

    var tempTeacherMuenCookie = $.cookie('tempTeacherMuen' + userId);
    var tempTeacherMuens = tempTeacherMuenCookie != undefined? JSON.parse(tempTeacherMuenCookie): [];
    for (var i = 0; i < tempTeacherMuens.length; i++) {
        addTab(tempTeacherMuens[i].title, tempTeacherMuens[i].url);
    }
    addTab('首页', undefined);

    if (pcLoginNum <= 2) {
        showMenuHelp('allMenuDatas');
    }

    if($('.accordion-header').length == 1){
        $('.accordion-header').addClass('accordion-header-selected');
        $('.accordion-header').parent('.panel').find('.accordion-body').show();
    }
})


/* 显示帮助教程 */
function showMenuHelp(tempAllMenuDatasName) {
    var tempAllMenuDatas = eval(tempAllMenuDatasName);
    pagewalkthrough = [];
    
    /* 读取当前所有的菜单 */
    var currentCsnaviTabs = $('.cs-navi-tab');
    $.each(currentCsnaviTabs, function (k, v) {
        currentCsnaviTabIds.push($(v).attr('id'));
    });

    for (var i = 0; i < tempAllMenuDatas.length; i++) {
        if (currentCsnaviTabIds.indexOf('navi-tab-' + $.md5(tempAllMenuDatas[i].title)) != -1) {
            var tempStepsData = {};
            tempStepsData.wrapper = '#navi-tab-' + $.md5(tempAllMenuDatas[i].title);
            tempStepsData.popup = {};
            tempStepsData.popup.content = tempAllMenuDatas[i].contentSelector;
            tempStepsData.popup.type = 'tooltip';
            tempStepsData.popup.position = 'right';
            pagewalkthrough.push(tempStepsData);
        }
    }

    // Set up tour
    $('body').pagewalkthrough({
        name: 'introduction',
        steps: pagewalkthrough
    });

    if (pagewalkthrough.length > 0) {
        // Show the tour
        $('body').pagewalkthrough('show');
    }
}

/**
 * 修改 个人信息
 */
function editUserInfo(){
    var url = '${pageContext.request.contextPath}/page_teacher_teacher-edit-self.action';
    var title = '编辑个人信息';
    var width = 600;
    var height = 252;
    editUserOpenWindow(url,title,width,height);
}

/**
 * 修改 个人密码
 */
function editUserPassword(){
    var url = '${pageContext.request.contextPath}/page_teacher_teacher-edit-password.action';
    var title = '修改密码';
    var width = 398;
    var height = 228;
    editUserOpenWindow(url,title,width,height);
}

function editUserOpenWindow(url,title,width,height){
    var content = '<iframe name="eui-open-page" scrolling="no" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>';
    $('#openWindow').window({
        title: title,
        minimizable:false,
        collapsible:false,
        maximizable:false,
        top:($(window).height() - height) * 0.5,
        left:($(window).width() - width) * 0.5,
        width: width,
        height: height,
        content: content,
        modal: true,
        animate: true,
        onBeforeClose:function(){

        }
    });
}

</script>


</head>

<body>
<!-- 导航菜单教程 -->

<!--引导教程 开始-->
<div id="walkthrough-content">
	<!--总教程开始-->
    <div id="all-tutorial-1">
        <h3>首先请在这里设置学校的相关参数，如：每个学期的开学月份，何时对班级进行自动升级，标定学校的地理位置，学校的名称，招生联系人等。</h3><h3>如果您有多个学校也请在这里创建。</h3>
    </div>
    <div id="all-tutorial-2">
        <h3>在这里，请设置好学校的年级信息，年级中的班级将按这里设置的顺序每年自动升级。</h3>
    </div>
    <div id="all-tutorial-3">
        <h3>设置学生和教职工的自定义资料项，比如：星座、生日等资料项。如果没有另外设置资料项的需求，请忽略此设置。</h3>
    </div>
    <div id="all-tutorial-4">
        <h3>设置班级的类型参数，类似于班级的标签或属性，如：舞蹈班，音乐班，书法班等，在创建班级时可以给班级指定相应的类型。若学校没有按类型分班的要求可忽略此设置。</h3>
    </div>
    <div id="all-tutorial-5">
        <h3>设置学校的上课时间和课程安排参数，比如：上午几节课，下午几节课，上课和下课时间等。</h3>
    </div>

    <div id="all-tutorial-6">
        <h3>设置学校开设的教学科目，并指定具体科目开设在哪些年级。</h3>
    </div>
	
	<div id="all-tutorial-7">
        <h3>设置教职工的职务信息。职务并不与操作权限关联，系统的操作权限需要在权限角色中设置。</h3>
    </div>	
	
	<div id="all-tutorial-8">
        <h3>设置整个集团或学校的组织架构。</h3>
    </div>
	
	<div id="all-tutorial-9">
        <h3>设置学校的考勤参数，指定休息日，每月应出勤的天数，教职工上下班时间，学生上学放学时间等。</h3>
    </div>
	
	<div id="all-tutorial-10">
        <h3>角色与操作权限关联，用户只要分配对应的角色，就会拥有角色所对应的操作权限。</h3>
    </div>
	
	<div id="all-tutorial-11">
        <h3>配置好基础参数后，请导入教职工资料，教职工资料导入后，教职工就可以在教师端APP或电脑端登录系统。</h3>
    </div>
	
	<div id="all-tutorial-12">
        <h3>导入好教职工后，请在此创建学校的班级信息，班级创建以后，才可以导入学生到班级里面，班级就像是一个学生容器。</h3>
    </div>
	
	<div id="all-tutorial-13">
        <h3>班级创建好了以后，就可以往班级里面导入或录入学生信息了，学生录入后并确认入学后，家长就可以在家长端APP，关联该学生。</h3>
    </div>
	
	<div id="all-tutorial-14">
        <h3>每学期开学时，可以在此录入预约的学生，家长也可以通过APP进行学生预约，预约的学生审核后，会自动录入到在校学生中。</h3>
    </div>
	
	<div id="all-tutorial-15">
        <h3>老师，学生都录入了，班级也创建好了，就要给每个班级创建课程表，课程表创建并发布后，整个软件就正常的可以用起来了。</h3>
    </div>
	
	<!--总教程 结束-->
	
	<!--学生管理-->
	<div id="student-tutorial-1">
        <h3>这里可以管理学校的学生预约信息，预约可以在此现场录入，也可以通过家长端APP进行预约，预约的信息审核后，自动录入正式学生库中。</h3>
    </div>
	<div id="student-tutorial-2">
        <h3>这里对学生信息进行统一管理，可以对学生进行分班，确认入学，调班，休学，退学等操作。可以单个录入学生信息，也可以批量导入学生信息。</h3>
    </div>
	<div id="student-tutorial-3">
        <h3>这里可以统一查看学生的变动记录，详细记录每个学生的变动情况，家长也可以通过手机APP查询到自己所关联学生的变动信息。</h3>
    </div>
	<!--学生管理结束-->
	
	<!--教职工管理-->
	<div id="teacher-tutorial-1">
        <h3>这里可以管理学校的教职工，可以单个录入教职工信息，也可以批量导入，教职工资料导入后，教职工就可以在教师端APP或电脑端登录系统。也可以对教职工进行离休、退休、休假等操作。</h3>
    </div>
	<div id="teacher-tutorial-2">
        <h3>教职工的所有变动记录，都会被系统记录下来，在这里可以随时查询。</h3>
    </div>
	<!--教职工管理结束-->
	
	
	<!--班级管理-->
	<div id="class-tutorial-1">
        <h3>班级就是一个学生容器，必须创建班级后，才能导入学生，班级会按学校设置的时间，每年自动进行升级操作，升级时，班级中的学生也会自动跟随班级一起升级，每个班级被创建后，都会在每年自动升级直到该班级毕业或被删除。</h3>
    </div>
	<div id="class-tutorial-2">
        <h3>班级的变动和班主任调整等信息都会被记录下来，可在这里随时查看。</h3>
    </div>
	<!--班级管理结束-->
	
	<!--公告问卷管理-->
	<div id="notice-tutorial-1">
	    <h3>这里发布的通知公告，可以指定推送对象，直接推送到对方的手机APP上，并能查看每个通知公告的浏览情况。</h3>
	</div>
	<div id="notice-tutorial-2">
	    <h3>为了对教职工或家长进行问卷调查，可以在这里发布的问卷调查，指定推送对象后，直接推送到对方的手机APP上，并能查看每个问卷调查的统计结果。</h3>
	</div>
	<!--结束-->	
	
	<!--课程表管理-->
	<div id="classtable-tutorial-1">
        <h3>每个班级在每个学期都有一张课程表，课程表记录了每个班的排课信息，在每个学期开学前10天才可以创建该学期的课程表，课程表在发布后才会生效。</h3>
    </div>
	<div id="classtable-tutorial-2">
        <h3>课程表建好后，每个班级的排课信息就确定了，这里可以对整个学校的排课信息进行统计。</h3>
    </div>
	<!--结束-->
	
	<!--考勤管理-->

	<div id="clock-tutorial-1">
        <h3>学生的请假通常由学生家长在手机APP端申请，老师也可以在教师版手机APP端进行审批管理，但在这里也可以直接进行学生请假申请录入和审批管理。</h3>
    </div>
	<div id="clock-tutorial-2">
        <h3>这里可以查看学生的每日考勤细节，包括签到确认人，签到签退位置，签到签退时间等，并能打印当天出勤记录报表。</h3>
    </div>
	<div id="clock-tutorial-3">
        <h3>这里可以查看学生的月考勤统计报表，并打印学生的月考勤统计报表。</h3>
    </div>

	<div id="clock-tutorial-4">
        <h3>教职工可以在教师版手机APP端进行请假申请和审批管理，但在这里也可以直接进行教职工请假申请录入和审批管理。</h3>
    </div>
	<div id="clock-tutorial-5">
        <h3>这里可以查看教职工的每日考勤细节，包括上下班打卡位置、考勤状态、打卡时间等。</h3>
    </div>
	<div id="clock-tutorial-6">
        <h3>这里可以查看教职工的月考勤统计报表并进行打印导出等操作。</h3>
    </div>

	<!--结束-->
	
	
	<!--作业开始-->
	
	
	<div id="homework-tutorial-1">
        <h3>这里可以对老师发布的作业进行查询。</h3>
    </div>
	<div id="homework-tutorial-2">
        <h3>这里可以对老师发布的作业进行统计。</h3>
    </div>
	<!--作业结束-->
	
	<!--食谱管理-->
	<div id="cookbook-tutorial-1">
        <h3>食谱的发布在教师版手机APP上操作，这里可以查询所有老师的食谱发布情况。只有班主任或班级管理员才可以发布食谱。</h3>
    </div>
	<div id="cookbook-tutorial-2">
        <h3>这里可以对老师发布的食谱进行统计。</h3>
    </div>
	<!--结束-->	
	
	<!--收费管理-->
	<div id="fee-tutorial-1">
        <h3>首先要新建收费项，同一类的收费项可以归类到一个收费分类里面，每个收费项可以根据需要设置收费优惠规则和退费规则。</h3>
    </div>
	<div id="fee-tutorial-2">
        <h3>收费项配置好了以后，就可以创建收费任务，每个收费任务里面会包含特定的收费项，收费任务就好比是收费项的容器。收费任务可以提前指定给学生，学生家长就可以通过手机APP收到待缴费通知。</h3>
    </div>
	<div id="fee-tutorial-3">
        <h3>在这里可以查询所有学生的缴费和欠费情况，也可以在这里进行现场缴费。</h3>
    </div>
	<div id="fee-tutorial-4">
        <h3>这里可以查询所有学生的缴费和退费记录，也可对记录进行作废处理。</h3>
    </div>
	<div id="fee-tutorial-5">
        <h3>这里可以对手机APP收费账户进行管理，可以设置是否支持家长从手机APP进行缴费，也可以对收费账户进行提现操作。</h3>
    </div>
	<div id="fee-tutorial-6">
        <h3>这里可以查看所有手机APP收费账户的收费记录和提现记录。</h3>
    </div>
	<div id="fee-tutorial-7">
        <h3>这里可以管理学生收费账户，学生家长可以提前预交费用到学生账户，后续缴费时会用学生账户余额进行优先抵扣。</h3>
    </div>
	<div id="fee-tutorial-8">
        <h3>可在这里查询所有学生账户的出入账流水记录。</h3>
    </div>
	<div id="fee-tutorial-9">
        <h3>这里可以查看各种的收费统计报表，让您对学校的收费情况了如指掌。</h3>
    </div>
	<!--结束-->
	
	<!--参数配置-->
    <div id="config-tutorial-1">
        <h3>首先请在这里设置学校的相关参数，如：每个学期的开学月份，学期名称，标定学校的地理位置，学校的名称，招生联系人，学校微信公众号信息等。</h3><h3>如果您有多个学校也请在这里创建。</h3>
    </div>
    <div id="config-tutorial-2">
        <h3>在这里，请设置好学校的年级信息。</h3>
    </div>
    <div id="config-tutorial-3">
        <h3>设置学生和教职工的自定义资料项，比如：星座、生日等资料项。如果没有另外设置资料项的需求，请忽略此设置。</h3>
    </div>
    <div id="config-tutorial-4">
        <h3>设置班级的类型参数，类似于班级的标签或属性项目，如：舞蹈班，音乐班，书法班等，在创建班级时可以给班级指定相应的类型。若学校没有按类型分班的要求可忽略此设置。</h3>
    </div>
    <div id="config-tutorial-5">
        <h3>设置学校的上课时间和课程安排参数，比如：上午几节课，下午几节课，上课和下课时间等。</h3>
    </div>

    <div id="config-tutorial-6">
        <h3>设置学校开设的教学科目，并指定具体科目开设在哪些年级。</h3>
    </div>
	
	<div id="config-tutorial-7">
        <h3>设置教职工的职务信息。职务并不与操作权限关联，系统的操作权限需要在权限角色中设置。</h3>
    </div>	
	
	<div id="config-tutorial-8">
        <h3>设置整个集团或学校的组织部门架构，方便对教职工进行管理。</h3>
    </div>
	
	<div id="config-tutorial-9">
        <h3>设置学校的考勤参数，指定休息日，每月应出勤的天数，教职工上下班时间，学生上学放学时间等。</h3>
    </div>
	
	<div id="config-tutorial-10">
        <h3>在这里可以设置视频会员的开放日期和时段等参数，查看短信会员的参数设置等。</h3>
    </div>
		
	<div id="config-tutorial-11">
        <h3>角色与权限关联，用户只要分配对应的角色，就会拥有角色所对应的操作权限和可管理数据范围。</h3>
    </div>

	<!--结束-->	
	
</div>
<!--引导教程 结束-->


<div class="easyui-layout" fit="true" style="padding:0px; margin:0px; margin-left:8px;">
    <div region="north" border="false" class="cs-north">
        <div class="cs-north-bg">
        <div class="cs-north-logo"><img src="images/main_title_logo.png" align="absmiddle"><span  style="color:#FFFFFF; padding-left:8px;">华德幼儿园</span><span style="margin-left:28px; font-size:14px;color:#E7F0FE;">
                <span id="welcomeword"></span>,${session.loginUser.teacher_name}         
            </span></div>
            
        <div class="ui-skin-nav" style="margin-right:16px; margin-top:8px;">
			<a href="javascript:void(0);" onClick="showMenuHelp('allMenuDatas')" plain="true" class="easyui-linkbutton" data-options="iconCls:'icon-help'" style="color:#000000;">操作指引</a>
			
            <a href="javascript:void(0)" id="mb-mycenter" class="easyui-menubutton"
                data-options="menu:'#mycenter',iconCls:'icon-man'">个人中心</a>
            <div id="mycenter" style="width:118px;">
            <s:if test="#session.loginUser.phone!='admin'">
                <div data-options="iconCls:'icon-edit'" onClick="editUserInfo()">编辑个人信息</div>
            </s:if>
                <div data-options="iconCls:'icon-lock'" onClick="editUserPassword()">修改密码</div>

            </div>
			
			<!-- <a href="javascript:void(0)" id="mb-kefu" class="easyui-menubutton"
                data-options="menu:'#mykefu',iconCls:'icon-qq'"></a>
            <div id="mykefu" style="width:128px;">
			
				
			   <div class="menu-sep"></div>
              
				
            </div> -->
			
            

            <a id="btn" href="${pageContext.request.contextPath}/teacherAction_logout.action" class="easyui-linkbutton" data-options="iconCls:'icon-no'">安全退出</a>
        </div>

      

        </div>
    </div>
    <div region="west" border="true" split="false" title="功能导航菜单" class="cs-west" style="width:138px;">
        <div class="easyui-accordion" fit="false" multiple="true" border="false">
            <!-- 左部菜单  -->
           				
                            <shiro:hasPermission name="page_student"><div title="学生管理" >
                            
                            				<shiro:hasPermission name="page_student_student-bespeak"><p><a href="javascript:void(0);" id="navi-tab-b037ef49f8a10cd1eff4ce6a0d04b7d8" src="${pageContext.request.contextPath}/page_student_student-bespeak.action" class="cs-navi-tab">学生预约管理</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_student_student"><p><a href="javascript:void(0);" id="navi-tab-e2911993c13e23d900f0e6a2240c0d0d" src="${pageContext.request.contextPath}/page_student_student.action " class="cs-navi-tab">学生管理</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_student_student-change-log"><p><a href="javascript:void(0);" id="navi-tab-d770b7021cbd3e27f9e3d6a4dc08d02e" src="${pageContext.request.contextPath}/page_student_student-change-log.action" class="cs-navi-tab">学生变动记录</a></p></shiro:hasPermission>
                                    </div></shiro:hasPermission>
                            <shiro:hasPermission name="page_teacher"><div title="教职工管理" >
                                            <shiro:hasPermission name="page_teacher_teacher"><p><a href="javascript:void(0);" id="navi-tab-0db36768ea5fa8dcf049fea4c8c58b6b" src="${pageContext.request.contextPath}/page_teacher_teacher.action" class="cs-navi-tab">教职工管理</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_teacher_teacher-change-log"><p><a href="javascript:void(0);" id="navi-tab-c68b231041510ead0f601b6d5f781e9d" src="${pageContext.request.contextPath}/page_teacher_teacher-change-log.action" class="cs-navi-tab">教职工变动记录</a></p></shiro:hasPermission>
                                    </div></shiro:hasPermission>
                            <shiro:hasPermission name="page_class"><div title="班级管理" >
                                            <shiro:hasPermission name="page_class_class"><p><a href="javascript:void(0);" id="navi-tab-f101610a063d04a725aa87b8b58c0719" src="${pageContext.request.contextPath}/page_class_class.action" class="cs-navi-tab">班级管理</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_class_class-change-log"><p><a href="javascript:void(0);" id="navi-tab-fd88264f179ee5acac92312618a123c1" src="${pageContext.request.contextPath}/page_class_class-change-log.action" class="cs-navi-tab">班级变动记录</a></p></shiro:hasPermission>
                                    </div></shiro:hasPermission>
                            <shiro:hasPermission name="page_kebiao"><div title="课程表管理" >
                                            <shiro:hasPermission name="page_kebiao_class-curricula"><p><a href="javascript:void(0);" id="navi-tab-1dbfc0c924c9c2d10ca6901090b95fa7" src="${pageContext.request.contextPath}/page_curricula_class-curricula.action" class="cs-navi-tab">课程表管理</a></p></shiro:hasPermission>
                                            <%-- <shiro:hasPermission name="page_kebiao_class-curricula-count"><p><a href="javascript:void(0);" id="navi-tab-04f9ac950d2f79a601bcee3aa225ba40" src="${pageContext.request.contextPath}/page_curricula_class-curricula-count.action" class="cs-navi-tab">课程表数量统计</a></p></shiro:hasPermission> --%>
                                    </div></shiro:hasPermission>
                            
                            <%-- <shiro:hasPermission name="page_money"><div title="收费管理" >
                                            <p><a href="javascript:void(0);" id="navi-tab-ec8bc8c341c93955e5786bc1c314bf6d" src="school-payitem.html" class="cs-navi-tab">收费项管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-1f3fcf0935a283be23131ad50d841c57" src="plan-collect-fee.html" class="cs-navi-tab">收费任务管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-ee1d8619b6cca038f9e116fd2bc90820" src="school-accept-refund-money.html" class="cs-navi-tab">我要收退费</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-3f5b79af10418c028da1ca0896f499ca" src="school-accept-refund-money-log.html" class="cs-navi-tab">收退费流水</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-6d5d0c1d773f59f4d2cd4b91eb63861e" src="school-fee-account.html" class="cs-navi-tab">APP收费账户管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-184d0097a36484dffaba1f102419c107" src="school-fee-account-log.html" class="cs-navi-tab">APP收费账户流水</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-94a4507d10f12b1c3ed07cac4fd7e3be" src="student-account.html" class="cs-navi-tab">学生账户管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-ca42e81c763e3dae865522fa01244c65" src="student-account-log.html" class="cs-navi-tab">学生账户流水</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-c552cb7be446b96b4138f827d865cd3c" src="collect-fee-count.html" class="cs-navi-tab">收费统计报表</a></p>
                            </div></shiro:hasPermission> --%>
                         
                         
                         	
                            <shiro:hasPermission name="page_check"><div title="考勤管理" >
                                            <shiro:hasPermission name="page_check_student-vacation"><p><a href="javascript:void(0);" id="navi-tab-b3d01894ec295a3095184c0fb94aad5e" src="${pageContext.request.contextPath}/page_check_student-vacation.action" class="cs-navi-tab">学生请假管理</a></p></shiro:hasPermission>
                                            <%-- <p><a href="javascript:void(0);" id="navi-tab-7d1de6fd19123381afb73b5b3980b5cc" src="${pageContext.request.contextPath}/page_check_sms-log.action" class="cs-navi-tab">学生考勤短信记录</a></p> --%>
                                            <shiro:hasPermission name="page_check_student-day"><p><a href="javascript:void(0);" id="navi-tab-1e0e1e70447940e92a3eaa16b7a3c5d0" src="${pageContext.request.contextPath}/page_check_student-day.action" class="cs-navi-tab">学生日考勤记录</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_check_student-month"><p><a href="javascript:void(0);" id="navi-tab-c442605b318e97f10b4c051df6d2d95d" src="${pageContext.request.contextPath}/page_check_student-month.action" class="cs-navi-tab">学生月考勤统计</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_check_teacher-vacation"><p><a href="javascript:void(0);" id="navi-tab-9a25b19cbf6ea673bc8c2ba444c879eb" src="${pageContext.request.contextPath}/page_check_teacher-vacation.action" class="cs-navi-tab">教职工请假管理</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_check_teacher-day"><p><a href="javascript:void(0);" id="navi-tab-2cc7dd276452bdd5cdea8f6d84a60553" src="${pageContext.request.contextPath}/page_check_teacher-day.action" class="cs-navi-tab">教职工日考勤记录</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_check_teacher-month"><p><a href="javascript:void(0);" id="navi-tab-1e73357dc0bdc4cd529bdba745935bff" src="${pageContext.request.contextPath}/page_check_teacher-month.action" class="cs-navi-tab">教职工月考勤统计</a></p></shiro:hasPermission>
                                    </div></shiro:hasPermission>
                            <shiro:hasPermission name="page_askandnotice"><div title="公告问卷管理" >
                                            <shiro:hasPermission name="page_askandnotice_notice"><p><a href="javascript:void(0);" id="navi-tab-7568edd63dc79fc233ef4622a4b789b8" src="${pageContext.request.contextPath}/page_askandnotice_notice.action" class="cs-navi-tab">通知公告管理</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_askandnotice_ask"><p><a href="javascript:void(0);" id="navi-tab-73fad8c6532417f2964e5c6e92b3e0c1" src="${pageContext.request.contextPath}/page_askandnotice_ask.action" class="cs-navi-tab">问卷调查管理</a></p></shiro:hasPermission>
                                    </div></shiro:hasPermission>
                            <shiro:hasPermission name="page_homework"><div title="作业管理" >
                                            <shiro:hasPermission name="page_homework_homework"><p><a href="javascript:void(0);" id="navi-tab-0a2a0d2ef69643e0b7e034e6d90a157e" src="${pageContext.request.contextPath}/page_homework_homework.action" class="cs-navi-tab">作业查询</a></p></shiro:hasPermission>
                                            <%-- <shiro:hasPermission name="page_homework_homework-count"><p><a href="javascript:void(0);" id="navi-tab-bc8345bbdcb0509a8bc73815bd71def1" src="${pageContext.request.contextPath}/page_homework_homework-count.action" class="cs-navi-tab">作业统计</a></p></shiro:hasPermission> --%>
                                    </div></shiro:hasPermission>
                            <shiro:hasPermission name="page_cookbook"><div title="食谱管理" >
                                            <shiro:hasPermission name="page_cookbook_cookbook"><p><a href="javascript:void(0);" id="navi-tab-68c9e43d6ff76572a40097a112645910" src="${pageContext.request.contextPath}/page_cookbook_cookbook.action" class="cs-navi-tab">食谱查询</a></p></shiro:hasPermission>
                                            <%-- <shiro:hasPermission name="page_cookbook_cookbook-count"><p><a href="javascript:void(0);" id="navi-tab-6ddaa4735f4f5c80be24443262221722" src="${pageContext.request.contextPath}/page_cookbook_cookbook-count.action" class="cs-navi-tab">食谱数量统计</a></p></shiro:hasPermission> --%>
                                    </div></shiro:hasPermission>
                            <!-- <div title="会员服务管理" >
                                            <p><a href="javascript:void(0);" id="navi-tab-a09d540fc5245b0324e132f9a50702c3" src="/student-user-card/index.html" class="cs-navi-tab">学生考勤卡管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-f24fdd9bf1d090ee8107ce368ddfe654" src="/teacher-user-card.html" class="cs-navi-tab">教职工考勤卡管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-5844b2774f1f823dff869bb595ac755e" src="/video-vip.html" class="cs-navi-tab">视频会员管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-e52f7036de729929422946c1e13fd0a8" src="/video-vip-log.html" class="cs-navi-tab">视频会员订购记录</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-3af0360565134818df6dee320e08742e" src="/sms-vip.html" class="cs-navi-tab">短信会员管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-2cae728ba32fa1769165ed6629520b26" src="/sms-vip-log.html" class="cs-navi-tab">短信会员订购记录</a></p>
                                    </div>
                            <div title="账户和订购管理" >
                                            <p><a href="javascript:void(0);" id="navi-tab-4f51540d2e16a87044b54ef6e2219c07" src="/bloc-account.html" class="cs-navi-tab">注册资料管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-3fb5381a8fb902d15aa4b572dc4f57d4" src="/bloc-alipay-log.html" class="cs-navi-tab">账户在线充值管理</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-c8710928d097a896f01c0a097421a348" src="/bloc-account-log.html" class="cs-navi-tab">账户出入账记录</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-cc3b98f45cbb7ac0770b483c53b546c6" src="/bloc-order.html" class="cs-navi-tab">云平台订购</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-d30b07696ba3ca8ff6acbe8925b1d65f" src="/user-card-order.html" class="cs-navi-tab">考勤卡订购</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-2161b4ed01f61d5907cca395b200fa2e" src="/sms-order.html" class="cs-navi-tab">短信数量订购</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-80eba441e1b86ee3cf6ac9dcb0d50438" src="/videovip-order.html" class="cs-navi-tab">视频会员时长订购</a></p>
                                            <p><a href="javascript:void(0);" id="navi-tab-d7c12ab12447bbe967f8e2b06f087616" src="/smsvip-order.html" class="cs-navi-tab">短信会员时长订购</a></p>
                                    </div> -->
                            <shiro:hasPermission name="page_parameter"><div title="基础参数设置" style="border-bottom:0px;padding-bottom:28px;">                            
                                            <shiro:hasPermission name="page_parameter_school"><p><a href="javascript:void(0);" id="navi-tab-5b05ca141709947744fa61286438eb65" src="${pageContext.request.contextPath}/page_parameter_school.action" class="cs-navi-tab">学校设置</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_parameter_grade"><p><a href="javascript:void(0);" id="navi-tab-72ae82c2642de6fb6d39c52738655c1a" src="${pageContext.request.contextPath}/page_parameter_grade.action" class="cs-navi-tab">年级设置</a></p></shiro:hasPermission>
                                            <%-- <shiro:hasPermission name="page_parameter_custom-field"><p><a href="javascript:void(0);" id="navi-tab-e8426a461a3ba8c14e51b492354a9fe1" src="${pageContext.request.contextPath}/page_parameter_custom-field.action" class="cs-navi-tab">用户资料项设置</a></p></shiro:hasPermission> --%>
                                          
                                            <shiro:hasPermission name="page_parameter_class-type"><p><a href="javascript:void(0);" id="navi-tab-1194717cb7652904c98baf30cc80ec32" src="${pageContext.request.contextPath}/page_parameter_class-type.action" class="cs-navi-tab">班级类型设置</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_parameter_schedule-template"><p><a href="javascript:void(0);" id="navi-tab-7564e694dfc7b47d949f6fedb6c34be7" src="${pageContext.request.contextPath}/page_parameter_schedule-template.action" class="cs-navi-tab">课程表设置</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_parameter_subject"><p><a href="javascript:void(0);" id="navi-tab-aba00876889a5f22d2c5445bd198ee0b" src="${pageContext.request.contextPath}/page_parameter_subject.action" class="cs-navi-tab">教学科目设置</a></p></shiro:hasPermission>
                                           
                                            <shiro:hasPermission name="page_parameter_teacher-duty"><p><a href="javascript:void(0);" id="navi-tab-2ae847b0d6bface78f6c153b0a689d72" src="${pageContext.request.contextPath}/page_parameter_teacher-duty.action" class="cs-navi-tab">教职工职务设置</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_parameter_structure"><p><a href="javascript:void(0);" id="navi-tab-6634d62366eb16ac570c0b82a0e04906" src="${pageContext.request.contextPath}/page_parameter_structure.action" class="cs-navi-tab">组织机构设置</a></p></shiro:hasPermission>
                                            <shiro:hasPermission name="page_parameter_clock-config"><p><a href="javascript:void(0);" id="navi-tab-a5b37588b85556af9b258080ac4c7655" src="${pageContext.request.contextPath}/page_parameter_clock-config.action" class="cs-navi-tab">考勤参数设置</a></p></shiro:hasPermission>
                                           
                                            <%-- <shiro:hasPermission name="page_student_student"><p><a href="javascript:void(0);" id="navi-tab-12e415c2358054269b7a7411eb690679" src="${pageContext.request.contextPath}/page_parameter_vip-config.action" class="cs-navi-tab">会员参数设置</a></p></shiro:hasPermission> --%>
                                            <shiro:hasPermission name="page_parameter_role"><p><a href="javascript:void(0);" id="navi-tab-07a0e940e0f9cd71f3c0dd8d80ea16cb" src="${pageContext.request.contextPath}/page_parameter_role.action" class="cs-navi-tab">角色权限设置</a></p></shiro:hasPermission>
                            	  </div></shiro:hasPermission>                                                                                             
                            
                            
                            
                            
                            
						
                                    <span style="position:fixed;left:10px;bottom:11px; width:118px; color:#6799DC;padding-left:16px; padding-top:6px; padding-bottom:6px;background-color:#ffffff;">&copy;软件工程教研室</span>
   
        </div>

    </div>

    <div id="mainPanle" region="center" border="false">
         <div id="tabs" class="easyui-tabs"  fit="true" border="false" tabHeight="32">
                <div title="首页">
					<div class="cs-home-remark">
												
						<div style="width:330px;float:left; margin-left:12px; margin-top:8px;">
							
							<div style="margin-top:18px; width:300px; border-bottom:1px solid #cccccc; font-size:14px; font-weight:bold; font-family:'微软雅黑'; padding:8px; padding-left:0px; color:#666666;">功能演示</div>
							
							<div style="padding:8px; line-height:28px;font-size:13px;">
							
								<shiro:hasPermission name="page_student"><li><a onClick="showMenuHelp('studentMangerMenuDatas');" href="#">学生管理</a></li></shiro:hasPermission>
								<shiro:hasPermission name="page_teacher"><li><a onClick="showMenuHelp('teacherMangerMenuDatas');" href="#">教职工管理</a></li></shiro:hasPermission>
								<shiro:hasPermission name="page_class"><li><a onClick="showMenuHelp('classMangerMenuDatas');" href="#">班级管理</a></li></shiro:hasPermission>
								<shiro:hasPermission name="page_kebiao"><li><a onClick="showMenuHelp('classtableMangerMenuDatas');" href="#">课程表管理</a></li></shiro:hasPermission>
								<%-- <shiro:hasPermission name="page_money"><li><a onClick="showMenuHelp('feeMangerMenuDatas');" href="#">收费管理</a></li></shiro:hasPermission> --%>
								<shiro:hasPermission name="page_check"><li><a onClick="showMenuHelp('clockMangerMenuDatas');" href="#">考勤管理</a></li></shiro:hasPermission>
								<shiro:hasPermission name="page_askandnotice"><li><a onClick="showMenuHelp('noticeMangerMenuDatas');" href="#">公告问卷管理</a></li></shiro:hasPermission>
								<shiro:hasPermission name="page_homework"><li><a onClick="showMenuHelp('homeworkMangerMenuDatas');" href="#">作业管理</a></li></shiro:hasPermission>
								<shiro:hasPermission name="page_cookbook"><li><a onClick="showMenuHelp('cookbookMangerMenuDatas');" href="#">食谱管理</a></li></shiro:hasPermission>
								<!-- <li><a onClick="showMenuHelp('vipMangerMenuDatas');" href="#">会员服务管理</a></li>
								<li><a onClick="showMenuHelp('orderMangerMenuDatas');" href="#">账户和订购管理</a></li> -->
								<shiro:hasPermission name="page_parameter"><li><a onClick="showMenuHelp('configMangerMenuDatas');" href="#">基础参数设置</a></li></shiro:hasPermission>
							</div>
						</div>
						
						
                </div>
        </div>
    </div>

    <div region="east" border="false" style="width:8px; background-color:#ffffff; background-image:url(images/main_east_layout_bg.gif);background-repeat:repeat-x;"></div>
    <div region="south" border="false" style="height:8px;"></div>


</div>

    <div id="mm" class="easyui-menu cs-tab-menu">
        <div id="mm-tabupdate">刷新</div>
        <div class="menu-sep"></div>
        <div id="mm-tabclose">关闭</div>
        <div id="mm-tabcloseother">关闭其他</div>
        <div id="mm-tabcloseall">关闭全部</div>
    </div>
	<!--用于弹出窗口-->
<div id="openWindow"></div>
<div id="openDialog" style="overflow: hidden;"></div>
<div id="noviceGuide" style="display:none; z-index: 90000;position:absolute; top:0px;left:0px; background: #ccc; opacity: 0.8;">
</div>
<script type="text/javascript">

if (window!=top) // 判断当前的window对象是否是top对象
top.location.href =window.location.href; // 如果不是，将top对象的网址自动导向被嵌入网页的网址
</script>


</body>
</html>