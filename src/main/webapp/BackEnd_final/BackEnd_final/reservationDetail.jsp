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
		<title>预约课程详情页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${path}BackEnd_final/layui/css/layui.css">
	    <script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/ueditor.all.min.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.js"></script>
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
		<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
		<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
		<script src="${path}BackEnd/layui/layui.js" charset="utf-8"></script>
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
                obj.height = this.document.body.scrollHeight;
                    
                    //alert("开始设置地址");
                document.getElementById("jump").setAttribute("href","../editfree?id="+request.getAttribute("id"));
            } 
    
            function editlesson(){
          	//alert(getUrlParam("id"));
            	window.location.href="<%=request.getContextPath()%>/BackEnd/editfree?id="+getUrlParam("id");
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
			
				<div class="layui-collapse">
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">预约课程编号</div>
							<div class="layui-card-body layui-colla-content layui-show" >
								<%=request.getAttribute("id") %>
							</div>
						</div>
					</div>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">预约课程名称</div>
							<div class="layui-card-body layui-colla-content layui-show" 	>
								<%=request.getAttribute("title") %>
							</div>
						</div>
					</div>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">预约课程状态</div>
							<div class="layui-card-body layui-colla-content layui-show">
								<%=request.getAttribute("status") %>
							</div>
						</div>
					</div>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">开设分部</div>
							<div class="layui-card-body layui-colla-content layui-show">
								<%=request.getAttribute("branchName") %>
							</div>
						</div>
					</div>
				
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">课程图片</div>
							<div class="layui-card-body layui-colla-content layui-show" style="padding-left: 3%;">
								<img id="cover"  style="width:200px;height:auto" src="/webapps/../upload/cover/<%=request.getAttribute("cover") %>"/>
							</div>
						</div>
					</div>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">课程描述</div>
							<div class="layui-card-body layui-colla-content layui-show">
								<%out.println(request.getAttribute("fdesc")) ;%>
							</div>
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
	</body>
</html>