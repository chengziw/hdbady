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

<link rel="stylesheet" type="text/css" href="css/default.css">

<div class="easyui-layout" fit="true">

    <div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden;">
        <!--工具按钮和筛选栏目开始-->
        <div class="easyui-layout" fit="true" border="false">
            <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:580px; padding-right:8px;" border="false">

		      <!-- 选择学校：<input id="school_id" value="" style="cursor:pointer;" class="easyui-combobox" data-options="panelHeight:'auto'"> -->
                          <a href="javascript:;" id="expandButton" class="easyui-linkbutton" iconCls="icon-remove">折叠</a>
               
            </div>
            <!--工具栏结束-->
        </div>
        <!--工具按钮和筛选栏目结束-->
    </div>

        <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
        <table id="tt" class="easyui-treegrid"
               data-options="url:'${pageContext.request.contextPath}/structureAction_findAll.action',fitColumns:true,fit:true,
              lines:true,animate:true,
              idField:'id',treeField:'name'">
            <thead>
            <tr>
                <th data-options="field:'name',width:400,editor:'textadd'">组织部门名称</th>
                <th data-options="field:'id',width:600,formatter:rowformater">操作</th>
            </tr>
            </thead>
        </table>
        <!--数据表结束-->

    </div>

</div>
<script type="text/javascript">
    var hasEditPermission = 'true';
    hasEditPermission = eval('('+hasEditPermission+')');

    var hasDeletePermission = 'true';
    hasDeletePermission = eval('('+hasDeletePermission+')');

    var schoolListJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]}]';
    schoolListJson = eval('('+schoolListJson+')');

    $.extend($.fn.datagrid.defaults.editors, {
        textadd: {
            init: function(container, options){
                var i_t = '';
                i_t += '<a onclick="saveStructure();" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">保存</span>' +
                    '<span class="l-btn-icon icon-save">&nbsp;</span></span>' +
                    '</a>';

                i_t += '<a onclick="cancelStructure();" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">取消</span>' +
                    '<span class="l-btn-icon icon-no">&nbsp;</span></span>' +
                    '</a>';

                i_t += '&nbsp;&nbsp;<span style="color:red" id="settextvalue"></span>';
                var input = $('<input type="text" maxlength="32" style="268px; margin: 0 0 0 18px;" class="datagrid-editable-input">'+i_t).appendTo(container);
                return input;
            },
            destroy: function(target){
                $(target).remove();
            },
            getValue: function(target){
                return $(target).val();
            },
           /*  setValue: function(target, value){
                $(target).val(value);
            }, */
            resize: function(target, width){
                //$(target)._outerWidth(width/2);
            }
        }
    });

    var editingId;
    //新增
    function addStructure(index){
        var t = $('#tt');
        
        $('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;

        //数据锁
        if (editingId != undefined){
            t.treegrid('select', editingId);
            return;
        }

        //打开节点
        t.treegrid('expand',index);
        /*获取所有ID*/
        var rows = t.treegrid('getChildren');
        editingId = rows.length+100000;
        var row = null;
        var _data = {"id":editingId,"name":"新增子类","parent_id":index,"add":editingId};

        var dData = t.treegrid('find',index);   //当前的数据组

        if(dData.children.length > 0){ //有子类 插入子类 前面
            t.treegrid('insert',{
                before:dData.children[0]['id'],
                data: _data
            })
        }else{  //没有子类插入 子类
            t.treegrid('append',{
                parent: index,  // 这里指定父级标识就可以了
                data: [_data]
            });
        }

        t.treegrid("beginEdit",_data.id);
    }
    //编辑
    function editStructure(index){
        var t = $('#tt');
        //数据锁
        if (editingId != undefined){
            t.treegrid('select', editingId);
            return;
        }
        editingId = index;
        t.treegrid("beginEdit",index);
    }

    //保存
    function saveStructure(){
  
        if (editingId != undefined){
            var t = $('#tt');
            
            /* $('#tt').datagrid('selectRow', index);
           	var row = $('#tt').datagrid('getSelected');
           	var id = row.id; */
		
            t.treegrid('endEdit', editingId);  //关闭编辑
            t.treegrid('select', editingId); //选中 数据
            var row = t.treegrid('getSelected'); //返回选中的 数据对象
            if(! row){
                t.treegrid('beginEdit', editingId);  //重新编辑 提交失败
                return false;
                
            }
            var _data = { 'id':row.id, 'name':row.name,'parent_id':row.parent_id ,'add':row.add};

            if(_data.add){
                var url = '${pageContext.request.contextPath}/structureAction_addStructure.action';
            }else{
                var url = '${pageContext.request.contextPath}/structureAction_editStructure.action';
            }
            
            $.ajax({
                url : url,
                type:'POST',
                dataType:'JSON',
                data:_data,
                success:function(data){
                    if(data.status==1){
                        cancelStructure();
                        doSearch();
                    }else if(data.status==2){
                        t.treegrid('beginEdit', editingId);  //重新编辑 提交失败
                        $("#settextvalue").html(data.info);
                    }else{
                        $.messager.alert('提示',data.info,'error');
                    }
                }
            });
        }
        location.reload(force);
    }

    //删除
    function delStructure(index){
        var t = $('#tt');
        if (editingId != undefined){
            t.treegrid('select',editingId);
            return;
        }
        editingId = index;
        t.treegrid('select', index); //选中 数据
        var row = t.treegrid('getSelected'); //返回选中的 node
		/* var pid = row.parent_id;
        alert(pid); */
        
        if(! row) return false;
        var title = '删除组织机构';
        var message = '确定要删除 "'+row.name+'",此板块下的子类也会全部删除，不可撤销。';
        $.messager.confirm(title,message,function(r){
            if(r){
                $.ajax({
                    url:'${pageContext.request.contextPath}/structureAction_deleteStructure.action',
                    type:'POST',
                    dataType:'JSON',
                    data:{'id':index},
                    success:function(data){
                        if(data.status==1){
                            t.treegrid('remove',index);
                        }else{
                            $.messager.alert('提示',data.info,'error');
                        }
                    }
                })
            }
            cancelStructure()
        })

    }

    //取消编辑
    function cancelStructure(){
        if (editingId != undefined){
            $('#tt').treegrid('cancelEdit', editingId);
            if(editingId>100000){
                $('#tt').treegrid('remove',editingId);
            }
            editingId = undefined;
        }
    }

    //双击取消 编辑
    function onDblClickCell(){
        cancelStructure();
    }

    function doSearch(id){
        var id = id == undefined ? 0 : id;
        $('#tt').treegrid('load',{
            id:id,
            school_id: $('#school_id').combobox("getValue")
    });
}
    /**
     * 添加按钮函数
     * @param value
     * @param row
     * @param index
     * @returns {*}
     */
    function rowformater(value,row){
        if(row){
            row.state = 'open';
            var rs,rs_a,rs_b,rs_c;

            if (hasEditPermission) {
                rs_a = '<a onclick="addStructure('+row.id+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">增加子类</span>' +
                    '<span class="l-btn-icon icon-add">&nbsp;</span></span>' +
                    '</a>';

                rs_c = '<a onclick="editStructure('+row.id+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                    '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                    '</a>';
            }

            if (hasDeletePermission) {
                rs_b = '<a onclick="delStructure('+row.id+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">删除</span>' +
                    '<span class="l-btn-icon icon-cancel">&nbsp;</span></span>' +
                    '</a>&nbsp;&nbsp;';
            }

            if(!row.parent_str || row.parent_str.split(',').length == 3){
                rs_b = '',rs_c='';
            }
            if(row.parent_id == 0){
                rs_a='', rs_b = '',rs_c='';
            }

            rs = rs_a+rs_c+rs_b;
            return rs;
        }

    }

$(function(){
    /*搜索  学校年级联动*/
    /* $('#school_id').combobox({
        data: schoolListJson,
        editable:false,
        valueField:'id',
        textField:'name',
        onLoadSuccess:function(){
            $('#school_id').combobox("setValue", '')
        },
        onSelect:function(record){

            if(record.id > 0){
                $("#expandButton").hide();
            }else{
                $("#expandButton").show();
            }

            //刷新数据，重新读取，
            doSearch();
        }
    }); */


    //折叠，展开
    var isExpand = 0;
    $(document).on('click','#expandButton',function(){

        if(isExpand){
           // $(this).find('.l-btn-text').html('折叠');

            //展开菜单
            $("#tt").treegrid('expandAll');
			
			$('#expandButton').linkbutton({
				iconCls: 'icon-remove',
				text: '折叠'
			});

            isExpand = 0;
        }else{
           // $(this).find('.l-btn-text').html('展开');

            //折叠菜单
            var treeData = $("#tt").treegrid('getRoot');
            var getChildrenData = $("#tt").treegrid('getChildren',treeData.id);
            for(var i=0; i<getChildrenData.length; i++){
                var level = $("#tt").treegrid('getLevel',getChildrenData[i]['id']);
                if(level == 2){
                    $("#tt").treegrid('collapse',getChildrenData[i]['id']);
                }
            }
			
			$('#expandButton').linkbutton({
				iconCls: 'icon-add',
				text: '展开'
			});
			
            isExpand = 1;
        }
    })
})
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