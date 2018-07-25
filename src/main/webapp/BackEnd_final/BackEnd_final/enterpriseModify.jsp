<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@page import="com.neusoft.po.Enterprise"%>
	 <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>


	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>企业信息页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/BackEnd_final/layui/css/layui.css">
		<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/BackEnd_final/utf8-jsp/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/BackEnd_final/utf8-jsp/ueditor.all.min.js"></script>		
		<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/BackEnd_final/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.all.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.js"></script>
		<style>
			.layui-card {margin: 35px 45px 45px 0; text-align: center; border-radius: 10px;}
			.layui-card-header {
				font-size: large; 
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
			}
			.layui-textarea {overflow-x: hidden; color: #697882;}
			img {height: 80px;}
			#btn_upload {margin-left: 20%; margin-top: 20px;}
		</style>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                //obj.height = this.document.body.scrollHeight;
                obj.height = '2000px';
                //看看这个是修改页面还是上传页面    
                var ue = UE.getEditor("editor");
                var jczs = '<%=request.getAttribute("jczs")%>';
    			//alert(jczs);
    			ue.ready(function(){
    				if(jczs!="null"){
    					ue.setContent(jczs);
    				}
    			});
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
								<div class="layui-card-header layui-colla-title">企业名称</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="height: 50px; line-height: 50px;">
									<input id="enterprise_name" class="layui-input" type="text" value="${list.name }"/>
								</div>
							</div>
						</div>
						<div class="layui-col-md12 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">企业简介</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="text-align: left;">
									<textarea id="enterprise_introduction" class="layui-textarea">${list.introduction }</textarea>
								</div>
							</div>
						</div>
						<div class="layui-col-md12 layui-colla-item">
				        	<div class="layui-card">
								<div class="layui-card-header layui-colla-title">精彩展示</div>
								<div class="layui-card-body layui-colla-content layui-show" >
									<script id="editor" type="text/plain" ></script> 
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
								<div class="layui-card-header layui-colla-title">企业图片</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="padding-left: 3%;">
									
									<table class="layui-table" id="enterprise_imgtable">
										<colgroup>
											<col width="150px">
											<col width="200px">
											<col width="150px">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th style="text-align: center;">图片序号</th>
												<th style="text-align: center;">图片显示</th>
												<th style="text-align: center;">图片类别</th>
												<th style="text-align: center;">操作</th>
											</tr>
										</thead>
										<tbody>
										<% int count = 0; %>
										<c:forEach items="${list.swiperList }" var="s">										
											<tr>
												<td>${s.id }</td>
												<td>
													<img src="/uploadImage/${s.imgurl }">
												</td>
												<td>${s.category }</td>
												<td><button class="layui-btn" icon="../images/3.jpg" id="btn_enterpriseimgdelete" onClick="deleteRow(this)">删除</button></td>
											</tr>
										</c:forEach>
										</tbody>
										
									</table>
									
									<button type="button" class="layui-btn" id="btn_upload_enterpriseimg">选择图片</button>
									<div class="layui-inline layui-word-aux">
										文件最大限制为1M
									</div><br /><p id="demoText"></p><br />
								</div>
							</div>
				      	</div>
				      	
					  	<div class="layui-col-md12 layui-colla-item">
				        	<div class="layui-card">
								<div class="layui-card-header layui-colla-title">企业视频</div>
								<div class="layui-card-body layui-colla-content layui-show">
									<c:if test="${not empty list.videopath }">
										<video id="enterprise_video" src="/uploadVideo/${list.videopath }" style="width:500px; height:250px;" 
										controls="controls">
										</video>
									</c:if>
									<br />
									<div id="enterprise_video_show"></div>
									<button type="button" class="layui-btn" id="btn_delete_video">删除视频</button>																
									<button type="button" class="layui-btn" id="btn_upload_video">选择视频</button>
									<p id="demoText1"></p>
								</div>
							</div>
				      	</div>
			      	</div>
				  </div>
				</div>
			
					<button class="layui-btn" style="margin: 5% 0 0 45%;" id="btn_saveEnterpriseInfo" type="button">
						保存企业信息
					</button>							
			  </div>
		</div>
	
		
		<script>
			layui.use(['form', 'upload'], function() {
				var	$ = layui.jquery,
					upload = layui.upload
					layer = layui.layer;
					

				var paraString = location.search;
				//alert(paraString.substring(5,6));
				
				$("#btn_saveEnterpriseInfo").click(function(){
					
						
					//点击保存按钮讲信息提交给handler
							//获取所有信息
							var enterprise_name = $("#enterprise_name").val();
							console.log(enterprise_name);
							var enterprise_introduction = $("#enterprise_introduction").val();
							var videopath = $("#enterprise_video").attr('src');
							var jczs = UE.getEditor("editor").getContent();
							
							//alert(enterprise_name+" "+enterprise_introduction+" "+videopath);
							
							$.ajax({
								url:"Handler_updateEnterpriseInfo",
								type:"post",
								data:{
									  enterprise_name:enterprise_name,
									  enterprise_introduction:enterprise_introduction,
									  videopath:videopath,
									  jczs:jczs
									  },
								dataType:"json",
								success:function(data){
									alert(data.result);
								}
							});
							
					});
				
				$("#btn_delete_video").click(function(){
					$.ajax({
						url:"Handler_deleteEnterpriseVideoByQid",
						type:"post",
						dataType:"json",
						success:function(data){
							alert("成功删除");
							$("#enterprise_video").hide();
						}
					});
				});
				
			var uploadInst = upload.render({
					elem: '#btn_upload_enterpriseimg',
					url: 'Handler_addImgToSwiperByQid',
					size: 1024,
					multiple:true,
					before: function(obj) {
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {
							var tabrow =  '<tr><td></td><td><img src="'+result+'"/></td><td>A</td><td><button class="layui-btn" icon="../images/3.jpg" id="btn_enterpriseimgdelete" onClick="deleteRow(this)">删除</button></td></tr>';
							$("#enterprise_imgtable tbody").append(tabrow);
						});
					},
					done: function(res) {						
						layer.msg('成功上传图片啦！',{
							time:5000,
							btn:['哦']
						});
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

				
				var uploadInstVideo = upload.render({
					elem: '#btn_upload_video',
					url: 'Handler_updateEnterpriseVideo',
					size: 204800000,
					accept:'video',
					before: function(obj) {
						
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {	
							console.log(file);
							var videoshowdiv = '<video src="'+result+'" style="width:500px;height:250px;" controls="controls"></video>';
						
							$("#enterprise_video_show").html(videoshowdiv);
						});
					},
					done: function(res) {
						//如果上传失败
						if(res.code > 0) {
							return layer.msg('上传失败');
						}
																	
							layer.msg('视频上传成功！',{
								time:5000,
								btn:['哦']							
							});
					},
					error: function() {
						//演示失败状态，并实现重传
						var demoText = $('#demoText1');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function() {
							uploadInstVideo.upload();
						});
					}
				});

			});
		</script>
		
			<script>
		var id;
		function deleteRow(obj){
			var res = confirm('确定要删除该图片么？');
			if(res == true){
				alert($(obj).parents("tr").children("td").eq(0).text());
				id = $(obj).parents("tr").children("td").eq(0).text();
				$(obj).parents("tr").remove();
				$.ajax({
					url : "Handler_deleteEnterpriseImgById",
					type:"post",
					data:{
						id:id
					},
					dataType:"json",
					success:function(data){
						alert(data.result);
					}
				});
			}
		}
			
		
		</script>


	<script>
		 
	
	</script>

</body>

</html>