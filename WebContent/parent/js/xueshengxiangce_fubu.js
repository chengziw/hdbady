/*
 * 自己的JS脚步
 * @Author: iceStone
 * @Date:   2015-12-12 10:59:26
 * @Last Modified by:   iceStone
 * @Last Modified time: 2015-12-12 11:01:38
 */

'use strict';


//var getInfo=window.location.search.slice(window.location.search.lastIndexOf("?")+1);
//
//console.log(getInfo);
//console.log(decodeURI(window.location.search))
//?1123?张三三
var xinxi = decodeURI(window.location.search);
var studentName = xinxi.slice(xinxi.lastIndexOf("?")+1);
var studentid = xinxi.slice(1,xinxi.lastIndexOf("?"));

//表单隐藏的学生ID
$("#s_id")[0].setAttribute("value",studentid);

//console.log($("#s_id")[0].getAttribute("value"))

$("#studentName").html("正在给"+ studentName+"发送图片：");
