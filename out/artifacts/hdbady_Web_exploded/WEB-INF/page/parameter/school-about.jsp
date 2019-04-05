<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Dear宝贝-幼教云管理平台</title>
    <link rel="stylesheet" type="text/css" href="/dear_assets/js/easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/dear_assets/js/easyui-1.4.4/themes/icon.css">

    <script type="text/javascript" src="/dear_assets/js/easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="/dear_assets/js/easyui-1.4.4/jquery.easyui.min.js"></script>
    
    <script type="text/javascript" src="/dear_assets/js/common.js?20170301"></script>
    <script type="text/javascript" src="/dear_assets/js/easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    
    <link rel="stylesheet" href="/dear_assets/js/pagewalkthrough/css/jquery.pagewalkthrough.css">
    <script type="text/javascript" src="/dear_assets/js/pagewalkthrough/jquery.pagewalkthrough.right.min.js"></script>
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>

<body style="padding:0px;margin:0px;">

    <div class="easyui-layout" fit="true" border="true">

        <div region="north" border="true" style="overflow:hidden; padding:0px;height:550px; margin:0px; ">
            <iframe src="http://home.dearbaobei.com/1" style="border: none" height="100%" width="100%"></iframe>
        </div>

        <div region="center" border="false" style="overflow:hidden;background-color:#E0ECFF; ">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" class="easyui-linkbutton panel-tool-close" iconCls="icon-no" onClick="javascript:parent.$('#openWindow').window('close');">关闭</a>
            </div>
        </div>

    </div>

</body>
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