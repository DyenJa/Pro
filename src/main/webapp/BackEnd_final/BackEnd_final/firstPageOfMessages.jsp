
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>朋友圈发布页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#btn_submit").click(function(){
				var imgs = document.getElementById("file");
				var list = imgs.files;
				if(list.length==0){
					alert("至少选择一张图片");
					return;
				}
				var formData = new FormData(document.getElementById("myform"));		
			 	$.ajax({
					url:"<%=request.getContextPath()%>/message/publish",
					type:"post",
					data:formData,
					processData:false,
					contentType:false,
					dataType:"json",
					success:function(data){
						if(data.result){
							alert("发布成功");
							jumpurl();
							setTimeout(jumpurl,1000);
						}
						else{
							alert("发布失败,请重新发布")
						}
					}						
				});	
			})
		})
		function jumpurl(){
			window.location.href='<%=request.getContextPath()%>/message/messagelist';
		}
		
</script>
<link rel="stylesheet" href="../layui/css/layui.css">
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
       	
	</head>

	<body class="layui-layout-body" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin" style="margin: 0px 50px 0px 0px;">
			<div class="layui-col-md12">
				<div class="layui-row">
					<div class="layui-collapse">
						<div class="layui-col-md12 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">朋友圈首页图片</div>
								<form class="layui-form" lay-filter="example">
									<div class="layui-card-body layui-colla-content layui-show" style="padding-left: %;">
										<div class="layui-upload-list">
											<img class="layui-upload-img" id="demo1">
										</div>
										<button type="button" class="layui-btn" id="test1">选择图片</button>
										<!-- <div class="layui-inline layui-word-aux">
											文件最大限制为1M
										</div> -->
										
										<div class="layui-form-item" style="float: right; margin-right: 25%;">
											<button class="layui-btn" type="submit">
												<a href="enterpriseModify.jsp" style="color: white;">保存照片</a>
											</button>
										</div>
									</div>
								</form>
							  <p id="demoText"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		 
		<script type="text/javascript" src="../layui/layui.js"></script>
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
			function uploadImg(){
					var ie=navigator.appName=="Microsoft Internet Explorer" ? true : false; 
					if(ie){ 
					document.getElementById("file").click(); 
					}else{
					var a=document.createEvent("MouseEvents");//FF的处理 
					a.initEvent("click", true, true);  
					document.getElementById("file").dispatchEvent(a); 
					} 
		}
		</script>
		<script>  
			    var imgs = document.getElementById("file");
			    imgs.addEventListener("change", upload, false);  
			    function upload(){  
		        var list = this.files;  
				if(list.length <= 4){
					for(var i=0;i<4;i++){
						var img = "img"+i;
						document.getElementById(img).src="../images/white.PNG"
					}
					for(var i=0;i<list.length;i++){
						
						var file = list[i];
						getImg(i,file);
					}
				}
				else{
					alert("上传图片不应多余4张");
				}
				
		 		}
			function getImg(i,f){				
				var imgs = document.getElementById("file");
				var oFReader = new FileReader();
				oFReader.readAsDataURL(f);
				oFReader.onload = function(oFRevent){
							var src = oFRevent.target.result;
							var img = "img"+i;
							document.getElementById(img).src = src;
						}
			}
		</script>
	</body>
</html>
