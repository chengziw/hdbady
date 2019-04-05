var fanhui = $("header span")[0];
fanhui.onclick= function () {
    //console.log(fanhui);
    top.location = "teacherAction_t_home.action";
};
$("#buttontijiao").click(function () {

	var start_time = $("#appDate").val();
	var end_time = $("#appDate1").val();
	var type= $("input[name='type']:checked").val()  
	var reason=$("#reason").val();
	
/*    $.ajax({
        type: 'post',
        url: 'teacherVacationAction_t_addTeacherVacation.action?start_time='+start_time+'&end_time='+end_time+'',

        dataType: 'json', //很重要!!!.预期服务器返回的数据类型 
        success: function (data) {



        },
        error: function () {
            alert("error occured!!!");
        }

    });*/
	 var url="teacherVacationAction_t_addTeacherVacation.action";
	$('#form').form('submit',{
        url: url,
        onSubmit: function(params){
            /*params.start_time = start_time;
            params.end_time = end_time;*/
            params.type = type;
            params.reason = reason;
            var flag=true;
//            alert("  开始时间   "+start_time+"  结束时间   "+end_time+"  类型   "+type+"  原因   "+reason);
            if (start_time==null || end_time==null||type==undefined||reason==null) {
            	alert("请将信息填写完全");
            	flag=false;
            }
            return flag;
        },
        success: function(result){
        	var result = eval('('+result+')');
            alert(result.errMeg)
        }
    });





})


//日期相差天数

function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2002-12-18格式
    var  aDate,  oDate1,  oDate2,  iDays
    aDate  =  sDate1.split("-")
    oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2002格式
    aDate  =  sDate2.split("-")
    oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])
    iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数
    return  iDays
}
//var s1 = "2010-12-10";
//var s2 = "2010-12-15";
//alert(DateDiff(s1,s2));


var yema = 1;
$(function () {
        $.ajax({
            type: 'post',
            url: 'teacherVacationAction_t_pageQuery.action?page='+yema+'&rows=3',
            
            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
            success: function (data) {

            	yema++;
/*"yuanyin":"事假",
 "startTime":"2017-4-8",
 "endTime":"2017-5-5",
 "check":"未通过",
 "content":"*/
                $(data.qingjiaList).each(function (index, value) {

                    //console.log(this.startTime);
                    /*<ul class="ul-list" id="ul-list">
                     <li>
                     <div class="riqihao">14-12-12号</div>
                     <span>病假</span>
                     <span>3天</span>
                     <span>未通过</span>
                     <div class="yuanyin">因朋友结婚，需前去随礼，还望领导批准！</div>
                     </li>*/

                    var daycha = DateDiff(this.startTime,this.endTime);
                    var li = $("<li>" +
                        "<div class='riqihao'>"+this.startTime+"号</div>" +
                        "<span>"+this.yuanyin+"</span>" +
                        "<span>"+daycha+"</span>" +
                        "<span>"+this.check+"</span>" +
                    "<div class='yuanyin'>"+this.content+"</div>"+


                    "</li>");
                    $("#ul-list").prepend(li);
                })


                var div = $("<div class='jiazai' id='jiazai'>点击加载更多...</div>")

                if(data.hasMore) {

                    div.click(function () {

                        var that = this;

                        $.ajax({
                            type: 'post',
                            url: 'teacherVacationAction_t_pageQuery.action',

                            data:{"page":yema,"rows":3},
                            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
                            success: function (data) {

                            	console.log("yema"+yema);
                            	yema++;
                                /*"yuanyin":"事假",
                                 "startTime":"2017-4-8",
                                 "endTime":"2017-5-5",
                                 "check":"未通过",
                                 "content":"*/
                                $(data.qingjiaList).each(function (index, value) {

                                    //console.log(this.startTime);
                                    /*<ul class="ul-list" id="ul-list">
                                     <li>
                                     <div class="riqihao">14-12-12号</div>
                                     <span>病假</span>
                                     <span>3天</span>
                                     <span>未通过</span>
                                     <div class="yuanyin">因朋友结婚，需前去随礼，还望领导批准！</div>
                                     </li>*/

                                    var daycha = DateDiff(this.startTime,this.endTime);
                                    var li = $("<li>" +
                                        "<div class='riqihao'>"+this.startTime+"号</div>" +
                                        "<span>"+this.yuanyin+"</span>" +
                                        "<span>"+daycha+"</span>" +
                                        "<span>"+this.check+"</span>" +
                                        "<div class='yuanyin'>"+this.content+"</div>"+


                                        "</li>");
                                    $("#ul-list").append(li,that);
                                })



                            },
                            error: function () {
                                //alert("error occured!!!");
                            }

                        });





                    })
                }
                else{
                    div.html("没有了...");
                }

                $("#ul-list").append(div);


                        },
            error: function () {
                //alert("error occured!!!");
            }

        });

    }
)
