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
    ul{
        margin: 0px;
        padding: 0px;
        margin-top:18px; 
    }
    li{
        margin: 0px;
        padding: 0px;
    }   
    .sortable li{
        list-style: none;
        border-top: 1px dashed #aaaaaa;
        border-bottom: 0px dashed #aaaaaa;
        margin-top:0px;
        cursor: pointer; 
    }
    .sortable li{ font-size:12px; height: 26px; line-height: 26px; padding: 0 0 0 8px;}
    .sortable li:hover{ background: #ddd;        border-top: 1px solid #aaaaaa;}
</style>
<script src="/dear_assets/js/jquery-ui.min.js"></script>



<form id="ff" method="post" style="height:498px; " data-href="" class="panel-noscroll">

    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 268px; height: 498px;">

        <div class="panel layout-panel layout-panel-north" style="width: 268px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 250px; height: 410px;" title="" class="panel-body panel-body-noheader layout-body">


        <div class="fitem">
            
            <input id="school_order" value="" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" data-options="panelHeight:'auto'" style="display: none;"><span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="" value="1" type="hidden"></span>
        </div>

        <div class="fitem" id="dd">
            <ul class="sortable ui-sortable" id="sortable"><li class="" id="7">美术</li><li class="" id="6">科学</li><li class="" id="5">社会</li><li class="" id="4">健康</li><li class="" id="3">语言</li><li class="" id="2">计算</li><li class="" id="1">音乐</li></ul>
        </div>

            <div id="error_info" style="color: red;"></div>
    </div></div>


    <div class="panel layout-panel layout-panel-center" style="width: 268px; left: 0px; top: 427px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 268px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
       <div style="padding-top:12px; width:148px; float:left;">按住鼠标拖动即可重新排序</div> <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
            <input id="order_ids" value="7,6,5,4,3,2,1" type="hidden">
            <div style="display: none;" id="sinKey">b6bc%035%8B%1F%8D%F0%2B%3Bh%2F%1B%2AE%86%AE%87l%F1%F9cs%1E%40%9F%8A%9B%23%9F%FF%F0%3CG%10%40%2By%AFe%15%10W%97R,da36%5B%89O%B7%92h%AB%E0lA%D5J%29%ED%FFA%0DG%02%22%21Y%A2%A5xgT%97%81%D6%90G%06%02%05%D8%A21%04Q%D0%D2%E2,93b13yT%0D%B1%8Ab%91%A4M%233%F4_%84%B9%C5%D4%DF%18%40%DCx%D6F%25QW%09%02%E0%9F%D1%A1S3.%3DW%3F%C4%FD%97,0a74%D6%A98%3C%EA%8BC2p%99.%F7%3Fv%28QE%24%A2%F8Ra%3C%B0%1E%5B%C5%A6%A3%B1%8F%5E%D8%F8%F5d%D4j%1D%84%09%8A%BB,9261%A3v%99%7DU%BD%1C%F9%03%0A%D5%BD%FE%8D%23%11%C4%F7I%F6w%7DV%07%99%C3%2Cjp%29%DA%FDh%29%98%EC%B9%27%1D%CC%AChK,443b%BA%87%90G%7F%15%83U%81%D0%F3%A4%C6%FB%09%2F1%5E%8A%CC%95%A6.%F9%D4%96%BA%2F%E7%8A0%FBti%CB%12e%3B%A9%9FA%1D%EE,495cC%3DL%07%9Da%BDN%9D%FD%E1~0E%DE%2A%B2%AFd%2A%C4%B8%EE%DD%90%FF%5E%BFCu%25e%BD%5D%AF.%F2%D7%89%23%894%FA</div>
            <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveOrder()" group="">保存</a>
            <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
       </div>
    </div></div>

 <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>



<script type="text/javascript">
    var schoolListJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]}]';
    schoolListJson = eval('('+schoolListJson+')');

    function sc_gr_list(school_id){
        if(!school_id) return false;
        $.ajax({
            url:'/subject/order-list-json.html',
            data:{school_id:school_id},
            type:'GET',
            dataType:'JSON',
            success:function(data){
                if(data){
                    i = data.length;
                    if(i>=1 && data[0]['id']) {
                        html = '';ids = '';sinKey ='';
                        for($i=0;$i<i;$i++){
                            html += '<li class=""  id="'+data[$i]['id']+'">'+data[$i]['name']+'</li>';
                            ids += ($i==0 ? '' : ',')+data[$i]['id'];
                            sinKey += ($i==0 ? '' : ',')+data[$i]['sinKey'];
                        }

                        $("#sinKey").html(sinKey);
                        $("#sortable").html(html);
                        $("#order_ids").val(ids);
                        return false
                    };
                }
                $("#sortable").html('<span class="span_text2">该学校尚未配置教学科目信息！</span>');
            }
        })
    }

    $(function() {
        $('#school_order').combobox({
            data: schoolListJson,
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                $('#school_order').combobox("setValue", '');
            },
            onSelect:function(record){
                sc_gr_list(record.id);
            }
        });


        $( ".sortable" ).sortable({
            cursor: "move",
            items :"li",                        //只是li可以拖动
            opacity: 0.6,                       //拖动时，透明度为0.6
            revert: true,                       //释放时，增加动画
            update : function(event, ui){       //更新排序之后
               //alert($(this).sortable("toArray"));
                $("#order_ids").val($(this).sortable("toArray"));
            }
        });

        //默认选择第一个学校
        if(schoolListJson.length >= 2){
            $('#school_order').combobox('setValue',schoolListJson[1]['id']).combobox('setText',schoolListJson[1]['name']);
            sc_gr_list(schoolListJson[1]['id']);
        }
    });

    function saveOrder(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

        if($("#order_ids").val()==''){
            return false;
        }
        $.ajax({
            url:'/subject/save-order.html',
            data:{order:$("#order_ids").val(),sinKeys:$("#sinKey").html()},
            type:'POST',
            dataType:'JSON',
            success:function(result){
                if(result.status == 1){
                    //window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                } else {
                    $('#save-btn').removeClass('mylinkbtn-load');
                    //window.parent.showMessage('提示信息', result.info);
                    $("#error_info").html(result.info);
                }
            }
        })
    }
</script>


<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
</script>

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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">全部学校</div><div id="_easyui_combobox_i1_1" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i1_2" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i1_3" class="combobox-item">司南学辅1</div></div></div></body></html>