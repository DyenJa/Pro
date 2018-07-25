<%@ page language="java"  contentType="text/html; charset=utf-8" import="java.io.File"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    	String path = request.getContextPath();
    	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    	request.setAttribute("path", basePath);   	
    	
    	String imgpath = request.getServletContext().getRealPath("/");
    	String ppath = new File(imgpath).getParent();
    	imgpath = ppath+"/upload/messageimgs";
    	request.setAttribute("imgpath", imgpath);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程首页图片页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${path}/BackEnd_final/layui/css/layui.css">
		<link rel="stylesheet" href="${path}/BackEnd_final/assets/css/amazeui.min.css" />
	    <link rel="stylesheet" href="${path}/BackEnd_final/assets/css/admin.css">
	    <link rel="stylesheet" href="${path}/BackEnd_final/assets/css/app.css">
		<script src="${path}/BackEnd_final/assets/js/jquery.min.js"></script>
    	<script src="${path}/BackEnd_final/assets/js/amazeui.min.js"></script>
    	<script src="${path}/BackEnd_final/assets/js/app.js"></script>
		<style>
			.layui-card {margin: 35px 45px 45px 0; border-radius: 10px;}
			.layui-card-header {
				font-size: large; 
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
			}
			body {font-family: '宋体'; background-color: #F8F8FF;}
			#demo1 {width: 100%; height: 450px; margin-bottom: 3%;}
			.am-btn {background-color: #009E94; border: none;}
		</style>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                obj.height = this.document.html.height;
            } 
        </script>
 <style type="text/css">
 /*CSS grayr style pagination*/ 
DIV.yahoo { 
    PADDING-RIGHT: 3px; 
    PADDING-LEFT: 3px; 
    PADDING-BOTTOM: 3px; 
    MARGIN: 3px; 
    PADDING-TOP: 3px; 
    TEXT-ALIGN: center 
} 

DIV.yahoo A { 
    BORDER-RIGHT: #fff 1px solid; 
    PADDING-RIGHT: 5px; 
    BORDER-TOP: #fff 1px solid; 
    PADDING-LEFT: 5px; 
    PADDING-BOTTOM: 2px; 
    MARGIN: 2px; 
    BORDER-LEFT: #fff 1px solid; 
    COLOR: #000099; 
    PADDING-TOP: 2px; 
    BORDER-BOTTOM: #fff 1px solid; 
    TEXT-DECORATION: underline 
} 

DIV.yahoo A:hover { 
    BORDER-RIGHT: #000099 1px solid; 
    BORDER-TOP: #000099 1px solid; 
    BORDER-LEFT: #000099 1px solid; 
    COLOR: #000; 
    BORDER-BOTTOM: #000099 1px solid 
} 

DIV.yahoo A:active { 
    BORDER-RIGHT: #000099 1px solid; 
    BORDER-TOP: #000099 1px solid; 
    BORDER-LEFT: #000099 1px solid; 
    COLOR: #f00; 
    BORDER-BOTTOM: #000099 1px solid 
} 

DIV.yahoo SPAN.current { 
    BORDER-RIGHT: #fff 1px solid; 
    PADDING-RIGHT: 5px; 
    BORDER-TOP: #fff 1px solid; 
    PADDING-LEFT: 5px; 
    FONT-WEIGHT: bold; 
    PADDING-BOTTOM: 2px; 
    MARGIN: 2px; 
    BORDER-LEFT: #fff 1px solid; 
    COLOR: #000; 
    PADDING-TOP: 2px; 
    BORDER-BOTTOM: #fff 1px solid; 
    BACKGROUND-COLOR: #fff 
} 

DIV.yahoo SPAN.disabled { 
    BORDER-RIGHT: #eee 1px solid; 
    PADDING-RIGHT: 5px; 
    BORDER-TOP: #eee 1px solid; 
    PADDING-LEFT: 5px; 
    PADDING-BOTTOM: 2px; 
    MARGIN: 2px; 
    BORDER-LEFT: #eee 1px solid; 
    COLOR: #ddd; 
    PADDING-TOP: 2px; 
    BORDER-BOTTOM: #eee 1px solid 
} 
</style>
	</head>

	<body class="layui-layout-body" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin" style="margin: 0px 50px 0px 0px;">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header layui-colla-title">朋友圈消息列表</div>
					  <div class="am-g">
                        <div class="tpl-table-images">
                        
                        <c:forEach items="${requestScope.messages }" var="m">
                            <div class="layui-col-md4"><!--am-u-sm-4 am-u-md-4 am-u-lg-4-->
                                <div class="tpl-table-images-content">
                                    <div class="tpl-table-images-content-i-time" style="display: inline-block;width: 60%;">发布时间：${m.mtime }</div>
                                    <div class="am-btn-toolbar" style="margin-left: 15%;display: inline-block;">
                                            <div class="am-btn-group am-btn-group-xs ">
                                                <button type="button" class="am-btn am-btn-default am-btn-danger">
                                                	<a href="<%=request.getContextPath()%>/BackEnd/message/messagedelete?currentPage=${page.currentPage }&mid=${m.mid}"  style="color:white"><span class="am-icon-trash-o"></span> 删除</a>
                                                </button>
                                               <!-- <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span>查看评论</button>-->
                                            </div>
                                    </div>
                                    <div class="tpl-i-title">
                                        <span>${m.mtitle }</span>
                                    </div>
                                    <a href="javascript:;" class="tpl-table-images-content-i">
                                      <div class="layui-row layui-col-space10" style="height: 350px;">
                                      	<c:if test="${fn:length(m.messageimgs)==1 }">
                                      		<c:forEach items="${m.messageimgs }"  var="img">
		                                    	<div class="layui-col-md12">
	                                       			 <img src="../../../upload/messageimgs/${img.imgUrl}" style="height: 326px;">
	                                        	</div>
                                       		 </c:forEach>
                                      	</c:if>
                                      	<c:if test="${fn:length(m.messageimgs)>1 }">
	                                       	<c:forEach items="${m.messageimgs }"  var="img">
		                                    	<div class="layui-col-md6">
		                                        	<img src="../../../upload/messageimgs/${img.imgUrl}" style="height: 163px;">
		                                        </div>
	                                        </c:forEach>
                                        </c:if>
                                      </div>
                                    </a>
                                    <div class="tpl-table-images-content-block">
                                        <div class="tpl-i-more">
                                            <ul>
                                                <li><span class="layui-icon layui-icon-praise"> ${m.likenum }</span></li>
                                                <li><span class="layui-icon layui-icon-reply-fill"> ${m.replynum }</span></li>     
                                                <li><a href="<%=request.getContextPath()%>/BackEnd/message/messagereview?messagePage=${page.currentPage}&mid=${m.mid}"><span class="layui-icon layui-icon-right">查看评论</a></li>
                                            </ul>
                                       </div>       
                                    </div>
                                </div>
                            </div>
                          </c:forEach>
                                
                        </div>       
                           
                      </div>

				         <div class="yahoo"> 				      
					        <c:if test="${page.currentPage==1 }"><span class="disabled"><</span></c:if>
						    <c:if test="${page.currentPage!=1 }"><a href="<%=request.getContextPath()%>/BackEnd/message/messagelist?currentPage=${page.currentPage-1 }" ><span><</span></a></c:if>
						     <c:forEach begin="${page.startPage }" end="${page.endPage }" var="i"> 
						     <c:if test="${page.currentPage==i }">
						    <span class="current">${i }<span>
						    </c:if>
						    <c:if test="${page.currentPage!=i }">
						    <a href="<%=request.getContextPath()%>/BackEnd/message/messagelist?currentPage=${i }" ><span >${i }</span></a>
						    </c:if>
						     </c:forEach>
						    <c:if test="${page.currentPage==page.totalPage }"><span class="disabled">></span></c:if>
						    <c:if test="${page.currentPage!=page.totalPage }"><a href="<%=request.getContextPath()%>/BackEnd/message/messagelist?currentPage=${page.currentPage +1}" ><span>></span></a></c:if>	  
					    </div>                        
					
					</div>
				</div>
			</div>
		</div>
		<script src="${path}/BackEnd_final/layui/layui.js"></script>
		<!-- <script>
		layui.use('laypage', function(){
		  var laypage = layui.laypage;
		  
		  //执行一个laypage实例
		  laypage.render({
		    elem: 'test3' //注意，这里的 test1 是 ID，不用加 # 号
		    ,count: 50 //数据总数，从服务端得到
		  });
		});
		</script> -->
	</body>
</html>



