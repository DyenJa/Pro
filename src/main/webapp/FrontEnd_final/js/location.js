 $(function() {          
      var isdrag = false;
      var NowTop = 0,
            flag   = true,
            h = $(".wrap").height(),
            h1 = 0,
            h2 = $(".div2").position().top,
            moveY = 0,
            toTop = 0,
            disEndY=0,
            disY;
      var oDiv2 = document.getElementById("div2");
      oDiv2.addEventListener('touchstart', thismousedown);
      oDiv2.addEventListener('touchend', thismouseup);
      oDiv2.addEventListener('touchmove', thismousemove);
      $(oDiv2).css("top",($("body").height()-120))
      function thismousedown(e) {
//          debugger
            isdrag = true;
            disY = e.touches[0].pageY;
      if((disY-disEndY)>0){               
                  if(h>$("body").height()){
                        moveY = $("body").height();
                        h-=$("body").height();
                  }else if(h<$("body").height()&&h>0){
                        moveY = h;
                        h = $(".wrap").height();
                  }
      }
            return false;
      }
      function thismousemove(e) {
            
            var h=$(".wrap").height()
            if(isdrag) {
                  var x = e.touches[0].pageY - disY;
                  //向下滑动
                  if((e.touches[0].pageY - disY) > 0 && Math.abs(e.touches[0].pageY - disY) < 100) {
                        if(Math.abs($(".div2").position().top-h2)>$("body").height()){
                              h1=$("body").height();
                              $(oDiv2).stop().animate({
                                    top: "+="+h1+"px"
                              }, 1000)
                        }else{
                              $(oDiv2).stop().animate({
                                    top: ($("body").height()-120)+"px"
                              }, 1000)
                        }
                        flag=true
                        return false;
                  }
                  //           向上滑动
                  if((e.touches[0].pageY - disY) < 0 && Math.abs(e.touches[0].pageY - disY) < 100) {
                        if(flag){
                              $(oDiv2).stop().animate({
                                    top: "-="+(moveY-100)+"px"
                              }, 1000)
                              if(moveY<$("body").height()){
                                    flag=false
                                    h = $(".wrap").height();
                              }
                        }                       
                        return false;
                  }
            }
      }
      function thismouseup(e) {
            isdrag = false;
      };
});