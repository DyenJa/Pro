<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>教师信息修改页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/BackEnd_final/layui/css/layui.css">
		
		<style>
			.layui-card {margin: 35px 45px 45px 0; text-align: center; border-radius: 10px;}
			.layui-card-header {
				font-size: large; 
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
			}
			#allmap {width: 100%;height: 400px;margin:0;font-family:"微软雅黑"}
			
		</style>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                var height = getComputedStyle(window.parent.document.getElementsByClassName("layui-body")[0],null).height;
                console.log(height); 
                obj.height = height;
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
									<div class="layui-card-header layui-colla-title">教师图片</div>
									<div class="layui-card-body layui-colla-content layui-show" 
										style="padding-left: 3%;">
									  
										<img src="/uploadImage/${teacher.tphoto }" name="teacher_img" class="layui-upload-img" 
											id="demo1" style="width: 100%;"><br /><br />
										<button type="button" class="layui-btn" id="btn_delete">
											删除图片</button>
										<button type="button" class="layui-btn" id="btn_upload">
											上传图片</button>
										<div class="layui-inline layui-word-aux">
											文件最大限制为1M
										</div><br /><br />
										<p id="demoText"></p>
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
									<div class="layui-card-header layui-colla-title">教师姓名</div>
									<div class="layui-card-body layui-colla-content layui-show" 
										style="height: 50px; line-height: 50px;">
										<input id="teacher_name" type="text" class="layui-input" value="${teacher.tname }"/>
									</div>
								</div>
							</div>
							<div class="layui-col-md12 layui-colla-item">
								<div class="layui-card">
									<div class="layui-card-header layui-colla-title">教师简介</div>
									<div class="layui-card-body layui-colla-content layui-show" 
										style="text-align: left;">
										<textarea id="teacher_intro" class="layui-textarea" 
											style="overflow-x: hidden;">${teacher.introduction }</textarea>
									</div>
								</div>
							</div>
					  	</div>
					 
							<button type="submit" class="layui-btn" style="margin: 25% 0 0 36%;" id="saveteacherinfo">
								保存教师信息
							</button>
						
					  </div>
					</div>	
			  </div>
		</div>
		 
		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.js"></script>
		<script>
		//JavaScript代码区域
		
		layui.use('element', function(){
		  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
		});
		</script>
		<script>
			layui.use('upload', function() {
				var $ = layui.jquery,
					upload = layui.upload;

		
				$("#btn_delete").click(function(){
					$.ajax({
						url:"Handler_deleteTeacherPhotoByQidTId",
						type:"post",
						data:{
							qid:<%=request.getParameter("qid")%>,
							tid:<%=request.getParameter("tid")%>
						},
						dataType:"json",
						success:function(data){
							alert(data.result);
							$("#demo1").attr('src','');
						}
					});
				});
				
				
				upload.render({
					elem: '#btn_upload',
					url: 'Handler_updateTeacherPhotoByQidTid',
					size: 1024,
					auto:false,
					bindAction:"#saveteacherinfo",
					data:{
						qid:<%=request.getParameter("qid")%>,
						tid:<%=request.getParameter("tid")%>
					},
					choose: function(obj) {
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {
							$('#demo1').attr('src', result); //图片链接（base64）

						});
					},
					done: function(res) {
						//如果上传失败
						if(res.code > 0) {
							return layer.msg('上传失败');
						}
						alert("成功修改信息");				
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
			});
		</script>
		<script src="<%=request.getContextPath() %>/BackEnd_final/jquery-3.2.0.min.js"></script>
		<script>
		$("#saveteacherinfo").click(function(){
			var tname = $("#teacher_name").val();
			var introduction = $("#teacher_intro").val();
			
			$.ajax({
				url:"Handler_updateTeacherInfoByQidTid",
				type:"post",
				data:{
					qid:<%=request.getParameter("qid")%>,
					tid:<%=request.getParameter("tid")%>,
					tname:tname,
					introduction:introduction
				},
				dataType:"json",
				success:function(data){
					alert(data.result);
				}

			});
			
		});
		</script>
	</body>
</html>