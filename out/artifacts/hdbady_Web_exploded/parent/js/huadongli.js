


//ֻҪ����ָ������aa����


    /*
     * ������html5ƻ���ֻ����󻬶�ɾ����Ч
     */
window.addEventListener('load', function() {
    var initX; //����λ��
    var moveX; //����ʱ��λ��
    var X = 0; //�ƶ�����
    var objX = 0; //Ŀ�����λ��
    window.addEventListener('touchstart', function(event) {
        //event.preventDefault();
        var obj = event.target.parentNode.parentNode;
        //console.log(obj);
        if ($(obj).hasClass("aa")) {
            //console.log("aaa");
            initX = event.targetTouches[0].pageX;
            objX = (obj.style.WebkitTransform.replace(/translateX\(/g, "").replace(/px\)/g, "")) * 1;
        }
        if (objX == 0) {
            window.addEventListener('touchmove', function(event) {
                event.preventDefault();
                var obj = event.target.parentNode.parentNode;
                if ($(obj).hasClass("aa")) {
                    moveX = event.targetTouches[0].pageX;
                    X = moveX - initX;
                    if (X >= 0) {
                        obj.style.WebkitTransform = "translateX(" + 0 + "px)";
                    } else if (X < 0) {
                        var l = Math.abs(X);
                        obj.style.WebkitTransform = "translateX(" + -l + "px)";
                        if (l > 80) {
                            l = 80;
                            obj.style.WebkitTransform = "translateX(" + -l + "px)";
                        }
                    }
                }
            });
        } else if (objX < 0) {
            window.addEventListener('touchmove', function(event) {
                //event.preventDefault();
                var obj = event.target.parentNode.parentNode;
                //console.log(obj);
                if ($(obj).hasClass("aa")) {
                    moveX = event.targetTouches[0].pageX;
                    X = moveX - initX;
                    if (X >= 0) {
                        var r = -80 + Math.abs(X);
                        obj.style.WebkitTransform = "translateX(" + r + "px)";
                        if (r > 0) {
                            r = 0;
                            obj.style.WebkitTransform = "translateX(" + r + "px)";
                        }
                    } else { //���󻬶�
                        obj.style.WebkitTransform = "translateX(" + -80 + "px)";
                    }
                }
            });
        }

    })
    window.addEventListener('touchend', function(event) {
        //event.preventDefault();
        var obj = event.target.parentNode.parentNode;
        if ($(obj).hasClass("aa")) {
            objX = (obj.style.WebkitTransform.replace(/translateX\(/g, "").replace(/px\)/g, "")) * 1;
            if (objX > -40) {
                obj.style.WebkitTransform = "translateX(" + 0 + "px)";
                objX = 0;
            } else {
                obj.style.WebkitTransform = "translateX(" + -80 + "px)";
                objX = -80;
            }
        }
    })
})
