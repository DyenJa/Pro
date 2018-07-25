<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>企业信息页</title>
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
			#enterprie_jczs img{
				width:500px;
				height:346px;
			}
		</style>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                //obj.height = this.document.body.scrollHeight;
                obj.height = '2000px';     
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
									${list.name }
								</div>
							</div>
						</div>
						<div class="layui-col-md12 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">企业简介</div>
								<div class="layui-card-body layui-colla-content layui-show" 
									style="text-align: left;">
									${list.introduction }
								</div>
							</div>
						</div>
						<div class="layui-col-md12 layui-colla-item">
				        	<div class="layui-card">
								<div class="layui-card-header layui-colla-title">精彩展示</div>
								<div class="layui-card-body layui-colla-content layui-show">
									<div id="enterprie_jczs">${list.jczs }</div>
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
									<div class="layui-carousel carousel" id="img-carousel">
									  <div carousel-item="">
									 ·	 
									  	<c:forEach items="${list.swiperList }" var="s">
									   		<img src="/uploadImage/${s.imgurl }" style="width:500px;height:346px;">																						   		
										</c:forEach>
									 				 
									  </div>
									</div> 		
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
									<c:if test="${empty list.videopath }">
									</c:if>
								</div>
							</div>
				      	</div>
			      	</div>
				  </div>
				</div>

				<div class="layui-form-item">
					<button class="layui-btn" style="margin: 5% 0 0 45%;">
						<a href="<%=request.getContextPath()%>/BackEnd/Handler_findEnterpriseByQid?method=enterprisemodify" style="color: white;">修改企业信息</a>
					</button>
				</div>				
			  </div>

		
		</div>
		
		<script type="text/javascript" src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.js"></script>
		<script src="<%=request.getContextPath() %>/BackEnd_final/jquery-3.2.0.min.js"></script>
		
		<script>
		layui.use('carousel', function(){
		  var carousel = layui.carousel;
		  //建造实例
		  carousel.render({
		    elem: '#img-carousel'
		    ,width: '500px' //设置容器宽度
		    ,height: '346px'
		    ,arrow: 'hover' //始终显示箭头
		    ,anim: 'fade' //切换动画方式
		  });
		});
		</script>
		
		<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
		<script>
		layui.use(['element', 'layer'], function(){
		  var element = layui.element;
		  var layer = layui.layer;
		  
		  //监听折叠
		  element.on('collapse(test)', function(data){
		    layer.msg('展开状态：'+ data.show);
		  });
		});
		</script>
		
		<script>
			//JavaScript代码区域
			layui.use('element', function() {
				var element = layui.element;

			});
			layui.use('layer ', function() {
				var layer = layui.layer;
			});
		</script>
	
</body>

</html>