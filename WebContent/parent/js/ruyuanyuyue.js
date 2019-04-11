var fanhui = $("header span")[0];
fanhui.onclick= function () {
    //console.log(fanhui);
    top.location = "studentAction_p_home.action";
};
$("#buttontijiao").click(function () {


    var vaule = $("#appDate").val();
    //console.log(vaule);



    starttime =vaule;
    starttime = starttime.replace(new RegExp("-","gm"),"/");
    var inputvalue1 = (new Date(starttime)).getTime();

    //console.log(starttimeHaoMiao);
    //(new Date((new Date().toLocaleDateString()).getTime());
    var nowdate = (new Date(new Date().toLocaleDateString())).getTime();
    //console.log(nowdate);
    //console.log(oldTime);
    if(inputvalue1 < nowdate){
        alert("报名时间小于今天");
        $("#appDate").val("");
        return;
    }


    var vaule1 = $("#appDate1").val();
    //console.log(vaule);

    if(vaule =="" || vaule1 ==""){
        alert("日期不能为空");
        return;
    }

    starttime1 =vaule1;
    starttime1 = starttime1.replace(new RegExp("-","gm"),"/");
    var inputvalue2 = (new Date(starttime1)).getTime();

    var now = new Date();
    now.setFullYear(now.getFullYear()-3);
    now = new Date(now);


    if(inputvalue2 > now.getTime()){
        alert("孩子小于三岁，没到上学年龄");
        $("#appDate1").val("");
        return;
    }

    if($($(".notkong")[0]).val() ==""){
        alert("宝贝姓名不能为空");
        return;
    }

    if($($(".notkong")[1]).val() ==""){
        alert("家长姓名不能为空");
        return;
    }
    if($($(".notkong")[2]).val() ==""){
        alert("家长手机不能为空");
        return;
    }

       $( "#form").submit();
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


$(function () {
        $.ajax({
            type: 'post',
            url: 'json/ruyuanyuyue.json',

            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
            success: function (data) {

                /*"bespeakList":[
                 {
                 "addrss":"未填写",
                 "attendShoolTime":"2017-4-5",
                 "beaspkId":69,
                 "birthday":"2012-3-4",
                 "createTime":1492167223,
                 "demand":"没要求",
                 "gradeId":2,
                 "gradeName":"小班",
                 "parentName":"葛触犯（爸爸）",
                 "parentPhone":1844585290,
                 "schoolContact":{
                 "name":"唐国辉",
                 "phone":185655689925
                 }
                 ,
                 "sex":"男",
                 "status":1,
                 "statusLabel":"待审核",
                 "studentName":"个触犯"
                 }*/
                $(data.bespeakList).each(function (index, value) {

                    //alert(this.addrss)




                    var li = $("<li>" +
                        "<div class='shenhe'>"+
                        "<div class='blue'>汤圆幼儿园</div>"+
                        "<div>"+this.statusLabel+"</div>"+
                        "</div>"+
                        "<div class='kuai'>"+
                        "<span>报到时间：</span>"+
                    "<span>"+this.attendShoolTime+"</span>"+
                    "</div>"+
                    "<div class='kuai'>"+
                        "<span>学生姓名：</span>"+
                    "<span>"+this.studentName+"</span>"+
                    "</div>"+
                    "<div class='kuai'>"+
                        "<span>学生性别：</span>"+
                    "<span>"+this.sex+"</span>"+
                    "</div>"+
                    "<div class='kuai'>"+
                        "<span>学生生日：</span>"+
                    "<span>"+this.birthday+"</span>"+
                    "</div>"+
                    "<div class='kuai'>"+
                        "<span>家长姓名：</span>"+
                    "<span>"+this.parentName+"</span>"+
                    "</div>"+
                    "<div class='kuai'>"+
                        "<span>家长手机：</span>"+
                    "<span>"+this.parentPhone+"</span>"+
                    "</div>"+
                    "<div class='kuai zui'>"+
                        "<span>家长要求：</span>"+
                    "<span>"+this.demand+"</span>"+
                    "</div>"+

                    "<div class='kuai'>"+
                        "<span>校联系人："+this.schoolContact.name+"</span>"+
                    "<span class='green'>"+this.schoolContact.phone+"</span>"+
                        "</div>"+
                        "</li>");

                    $("#ul-list").prepend(li);
                })

            },
            error: function () {
                //alert("error occured!!!");
            }

        });

    }
)
