<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录页</title>
        <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	    <link rel="stylesheet" href="../layui/css/layui.css">
    </head>
    <body class="layui-layout-body" style="background-color:#F1F4F5 ;">
		<div class="layui-layout layui-layout-admin">
		  	<div class="layui-header"></div>

		    <!-- 内容主体区域 -->
			<div class="layui-card" style="width : 30%; margin-left: 36.5%; margin-top:10%; border-radius: 10px;">
			<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				<ul class="layui-tab-title">
					<li class="layui-this">管理员</li>
					<li>超级管理员</li>
				</ul>
				<div class="layui-tab-content" style="margin-top: 15px;">
					<div class="layui-tab-item layui-show">

						<div class="layui-card-body">
							<form class="layui-form" action="index.jsp" style="margin-left: -10%;">
								<div class="layui-form-item" >
									<label class="layui-form-label">用户名</label>
									<div class="layui-input-block">
										<input type="text" name="title" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">密码</label>
									<div class="layui-input-block">
										<input type="password" name="title" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" style="margin-top: 4% ; margin-left: 33%;">登陆</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="layui-tab-item">
						<div class="layui-card-body">
							<form class="layui-form" action="enterprise.jsp" style="margin-left: -10%;">
								<div class="layui-form-item">
									<label class="layui-form-label">用户名</label>
									<div class="layui-input-block">
										<input type="text" name="title" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">密码</label>
									<div class="layui-input-block">
										<input type="password" name="title" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" style="margin-top: 4% ; margin-left: 33%;">登陆</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		</div>
		<script type="text/javascript" src="../layui/layui.js"></script>
		<script>
		//JavaScript代码区域
		layui.use('element', function(){
		  var element = layui.element;
		  
		});
		layui.use('layer ', function(){
			var layer = layui.layer ;
		});
		layui.use('element', function(){
		  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
		  
		  //监听导航点击
		  element.on('nav(demo)', function(elem){
		    //console.log(elem)
		    layer.msg(elem.text());
		  });
		});
		</script>
	</body>
</html>