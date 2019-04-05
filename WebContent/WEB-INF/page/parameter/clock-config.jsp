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
		font-weight:bold;
		margin-top:22px;
		margin-bottom:8px;
		color:#333333;
	}
</style>
<body style="padding:0px;margin:0px;">
<div class="easyui-layout" fit="true" border="true">
    <div border="true" style="overflow:auto; padding:18px;width:760px; height:100%;">
        <div class="school_id_box" style="display:none" >
            <input id="school_id" name="school_id" value="" type="hidden" class="easyui-validatebox" data-options="novalidate:true">
        </div>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onClick="editClockConfig()" style="color:blue;">设置该校考勤参数</a>
        <div>
         <p>每月学生应出勤天数：</p>
            <table id="monthTable" class="gridtable">
                <tr>
                    <td bgcolor="#EBEBEB">月份</td>
                    <td bgcolor="#EBEBEB">1月</td>
                    <td bgcolor="#EBEBEB">2月</td>
                    <td bgcolor="#EBEBEB">3月</td>
                    <td bgcolor="#EBEBEB">4月</td>
                    <td bgcolor="#EBEBEB">5月</td>
                    <td bgcolor="#EBEBEB">6月</td>
                    <td bgcolor="#EBEBEB">7月</td>
                    <td bgcolor="#EBEBEB">8月</td>
                    <td bgcolor="#EBEBEB">9月</td>
                    <td bgcolor="#EBEBEB">10月</td>
                    <td bgcolor="#EBEBEB">11月</td>
                    <td bgcolor="#EBEBEB">12月</td>
                </tr>
                <tr>
                    <td>当月应出勤天数</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
          </table>
        </div>
        <div>
            <p>教职工考勤设置：</p>
            <table id="teacherTable" class="gridtable">
                <tr>
                    <td width="150" align="center" bgcolor="#EBEBEB">上班时间</td>
                    <td width="150" align="center" bgcolor="#EBEBEB">下班时间</td>
					<td align="center" bgcolor="#EBEBEB">考勤方式</td>
                </tr>
                <tr>
                    <td align="center"></td>
                    <td align="center"></td>
					<td align="center"></td>
                </tr>
          </table>
        </div>
        <div>
            <p>学生考勤设置：<font color="blue">(短信数量请在 “账户和订购管理 > 短信数量订购” 中购买)</font></p>
            <table id="studentTable" class="gridtable">
                <tr>
                    <td width="80" align="center" bgcolor="#EBEBEB">上学时间</td>
                    <td width="80" align="center" bgcolor="#EBEBEB">放学时间</td>
					<td width="150" align="center" bgcolor="#EBEBEB">考勤方式</td>
                    <td align="center" bgcolor="#EBEBEB">短信通知</td>
                    <td align="center" bgcolor="#EBEBEB">微信通知</td>
                </tr>
                <tr>
                    <td align="center"></td>
                    <td align="center"></td>
					<td align="center"></td>
                    <td align="center"></td>
                    <td align="center"></td>
                </tr>
          </table>
        </div>
        <div>
            <p>设置每周休息日：</p>
            <table id="weekTable" class="gridtable">
                <tr>
                    <td bgcolor="#EBEBEB">星期一</td>
                    <td bgcolor="#EBEBEB">星期二</td>
                    <td bgcolor="#EBEBEB">星期三</td>
                    <td bgcolor="#EBEBEB">星期四</td>
                    <td bgcolor="#EBEBEB">星期五</td>
                    <td bgcolor="#EBEBEB">星期六</td>
                    <td bgcolor="#EBEBEB">星期日</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
          </table>
        </div>
        <div style=" padding-bottom:28px;">
            <p>设置考勤机信息：
                            </p>
            <table id="clockTable" class="gridtable">
            </table>
        </div>
        <div id="show-error-message-box" style="color: red"></div>
    </div>
</div>
</body>
            
<script type="text/javascript">
     /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","detail_url":"\/clock-config\/index-list-json.html?school_id=1&sinKey=7dfd%25B1%25FDJ%25DFm%2505%258Etf%2514R%2509%2525%25B6%253A%25AC%2500%250C%25B0%25CCt%250D%25D5%255E%2505%25C6%2505%253D%2501%25DA%25CE%25AEr%255DaR%25AD%25B5%25B6%2508","edit_url":"\/clock-config\/edit.html?school_id=1&sinKey=3056%2507O-%25DAQ%25F6%25D9i%2517p%2515%251D%255B%25F3%2522%25D0U%25CAae%251A%25B8%25BA%258E%2521%25FE%2525%25C5%253A%25AB%25D9%2505O%250F%251F_%25C72%257F%25FB","add_url":"\/clock-config\/add-clock.html?school_id=1&sinKey=42ab%2510%2560a%25AE8%2525%259D%25DE%2511n3%2582%25BF%25B1%250C%25F4%2505%25CCN%25E8%2507%250C%2510n%2506%2597%25E9%258D%255EK%25F6%25F8%2528%250C%25BCR%2599%259B%25C7%2511"},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","detail_url":"\/clock-config\/index-list-json.html?school_id=2&sinKey=a9c9%255C%2594%259B%257BN%2500%25C1%25BA%2591%259D%25ACa%259D%252F%25ED%2514%258A%25B2%25CA%253C%25F3%2586X%25DB%25905%257C%255C%259E%25EE2%25A4%25BC%259FB%257BM%2588r%252B","edit_url":"\/clock-config\/edit.html?school_id=2&sinKey=5910%25D4%25B2%255EI%2527%25B9%253B%25F9%25E9%25131%251A%25C5%253A%25C2%25D8%25AAi%25E2%2540%257D%25F4%25F8%250D%259F%25B1%25EA5W%2583%25A5%25DA1%253A8SA%259B%2503%25CD","add_url":"\/clock-config\/add-clock.html?school_id=2&sinKey=c3e7%25BBX%2586hf%258Ek%25E8%25B6%25C9%252C%25BA%2591%2521HPw%2582%2527P%259B%2591%258B%25A2%258F%259B%25B8%2513%2500%2592V%2593%2590V%25BD%25B8%25A0V%25C7%259E"},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","detail_url":"\/clock-config\/index-list-json.html?school_id=8&sinKey=a928m%25D4%2518N%258E%25EB%251A%25F8%2587t%255E%25A1%25C3c%25F0X88B%250A%25C7%25FFz%259Db%25B0%250AP%2589%251A%25D2%25FC%255Cd%2584%25A4%25F5%257FM%2593","edit_url":"\/clock-config\/edit.html?school_id=8&sinKey=eee9%251Fh%251B%2503%25C9%25B7%25BB%2501ct%2560%25D0%25E0%2513%2527%258B%259C%259B%2511%25A73%253B%25A1%250Cd%25CC%252C%2593%2584%257D%2585R%25A0%25D4%25EE%25F1%25B5%2527K%25B1","add_url":"\/clock-config\/add-clock.html?school_id=8&sinKey=474e59%2594%25C8%25A0B%257C%25FC%25B3k%25CB%25C9%258E%25CE%250C%259E%2524D%259F%25A2%25E82v%25EC%25F3%25FDW%253B%259C%2520%253E%251B%257F%25EF%25F1X%252Bw%259E%25E8"}]';
    schoolJson = eval('('+schoolJson+')');

    /* 编辑配置信息 */
    
    function editClockConfig() {
        /* 获取当前选择的学校Id */
        var schoolId = $('#school_id').combobox('getValue');
		var url = '${pageContext.request.contextPath}/clockConfigAction_edit.action';
        for (var i = 0; i < schoolJson.length; i ++) {
            if (schoolJson[i].id == schoolId) {
                openTopWindow(url, '编辑考勤配置信息', 660, 570, 'getClockConfig');
                break;
            }
        }

        return false;
    }


     /**
      * 添加考勤机
      */
     function addClockMachine(){
         /* 获取当前选择的学校Id */
         var schoolId = $('#school_id').combobox('getValue');

         for (var i = 0; i < schoolJson.length; i ++) {
             if (schoolJson[i].id == schoolId) {
                 openTopWindow(schoolJson[i].add_url, '添加考勤机信息', 420, 420, 'getClockConfig');
                 break;
             }
         }

         return false;
     }

     /**
      * 编辑考勤机
      * @param url
      */
     function editClockMachine(){
    	 var url = '${pageContext.request.contextPath}/clockConfigAction_editClockConfig.action';
         openTopWindow(url, '编辑考勤机信息', 420, 420, 'getClockConfig');
     }

     /**
      * 删除考勤机
      * @param url
      */
     function delClockMachine(url){
         $.messager.confirm('提示', '确认删除吗？，此操作不可撤销！', function(r){
             if(r){
                 $.ajax({
                     url: url,
                     dataType: 'JSON',
                     success:function(data){
                         if(data.status == 1){
                             getClockConfig();
                         }else{
                             $.messager.alert('提示',data.info, 'error');
                         }
                     }
                 })
             }
         });
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
            url:'${pageContext.request.contextPath}/clockConfigAction_query.action',
            dataType: 'json',
            success: function(result) {
                if (result.errMeg == '') {
                    result = result.result;

                    /* 每周休息日信心 */
                    $('#weekTable').find('tr:eq(1)').find('td:eq(0)').html(result.clock_day1);
                    $('#weekTable').find('tr:eq(1)').find('td:eq(1)').html(result.clock_day2);
                    $('#weekTable').find('tr:eq(1)').find('td:eq(2)').html(result.clock_day3);
                    $('#weekTable').find('tr:eq(1)').find('td:eq(3)').html(result.clock_day4);
                    $('#weekTable').find('tr:eq(1)').find('td:eq(4)').html(result.clock_day5);
                    $('#weekTable').find('tr:eq(1)').find('td:eq(5)').html(result.clock_day6);
                    $('#weekTable').find('tr:eq(1)').find('td:eq(6)').html(result.clock_day7);

                    /* 学生上下学时间 */
                    $('#studentTable').find('tr:eq(1)').find('td:eq(0)').text(result.student_arrive_time);
                    $('#studentTable').find('tr:eq(1)').find('td:eq(1)').text(result.student_leave_time);

                    /* 老师上下班时间 */
                    $('#teacherTable').find('tr:eq(1)').find('td:eq(0)').text(result.teacher_arrive_time);
                    $('#teacherTable').find('tr:eq(1)').find('td:eq(1)').text(result.teacher_leave_time);

                    /* 每月考勤日期 */
                    $('#monthTable').find('tr:eq(1)').find('td:eq(1)').text(result.clock_month1 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(2)').text(result.clock_month2 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(3)').text(result.clock_month3 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(4)').text(result.clock_month4 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(5)').text(result.clock_month5  + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(6)').text(result.clock_month6 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(7)').text(result.clock_month7 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(8)').text(result.clock_month8 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(9)').text(result.clock_month9 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(10)').text(result.clock_month10 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(11)').text(result.clock_month11 + '天');
                    $('#monthTable').find('tr:eq(1)').find('td:eq(12)').text(result.clock_month12 + '天');

                    //考勤方式
                    $('#teacherTable').find('tr:eq(1)').find('td:eq(2)').text(result.teacherClockType);
                    $('#studentTable').find('tr:eq(1)').find('td:eq(2)').text(result.studentClockType);

                    //短信通知
                    $('#studentTable').find('tr:eq(1)').find('td:eq(3)').text(result.studentSmsType? '是，学生考勤刷卡时通知家长': '否，不通知家长');

                    //微信通知
                    $('#studentTable').find('tr:eq(1)').find('td:eq(4)').text(result.studentWxType? '是，学生考勤刷卡时通知家长': '否，不通知家长');

                    //考勤机
                    var schoolClockMachineTitle = '<tr>' +
                        //'<td bgcolor="#EBEBEB">编号</td>' +
                        '<td bgcolor="#EBEBEB">序列号</td>' +
                        //'<td bgcolor="#EBEBEB">登陆密码</td>' +
                        '<td bgcolor="#EBEBEB">摆放位置</td>' +
                        '<td bgcolor="#EBEBEB">校车考勤机</td>' +
                        '<td bgcolor="#EBEBEB">状态</td>' +
                        '<td bgcolor="#EBEBEB">操作</td>' +
                        '</tr>';
                    var schoolClockMachineHtml = '';
                    if(result.schoolClockMachineList){
                        for(var i=0; i<result.schoolClockMachineList.length; i++){
                            schoolClockMachineHtml += '<tr class="schoolClockMachineTr">';
                            //schoolClockMachineHtml += '<td>'+result.schoolClockMachineList[i].id+'</td>';
                            schoolClockMachineHtml += '<td>'+result.schoolClockMachineList[i].username+'</td>';
                            //schoolClockMachineHtml += '<td>'+result.schoolClockMachineList[i].password+'</td>';
                            schoolClockMachineHtml += '<td>'+result.schoolClockMachineList[i].position+'</td>';
                            schoolClockMachineHtml += '<td>'+(result.schoolClockMachineList[i].is_bus_clock==1? '是': '不是')+'</td>';
                            schoolClockMachineHtml += '<td>'+(result.schoolClockMachineList[i].status==1? '<font color=green>正常</font>': '<font color=red>禁用</font>')+'</td>';

                            schoolClockMachineHtml += '<td>';
                                                        schoolClockMachineHtml += '<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editClockMachine()">编辑</a>';
                            //schoolClockMachineHtml += '<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="delClockMachine('+"'"+result.schoolClockMachineList[i].delUrl+"'"+')">删除</a>';
                                                        schoolClockMachineHtml += '</td>';

                            schoolClockMachineHtml += '</tr>';
                        }
                    }
                    if(schoolClockMachineHtml == ''){
                        schoolClockMachineHtml += '<tr class="schoolClockMachineTr">';
                        schoolClockMachineHtml += '<td colspan="7"><div style="color:red; text-align: center">暂无考勤机</div></td>';
                        schoolClockMachineHtml += '</tr>';
                    }
                    if($('.schoolClockMachineTr').length > 0){
                        $('.schoolClockMachineTr').remove();
                    }
                    $("#clockTable").html(schoolClockMachineTitle+schoolClockMachineHtml);
                    $.parser.parse('#clockTable');
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