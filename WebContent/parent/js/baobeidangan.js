var fanhui = $("header span")[0];
fanhui.onclick= function () {
    //console.log(fanhui);
    top.location = "studentAction_p_home.action";
};

$(function () {
        $.ajax({
            type: 'post',
            url: 'studentAction_p_aboutStudent.action',

            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
            success: function (data) {

                /*
                 "birthday":"2012-3-4",


                 "gradeId":2,
                 "gradeName":"小班",
                 "parentName":"葛触犯（爸爸）",
                 "parentPhone":1844585290,

                 "aihao":"跳舞，唱歌",
                 "sex":"男",

                 "studentid":31291,
                 "studentName":"个触犯"*/

                /*<table class="">

                 </table>
                 */

                var table = $("<table>" +
                "<tr>"+
                "<td>姓名</td>"+
                "<td>"+data.studentName+"</td>"+
                "</tr>"+
                "<tr>"+
                "<td>性别</td>"+
                "<td>"+data.sex+"</td>"+
                "</tr>"+
                "<tr>"+
                "<td>生日</td>"+
                "<td>"+data.birthday+"</td>"+
                "</tr>"+
                "<tr>"+
                "<td>学号</td>"+
                "<td>"+data.studentid+"</td>"+
                "</tr>"+
                "<tr>"+
                "<td>学校</td>"+
                "<td>华德幼儿园</td>"+
                "</tr>"+
                "<tr>"+
                "<td>当前班级</td>"+
                "<td>"+data.gradeName+"</td>"+
                "</tr>"+
                "<tr>"+
                "<td>特长爱好</td>"+
                "<td>"+data.aihao+"</td>"+
                "</tr>"+
                "<tr>"+
                "<td>家长姓名</td>"+
                "<td>"+data.parentName+"</td>"+
                "</tr>"+
                "<tr>"+
                "<td>家长电话</td>"+
                "<td>"+data.parentPhone+"</td>"+
                "</tr>"+

                "</table>");


                    $("#home").html(table);


            },
            error: function () {
                //alert("error occured!!!");
            }

        });

    }
)




