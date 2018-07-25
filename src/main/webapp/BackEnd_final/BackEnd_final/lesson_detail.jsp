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
        <title>左边导航栏</title>
        <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	    
	    
	    <script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/ueditor.all.min.js">
		</script>
		<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
		<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
		<script src="${path}BackEnd_final/layui/layui.js" charset="utf-8"></script>

		<link rel="stylesheet" href="${path}BackEnd_final/layui/css/layui.css" media="all">
    </head>
    <body class="layui-layout-body" >
		<div class="layui-layout layui-layout-admin">
		  <div class="layui-header">
		    <div class="layui-logo" style="font-size: 25px; color: white; left: 15%;">我是页面名称</div>
		    <!-- 头部区域（可配合layui已有的水平导航） -->
		    
		  </div>
		  
		  <div class="layui-side layui-bg-black">
		    <div class="layui-side-scroll">
		      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
		      
		      
		    <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px;">
			  <li class="layui-nav-item layui-nav-itemed">
			    <a href="javascript:;">企业管理</a>
			    <dl class="layui-nav-child">
			      <dd><a href="javascript:;">企业基本信息</a></dd>
			      <dd><a href="javascript:;">企业分部信息</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item">
			    <a href="javascript:;">师资管理</a>
			    <dl class="layui-nav-child">
			      <dd><a href="">师资力量</a></dd>
			      <dd><a href="">师资首页图片</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item">
			  	<a href="javascript:;">课程管理</a>
			  	<dl class="layui-nav-child">
			      <dd><a href="">课程信息管理</a></dd>
			      <dd><a href="">课程首页图片</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item">
			  	<a href="javascript:;">预约管理</a>
			  	<dl class="layui-nav-child">
			      <dd><a href="">预约课程查询</a></dd>
			      <dd><a href="">预约课程处理</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item">
			  	<a href="javascript:;">订单管理</a>
			  	<dl class="layui-nav-child">
			      <dd><a href="">订单查询</a></dd>
			      <dd><a href="">退款处理</a></dd>
			      <dd><a href="">订单核销</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item">
			  	<a href="javascript:;">朋友圈管理</a>
			  	<dl class="layui-nav-child">
			      <dd><a href="">消息列表</a></dd>
			      <dd><a href="">评论列表</a></dd>
			      <dd><a href="">朋友圈首页图片</a></dd>
			    </dl>
			  </li>
			</ul>
		      
		      </div>
		      
		      
		  </div>
		  <div class="layui-body">
		    <!-- 内容主体区域 -->
		    <div style="padding: 15px;">
		    	
			<div class="layui-card-header">
					<p style="float: left;">查看课程详细</p>
					<div style="float: right;">
						<h6><a href="#">刷新</a></h6>
					</div>
				</div>
				<div class="layui-card-body">
					<div>
							<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
								<legend>课程编号</legend>
							</fieldset>
							<p id="c_id"><%=request.getAttribute("lid") %></p>
					</div>
					<div>
							<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
								<legend>课程名称</legend>
							</fieldset>
							<p id="c_name"><%=request.getAttribute("lname") %></p>
					</div>	
					<div>
							<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
								<legend>课程图片</legend>
							</fieldset>
							<img id="cover" src="/webapps/../upload/cover/<%=request.getAttribute("cover") %>"/>
					</div>	
					<div>
							<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
								<legend>课程价格</legend>
							</fieldset>
							<p id="c_price"><%=request.getAttribute("lprice") %></p>
					</div>	
					<div id="lesson_detail">
						
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
								<legend>课程详情</legend>
						</fieldset>
						<%out.println(request.getAttribute("ldesc")) ;%>
					</div>	
					<div>
							<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
								<legend>课程类型</legend>
							</fieldset>
							<p id="state"><%=request.getAttribute("category") %></p>
					</div>				
					<div>
							<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
								<legend>分布位置</legend>
							</fieldset>
							<p id="location"><%=request.getAttribute("branchName") %></p>
					</div>	
				</div>		
		    	
		    </div>
		  </div>

		
		<script type="text/javascript" src="${path}BackEnd_final/layui/layui.js"></script>
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
		<script>
			layui.use('upload', function() {
				var $ = layui.jquery,
					upload = layui.upload;

				//普通图片上传
				var uploadInst = upload.render({
					elem: '#choose',
					url: '/upload/',
					before: function(obj) {
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {
							$('#cover').attr('src', result); //图片链接（base64）
						});
					},
					done: function(res) {
						//如果上传失败
						if(res.code > 0) {
							return layer.msg('上传失败');
						}
						//上传成功
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#demoText');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInst.upload();
						});
					}
				});

				layui.use(['form', 'layedit', 'laydate'], function() {
					var form = layui.form,
						layer = layui.layer,
						layedit = layui.layedit,
						laydate = layui.laydate;
				});
			});
		</script>

		
	</body>
</html>