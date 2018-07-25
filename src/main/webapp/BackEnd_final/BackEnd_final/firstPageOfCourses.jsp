<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%>
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
					url:"<%=request.getContextPath()%>/BackEnd/course/publish",
					type:"post",
					data:formData,
					processData:false,
					contentType:false,
					dataType:"json",
					success:function(data){
						if(data.result){
							alert("发布成功");
							//jumpurl();
							//setTimeout(jumpurl,1000);
						}
						else{
							alert("发布失败,请重新发布")
						}
					}						
				});	
			})
		})
		function jumpurl(){
			window.location.href='<%=request.getContextPath()%>/BackEnd/message/messagelist';
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

	<body class="layui-layout-body" 
		style="font-family: '宋体'; background-color: #F8F8FF;" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin">
			

				<!-- 内容主体区域 -->
			  <div style="background-color: white; 
			  	margin: 0px 50px 0px 0px; background-color: #F8F8FF;">
			  	<form class="layui-form"  lay-filter="example" style="font-family: '宋体';" id="myform">
				  	<div class="layui-col-md12">
				      <div class="layui-row">
				      	<div class="layui-collapse">
					      	<div class="layui-col-md12 layui-colla-item">
					        	<div class="layui-card">
									<div class="layui-card-header layui-colla-title">图片</div>
									<div class="layui-card-body layui-colla-content layui-show" 
										style="padding-left: 3%;">
									  <div class="layui-upload" style="text-align: left;">
										<button type="button" class="layui-btn" id="upload" onclick="uploadImg();" >选择多张图片</button>
										<input accept="image/*" type="file" multiple="multiple" hidden="hidden" id="file" name="upload"  />
										<blockquote class="layui-elem-quote layui-quote-nm" 
											style="margin-top: 10px; height: 250px;">
											预览图：											
											<div class="layui-col-md12  layui-col-space30" style="padding-left: 20px;">
												<div class="layui-col-md3">
													<img id="img0" src="../images/white.PNG"  style="width: 200px;height: 200px;"><!--src="../images/4.png"-->
												</div>
												<div class="layui-col-md3">
													<img id="img1" src="../images/white.PNG"   style="width: 200px;height: 200px;">
												</div>
												<div class="layui-col-md3">
													<img id="img2" src="../images/white.PNG"   style="width: 200px;height: 200px;">
												</div>
												<div class="layui-col-md3">
													<img id="img3" src="../images/white.PNG"   style="width: 200px;height: 200px;">
												</div>
											  </div>									
										</blockquote>
									  </div>
									</div>
								</div>
					      	</div>
				      	</div>
					  </div>
					</div>				  	
					  	<div class="layui-form-item">
							<button class="layui-btn" type="button" id="btn_submit" style="margin: 5% 0 0 45%;">发表</button>
						</div>	
					  </div>
					</div>	
				</form>
			  </div>
		</div>
		 
		<script type="text/javascript" src="${path}/layui/layui.js"></script>
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