/**
 *  函数使用说明：
 *      1、直接调用函数  TimeDifference()
 *          返回说明： 返回距离当前的时间差
 * */
function timeDifference(tmpTime) {
    var mm=1000;//1000毫秒 代表1秒
    var minute = mm * 60;
    var hour = minute * 60;
    var day = hour * 24;
    var month = day * 30;
    var ansTimeDifference=0;//记录时间差
    var tmpTimeStamp = tmpTime ? Date.parse(tmpTime.replace(/-/gi, "/")) : new Date().getTime();//将 yyyy-mm-dd H:m:s 进行正则匹配
    var nowTime = new Date().getTime();//获取当前时间戳
    var tmpTimeDifference = nowTime - tmpTimeStamp;//计算当前与需要计算的时间的时间戳的差值
    if (tmpTimeDifference < 0) {                //时间超出，不能计算
        alert("开始日期大于结束日期，计算失败！");
        return 0;
    }
    /**
     * 通过最开始强调的各个时间段用毫秒表示的数值，进行时间上的取整，为0的话，则没有到达
     * */
    var DifferebceMonth = tmpTimeDifference / month;    //进行月份取整
    var DifferebceWeek = tmpTimeDifference / (7 * day);//进行周取整
    var DifferebceDay = tmpTimeDifference / day;//进行天取整
    var DifferebceHour = tmpTimeDifference / hour;//进行小时取整
    var DifferebceMinute = tmpTimeDifference / minute;//进行分钟取整
    if (DifferebceMonth >= 1 ) {
        return tmpTime;                 //大于一个月 直接返回时间
    } else if (DifferebceWeek >= 1) {
//        ansTimeDifference= parseInt(DifferebceWeek) + "个星期前";
        return tmpTime;
    } else if (DifferebceDay >= 1) {
        ansTimeDifference = parseInt(DifferebceDay) + "天前";
    } else if (DifferebceHour >= 1) {
        ansTimeDifference = parseInt(DifferebceHour) + "个小时前";
    } else if (DifferebceMinute >= 1) {
        ansTimeDifference = parseInt(DifferebceMinute) + "分钟前";
    } else {
        ansTimeDifference = "刚刚";
    }
    return ansTimeDifference;
}
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

//str 为 毫秒值
function getshijiancha(str){
    return timeDifference(new Date(str).Format("yyyy-MM-dd hh:mm:ss"));
}
//console.log(getshijiancha("2017-3-30 12:16"));
//var time11 = new Date().Format("yyyy-MM-dd");
//var time12 = new Date().Format("yyyy-MM-dd hh:mm:ss");
//
//
//var time = new Date(1490266900);
////console.log(time);
//var  time2 = new Date(time).Format("yyyy-MM-dd hh:mm:ss");
////console.log(time2);
//console.log(timeDifference("2017-3-26 11:10"));
////console.log(timeDifference(time2));
