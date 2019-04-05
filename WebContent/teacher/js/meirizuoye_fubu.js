/*
 * 自己的JS脚步
 * @Author: iceStone
 * @Date:   2015-12-12 10:59:26
 * @Last Modified by:   iceStone
 * @Last Modified time: 2015-12-12 11:01:38
 */

'use strict';






$(function () {
        $.ajax({
            type: 'post',
            url: 'subjectAction_t_findAllSubjectToHomeWorkAdd.action',


            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
            success: function (data) {

                //遍历每一个带学科的列表
                /* <div class="xueke">
                 <label class="checkbox-inline">
                 <input type="checkbox" id="inlineCheckbox1" value="option1"> 社会
                 </label>
                 <label class="checkbox-inline">
                 <input type="checkbox" id="inlineCheckbox2" value="option2"> 科学
                 </label>
                 <label class="checkbox-inline">
                 <input type="checkbox" id="inlineCheckbox3" value="option3"> 语文
                 </label>
                 </div>*/
                //设置隐藏的班级号
                //console.log(data.subjectlist[0].classlist.classid)
                $("#banhao")[0].setAttribute("value",data.subjectlist[0].classlist.classid);
                //console.log($("#banhao")[0].getAttribute("value"));


                $(data.subjectlist).each(function (index, value) {
                    //console.log(this.subjectname);
                    //找着div xueke

                    $(".xueke").append(
                        $("<label class='checkbox-inline'></label>").html(
                            "<input type='radio' name='subject_id' checked='checked' >"+
                            this.subjectname
                        )

                    );

                })

            },
            error: function () {
                //alert("error occured!!!");
            }

        });

    }
)

