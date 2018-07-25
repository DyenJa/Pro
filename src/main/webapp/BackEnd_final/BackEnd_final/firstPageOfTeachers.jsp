<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>教师添加页</title>
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
			body {font-family: '宋体'; background-color: #F8F8FF;}
			#demo1 {width: 100%; height: 450px; margin-bottom: 3%;}
			#demo {width: 100%; height: 450px; margin-bottom: 3%;}
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

	<body class="layui-layout-body" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin" style="margin: 0px 50px 0px 0px;">
			<div class="layui-col-md12">
				<div class="layui-row">
					<div class="layui-collapse">
						<div class="layui-col-md12 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">师资首页图片</div>
									<div class="layui-card-body layui-colla-content layui-show" style="padding-left: %;">
										<div class="layui-upload-list">
											<c:if test="${not empty img.id }">
												<img class="layui-upload-img" id="demo1" src="/uploadImage/${img.img }">
											</c:if>
											<c:if test="${empty img.id }">
												<img class="layui-upload-img" id="demo1">
											</c:if>
										</div>
										<button type="button" class="layui-btn" id="test1">选择图片</button>
										<div class="layui-inline layui-word-aux">
											文件最大限制为1M
										</div>
										
											<button class="layui-btn" type="button" id="deleteFirstPagePhoto">
												删除该图片
											</button>
										
											<button class="layui-btn" type="button" id="saveFirstPagePhoto">
												保存图片信息
											</button>
										
									</div>
							  <p id="demoText"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		 
		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.js"></script>
		<script>
		//JavaScript代码区域
		layui.use('layer ', function(){
			var layer = layui.layer ;
		});
		layui.use('element', function(){
		  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
		});
		</script>
		<script>
		layui.use('upload', function(){
		    var $ = layui.jquery
		    ,upload = layui.upload;
	   
			var uploadInst = upload.render({
		     elem: '#test1'
		    ,size:1024
		    ,url: '<%= request.getContextPath()%>/BackEnd/Handler_uploadFirstPageOfTeachers'
		    ,data:{
		    	qid:<%= request.getParameter("qid")%>
		    }
		    ,auto:false
		    ,bindAction:"#saveFirstPagePhoto"
		    ,choose: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#demo1').attr('src', result); //图片链接（base64）
		       
		      });
		    }
		    ,done: function(res){
		      //如果上传失败
		      if(res.code > 0){
		        return layer.msg('上传失败');
		      }
	
		      alert("保存成功");
		      //上传成功
		    }
		    ,error: function(){
		      //演示失败状态，并实现重传
		      var demoText = $('#demoText');
		      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
		      demoText.find('.demo-reload').on('click', function(){
		        uploadInst.upload();
		      });
		    }
	 		});
 		});
		</script>
		<script src="<%=request.getContextPath() %>/BackEnd_final/jquery-3.2.0.min.js"></script>
		<script>
		$("#deleteFirstPagePhoto").click(function(){
			var res = confirm("确定要删除该图片吗？");
			if(res == true){
				$.ajax({
					url:"<%= request.getContextPath()%>/BackEnd/Handler_deleteFirstPageOfTeachers",
					type:"post",
					data:{
						qid:<%=request.getParameter("qid")%>					
					},
					dataType:"json",
					success:function(data){
						alert(data.result);
						//$("#demo1").hide();
					}
				});
			}
			
		});
		</script>
	</body>
</html>