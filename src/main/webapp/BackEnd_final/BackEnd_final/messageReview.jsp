<%@ page language="java" contentType="text/html; charset=utf-8" import="com.neusoft.tools.Page,java.util.List,com.neusoft.po.MessageReply"
    pageEncoding="utf-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("path", basePath);   	
	
	Page replypage = (Page)request.getAttribute("page");
	
	List<MessageReply> list = (List<MessageReply>)request.getAttribute("messageReplys");
	int i = 0;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>朋友圈信息列表</title>
    <link rel="stylesheet" href="${path}/BackEnd_final/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${path}/BackEnd_final/assets/css/admin.css">
    <link rel="stylesheet" href="${path}/BackEnd_final/assets/css/app.css">
    <link rel="stylesheet" href="${path}/BackEnd_final/layui/css/layui.css">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.js"></script>
    <style>
    	body {font-family: '宋体'; background-color: #F8F8FF;}
    </style>
</head>

<body class="layui-layout-body" onload="IFrameResize();">
	<div class="layui-layout layui-layout-admin" style="margin: 0px 50px 0px 0px;">
		<div class="tpl-portlet-components">
            	<div class="portlet-title">
                    <div class="caption bold" style="font-family: '宋体';">
                       		<a href="<%=request.getContextPath()%>/BackEnd/message/messagelist?currentPage=${messagePage}" id="back">< 评论列表</a>
                    </div>
                    
                </div>
                <div class="tpl-block">
                    <div class="am-g" style="margin-left: 90%;">
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am-btn-toolbar">
                            
                                <div class="am-btn-group am-btn-group-xs">
                                  
                                    <button type="button" class="am-btn am-btn-default am-btn-danger"  id="delete"><span class="am-icon-trash-o"></span> 删除</button>
                                </div>
                            </div>
                        </div>
                    </div>
					<script>
					var url = document.referrer;
					url = url.split("messagelist");
					if(url.length==2){
						sessionStorage.clear();
					}
					</script>
                    <ul class="tpl-task-list">
                    		<c:forEach items="${requestScope.messageReplys }" var="m">
                        	 <li>
		                            <div class="task-checkbox">
		                                <input type="hidden" value="1" name="test">
		                                <input type="checkbox" class="liChild" value="${m.id }" name="test" id="${m.id }" onclick="check(${m.id})">
		                             
		                            </div>
		                            <div class="task-title">
		                                <span class="task-title-sp">${m.content } </span>
	                           		</div>
	                           		 <script>
	                           				 var replyids = JSON.parse(sessionStorage.getItem("replyids"));
	                           				 var id = <%=list.get(i).getId()%>;
	                           				 var index = -1;
                   	 	 					 id = id.toString();
	                           				 if(replyids!=null){
                      	 	 					index = $.inArray(id,replyids);
                      	 	 					if(index!=-1){
                      	 	 					document.getElementById(id).checked=true;
                      	 	 					}
	                           				 }                          			              				
                      	 			 </script>
                      	 	 </li>	
                      	 	 <%i +=1; %>
                      	 	 </c:forEach>
                      	 	
                    </ul>                 
               	</div>
               	
				<div  style="margin-top: 40px; margin-left: 40%">
                        <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">
                         	<c:if test="${page.currentPage==1 }"><a href="#" class="layui-laypage-prev layui-disabled" >上一页</a></c:if>
	                      	<c:if test="${page.currentPage!=1 }"><a href="<%=request.getContextPath()%>/BackEnd/message/messagereview?currentPage=${page.currentPage-1 }&messagePage=${requestScope.messagePage}&mid=${requestScope.mid}" class="layui-laypage-prev" >上一页</a></c:if>
	                       
	                        <c:forEach begin="${page.startPage }" end="${page.endPage }" var="i"> 
						     <c:if test="${page.currentPage==i }">
						    <span class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>${i }</em></span>
						    </c:if>
						    <c:if test="${page.currentPage!=i }">
						    <a href="<%=request.getContextPath()%>/BackEnd/message/messagereview?currentPage=${i }&messagePage=${requestScope.messagePage}&mid=${requestScope.mid}" >${i }</a>
						    </c:if>
						     </c:forEach>
	                        <c:if test="${page.currentPage==page.totalPage }"><a href="#" class="layui-laypage-prev layui-disabled" >下一页</a></c:if>
	                      	<c:if test="${page.currentPage!=page.totalPage }"><a href="<%=request.getContextPath()%>/BackEnd/message/messagereview?currentPage=${page.currentPage+1 }&messagePage=${requestScope.messagePage}&mid=${requestScope.mid}" class="layui-laypage-prev" >下一页</a></c:if>
                        </div>
                </div>
				
            </div>
	</div>
    <script src="${path}/BackEnd_final/assets/js/jquery.min.js"></script>
    <script src="${path}/BackEnd_final/assets/js/amazeui.min.js"></script>
    <script src="${path}/BackEnd_final/assets/js/app.js"></script>
    <script src="${path}/BackEnd_final/layui/layui.js"></script>
    <script type="text/javascript">
                    function check(id){
                    	id = id.toString();
                    	var box = 	document.getElementById(id)
	 	 				if(box.checked==false){	 	 				
	 	 					 var replyids = JSON.parse(sessionStorage.getItem("replyids"));
	                    	 var index = -1;
	                    	 if(replyids!=null){
	   	 	 					index = $.inArray(id,replyids);
	   	 	 					if(index!=-1){
	   	 	 					replyids.splice(index,1);
	   	 	 					sessionStorage.setItem("replyids", JSON.stringify(replyids));	
	   	 	 					}
	            			} 
	 	 				}
                    }
      </script>
	<script type="text/javascript">
	 
	$(function(){
		$("#delete").click(function(){
			
			var replyids = JSON.parse(sessionStorage.getItem("replyids"));
			if(replyids==null){
			var replyids = new Array();
			}
				//$('input:checkbox:checked') 等同于 $('input[type=checkbox]:checked')
				$.each($('input:checkbox:checked'),function(){
					replyids.push($(this).val());
	            });	
				if(replyids.length==0){
					alert("未选中任何评论");
					return;
				}
				replyids = unique(replyids);
				console.log(replyids);
				 $.ajax({
					url:"<%=request.getContextPath()%>/BackEnd/message/delete_messagereply",
					type:"post",
					data:{"replyids":replyids},
					traditional:true,
					dataType:"json",
					success:function(data){
						if(data.result){
							alert("删除成功");
							sessionStorage.clear();
							window.location.href='<%=request.getContextPath()%>/BackEnd/message/messagereview?currentPage=<%=replypage.getCurrentPage()%>&messagePage=<%=request.getAttribute("messagePage")%>&mid=<%=request.getAttribute("mid")%>';
						}
						else{
							alert("删除失败");
						}
					}
			}); 
			})
			
		})	
	
	</script>
	
	<script>
		$(function(){
		$("a").click(function(){	
			
			var replyids = JSON.parse(sessionStorage.getItem("replyids"));
			if(replyids==null){
			var replyids = new Array();
			}
				//$('input:checkbox:checked') 等同于 $('input[type=checkbox]:checked')
				$.each($('input:checkbox:checked'),function(){
					replyids.push($(this).val());
	            });	
				replyids = unique(replyids);
				//alert(replyids.length);
				sessionStorage.setItem("replyids", JSON.stringify(replyids));	
		})			
		$("#back").click(function(){	
			sessionStorage.clear();
		})			
		})
				function unique(arr) {
		        var result = [];
		        var obj = {};
		        for(var i=0;i<arr.length;i++){
		            if(!obj[arr[i]]){
		                result.push(arr[i]);
		                obj[arr[i]] = true;
		            }
		        }
		        return result
		    }
	</script>
</body>
</html>

