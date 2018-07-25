<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%> 

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程信息详情页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/ueditor.all.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
		<script src="${path}BackEnd_final/layui/layui.js" charset="utf-8"></script>
		<link rel="stylesheet" href="${path}BackEnd_final/layui/css/layui.css" media="all">
		<style>
			.layui-card {margin: 35px 45px 45px 0; text-align: center; border-radius: 10px;}
			.layui-card-header {
				font-size: large; 
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
			}
			.layui-textarea {overflow-x: hidden; color: #697882;}
		</style>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                //obj.height = this.document.body.scrollHeight;
                    obj.height = '1500px';
                    
            } 
            function editlesson(){
            	window.location.href="<%=request.getContextPath()%>/BackEnd/edit?lid="+getUrlParam("lid");//跳到购买界面
            }
            function getUrlParam(name) {
    		    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); // 构造一个含有目标参数的正则表达式对象
    		    var r = window.location.search.substr(1).match(reg);  // 匹配目标参数
    		    if (r != null) return unescape(r[2]); return null; // 返回参数值
    		}
        </script>
	</head>

	<body class="layui-layout-body" 
		style="font-family: '宋体'; background-color: #F8F8FF;" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin">
				<!-- 内容主体区域 -->
		  <div style="background-color: white; 
			  	margin: 0px 50px 0px 0px; background-color: #F8F8FF;">
			  <div class="layui-col-md6">
			  	<div class="layui-row">
			  		<div class="layui-collapse">
				  		<div class="layui-col-md12 layui-colla-item">
				  		  
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">课程图片</div>
								<div class="layui-card-body layui-colla-content layui-show" style="padding-left: 3%;">
									<img id="cover"  style="width:500px;height:520px" src="/webapps/../upload/cover/<%=request.getAttribute("cover") %>"/>
								</div>
							</div>
						</div>
						
			  		</div>
			  	</div>
			  </div>
			  	
			  <div class="layui-col-md6">
			  	<div class="layui-row">
			  		<div class="layui-collapse">
			  		<div class="layui-col-md12 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">课程编号</div>
							<div class="layui-card-body layui-colla-content layui-show" >
								<%=request.getAttribute("lid") %>
							</div>
						</div>
					</div>
					<div class="layui-col-md12 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">课程名称</div>
							<div class="layui-card-body layui-colla-content layui-show">
								<%=request.getAttribute("lname") %>
							</div>
						</div>
					</div>
					<div class="layui-col-md12 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">课程价格</div>
							<div class="layui-card-body layui-colla-content layui-show">
								<%=request.getAttribute("lprice") %>
							</div>
						</div>
					</div>
					<div class="layui-col-md12 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">课程分类</div>
							<div class="layui-card-body layui-colla-content layui-show">
								<%=request.getAttribute("category") %>
							</div>
						</div>
					</div>
					<div class="layui-col-md12 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">开设分部</div>
							<div class="layui-card-body layui-colla-content layui-show">
							  <%=request.getAttribute("branchName") %>
							</div>
						</div>
					</div>
				  </div>
			  	</div>
			  </div>
			  <div class="layui-col-md12">
			  		 <div class="layui-col-md12 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">课程描述</div>
								<div class="layui-card-body layui-colla-content layui-show" style="text-align: left  ">
									<%out.println(request.getAttribute("ldesc")) ;%>
								</div>
							</div>
					</div>
					<div class="layui-form-item">
						<button class="layui-btn" onclick="editlesson()" style="margin: 5% 0 0 43%;">
							修改课程信息
						</button>
					 </div>
				</div>
			  	
		  </div>
		</div>
</body>

</html>