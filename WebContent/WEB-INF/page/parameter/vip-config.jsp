<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Dear宝贝-幼教云管理平台</title>
    <link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/icon.css">

    <script type="text/javascript" src="js/easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/easyui-1.4.4/jquery.easyui.min.js"></script>    
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    
    <link rel="stylesheet" href="js/pagewalkthrough/css/jquery.pagewalkthrough.css">
    <script type="text/javascript" src="js/pagewalkthrough/jquery.pagewalkthrough.right.min.js"></script>
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>

<style type="text/css">
    table.gridtable {
        font-family: verdana,arial,sans-serif;
        font-size:11px;
        color:#333333;
        border-width: 1px;
        border-color: #cccccc;
        border-collapse: collapse;
		width:718px;
    }
    table.gridtable th {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #cccccc;
        background-color: #cccccc;
    }
    table.gridtable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #cccccc;
    }
	.easyui-layout p{
		font-family:"微软雅黑";
		font-size:12px;
		margin-top:22px;
		margin-bottom:8px;
		color:#333333;
	}
</style>
<body style="padding:0px;margin:0px; ">
<div class="easyui-layout" fit="true" border="true">
    <div border="true" style="overflow:auto; padding:18px;width:760px; height:100%;">
        <div>
            <input id="school_id" name="school_id" value="" class="easyui-validatebox" data-options="novalidate:true">
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onClick="editClockConfig()" style="color:blue;">设置该校会员参数</a>
        </div>

        <div>
            <p style="font-weight:bold; font-size:13px;">视频会员相关参数</p>
            <div style="border:1px solid #ddd; padding:15px; padding-top:0px;">
                <p>对家长开放的日期：
                    <input class="opentime_day" type="checkbox"> 周一 &nbsp;
                    <input class="opentime_day" type="checkbox"> 周二 &nbsp;
                    <input class="opentime_day" type="checkbox"> 周三 &nbsp;
                    <input class="opentime_day" type="checkbox"> 周四 &nbsp;
                    <input class="opentime_day" type="checkbox"> 周五 &nbsp;
                    <input class="opentime_day" type="checkbox"> 周六 &nbsp;
                    <input class="opentime_day" type="checkbox"> 周日 &nbsp;
                </p>

                <p>对家长开放的时段：&nbsp;<span id="opentime_box"></span></p>

                <p>家长可通过APP端订购视频会员：
                    <input class="vip_allow_apporder" name="vip_allow_apporder" type="radio"> 允许
                    <input class="vip_allow_apporder" name="vip_allow_apporder" type="radio"> 禁止
                </p>

                <p>视频会员价格：<span id="vip_price_box"></span></p>
            </div>

            <p style="font-weight:bold; font-size:13px;">短信会员相关参数</p>
            <div style="border:1px solid #ddd; padding:15px; padding-top:0px;">
                <p>家长可通过APP订购短信会员：
                    <input class="sms_allow_apporder"  name="sms_allow_apporder" type="radio"> 允许
                    <input class="sms_allow_apporder"  name="sms_allow_apporder" type="radio"> 禁止
                </p>

                <p>短信会员价格：<span id="sms_price_box"></span></p>
            </div>
        </div>

        <div id="show-error-message-box" style="color: red"></div>
    </div>
</div>
</body>
<script type="text/javascript">
     /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","detail_url":"\/vip-config\/index-list-json.html?school_id=1&sinKey=883f%25FE-e%250F%251Cs%25B3U%2587%2599%2509s%25BE%25D6%2525%251E%253Eh%253F%2589%258A%25C7%255B%25EB%25DDV%25F7A%2581d%255D%25C8-%25F0%2504L%25DF%25AE","edit_url":"\/vip-config\/edit.html?school_id=1&sinKey=9ea9f%2596%2515%25C4HIi%25A5%25B4I%25CB%259A%251B%2527%25F6%250D%2501%2519%25E8%259D%258E%25AF%2584%25F9%25601%258Be%2512u%2517%2540%25B2%2526%2588%25AA%2503%25A4"},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","detail_url":"\/vip-config\/index-list-json.html?school_id=2&sinKey=470bY%2503%2585S_94%2585%25E1%25BC%25FD%25FFd%25A95%2582%2588%25F9%2594%2587%255B%2505%250DGWQ%25EC%25DE1%25BF%25C5%25E8%25BFp%25FA7N%259B","edit_url":"\/vip-config\/edit.html?school_id=2&sinKey=b4b2%25A2%25D2L%25E0%25C7%25E4%2513k%259Dy2%25E0%25F1%255C%253C%25B7%250D%25D54%252A%25F8%25BC%2516%25B4%25F6BsOfjvp7MUBfa"},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","detail_url":"\/vip-config\/index-list-json.html?school_id=8&sinKey=a5e3%25E7%2583%251A%25A2%25DE%2581kM%25D0%25F7%25AD%258D%25DA%25E9%258C%25AErd%25A1U%2512%25E6XV%2529J%25BB%2511%2523%2584%2587-%2506%25CAQ%253A%25B3%25AE","edit_url":"\/vip-config\/edit.html?school_id=8&sinKey=0d26%2592%2525%25A7OQK%25BA%259A%25FE%25F6%25FC%2560%25EB%25BE%251C%25B9%259AZ%250B%2593%259E%258D%258E%25C1i%258E%25E1%25D8%25A0%2505I%25072%255C%2583M%259D7"}]';
    schoolJson = eval('('+schoolJson+')');

    /* 编辑配置信息 */
    function editClockConfig() {
        /* 获取当前选择的学校Id */
        var schoolId = $('#school_id').combobox('getValue');

        for (var i = 0; i < schoolJson.length; i ++) {
            if (schoolJson[i].id == schoolId) {
                openTopWindow(schoolJson[i].edit_url, '设置会员参数', 660, 370, 'getClockConfig');
                break;
            }
        }

        return false;
    }

    /* 异步获取配置 */
    function getClockConfig(url) {
        $('#show-error-message-box').html('');
        
        /* 获取当前选择的学校Id */
        var schoolId = $('#school_id').combobox('getValue');
        url = '';
        for (var i = 0; i < schoolJson.length; i ++) {
            if (schoolJson[i].id == schoolId) {
                url = schoolJson[i].detail_url;
                break;
            }
        }

        $.ajax({
            type: 'POST',
            url: url,
            dataType: 'json',
            success: function(result) {
                if (result.errMeg == '') {
                    result = result.result;

                    /* 对家长开放日期 */
                    for(var i=0; i<7; i++){
                        if(result['opentimeDay'+(i+1)] == 1){
                            $(".opentime_day").eq(i).prop('checked', true);
                        }else{
                            $(".opentime_day").eq(i).prop('checked', false);
                        }
                    }
                    /* 视频对家长开放的时段 */
                    $("#opentime_box").html(result['opentimeVip']? result['opentimeVip']: '未开放');
                    /* 家长可通过APP端订购视频会员 */
                    if(result['vip_allow_apporder'] == 1){
                        $(".vip_allow_apporder").eq(0).prop('checked', true);
                    }else{
                        $(".vip_allow_apporder").eq(1).prop('checked', true);
                    }
                    /* 视频会员价格 */
                    $("#vip_price_box").html(result['vipPrice']);

                    /* 家长可通过APP订购短信会员 */
                    if(result['sms_allow_apporder'] == 1){
                        $(".sms_allow_apporder").eq(0).prop('checked', true);
                    }else{
                        $(".sms_allow_apporder").eq(1).prop('checked', true);
                    }
                    /* 短信会员价格 */
                    $("#sms_price_box").html(result['smsPrice']);
                } else {
                    $('#show-error-message-box').html(result.errMeg);
                }
            }
        });
    }

    $(function () {
        /* 学校 */
        $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            value: '',
            onLoadSuccess:function(){
                var data = $('#school_id').combobox('getData');
                if (data.length > 0) {
                    $('#school_id').combobox('select', data[0].id);
                }
            },
            onSelect: function(record) {
                getClockConfig(record.detail_url);
            }
        });

        $(document).on('click', '.vip_allow_apporder', function(){
            return false;
        })
        $(document).on('click', '.sms_allow_apporder', function(){
            return false;
        })
        $(document).on('click', '.opentime_day', function(){
            return false;
        })
    });

</script>
<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
</script>
</body>
<script type="text/javascript">
    var helpTutorials = [];

    function showRightHelp() {
        // Set up tour

        var pagewalkthrough = [];
        var tempData = null;

        for (i = 0; i < helpTutorials.length; i++) {
            /* 判断元素是否存在 */
            if ($(helpTutorials[i].wrapper).length > 0) {
                tempData =  {wrapper: helpTutorials[i].wrapper ,popup: {content: '#' + helpTutorials[i].contentWrapper,type: 'tooltip',position: helpTutorials[i].postion}};
                pagewalkthrough.push(tempData);
            }
        }

        $('body').pagewalkthrough({
            name: 'introduction',
            steps: pagewalkthrough
        });

        // Show the tour
        $('body').pagewalkthrough('show');
    }
</script>
</html>