<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>企业信息页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../layui/css/layui.css">
		<style>
			.layui-card-header {
				font-size: large; 
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
			}
			iframe {border: none; margin: 0 0 0 8%; width: 92%;}
		</style>
</head>	
	<body class="layui-layout-body" style="font-family: '宋体'; background-color: #F8F8FF;">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class="layui-logo" style="font-size: 25px; color: white; left: 15%;"></div>
				<!-- 头部区域（可配合layui已有的水平导航） -->
				
				<ul class="layui-nav layui-layout-right">
			      <li class="layui-nav-item">
			        <a href="javascript:;">
			          <img src="../images/yuantiao.jpg" class="layui-nav-img">
			          贤心
			        </a>
			        <dl class="layui-nav-child">
			          <dd><a href="login.jsp">退出登录</a></dd>
			        </dl>
			      </li>
			    </ul>
			</div>

			<div class="layui-side-scroll" style="background-color: white; margin-top: 25px;">
		      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			  <ul class="layui-nav layui-nav-tree layui-inline" lay-shrink="all"
				lay-filter="demo" style="margin: 0px 0px 0px 20px; border-radius: 10px;">
				  <li class="layui-nav-item">
					<a href="javascript:;">企业管理</a>
					<dl class="layui-nav-child">
					  <dd>
						<a href="summary.jsp" target="myFrame">&nbsp;后台统计</a>
					  </dd>
					  <dd>
						<a href="<%=request.getContextPath()%>/BackEnd/Handler_findEnterpriseByQid?qid=1&method=enterprise" target="myFrame">&nbsp;企业基本信息</a>
					  </dd>
					  <dd>
						<a href="<%=request.getContextPath()%>/BackEnd/Handler_selectAddressByQid"  target="myFrame">&nbsp;企业分部信息</a>
					  </dd>
					</dl>  
				  </li>
				  <li class="layui-nav-item">
					<a href="javascript:;">师资管理</a>
					<dl class="layui-nav-child">
					  <dd>
						<a href="<%=request.getContextPath()%>/BackEnd/Handler_selectTeacherByQid?curr=1&limit=3"  target="myFrame">&nbsp;师资力量</a>
					  </dd>
					  <dd>
						<a href="<%= request.getContextPath() %>/BackEnd/Handler_selectFirstPageOfTeachers?qid=<%= request.getParameter("qid") %>" target="myFrame">&nbsp;师资首页图片</a>
					  </dd>
					</dl>
				  </li>
				  <li class="layui-nav-item">
					<a href="javascript:;">课程管理</a>
					<dl class="layui-nav-child">
					  <dd>
						<a href="<%=request.getContextPath() %>/BackEnd/selectCourseByQid?aid=0"  target="myFrame">&nbsp;课程信息管理</a>
					  </dd>
					  <dd>
						<a href="firstPageOfCourses.jsp" target="myFrame">&nbsp;课程首页图片</a>
					  </dd>
					</dl>
				  </li>
				  <li class="layui-nav-item">
					<a href="javascript:;">预约管理</a>
					<dl class="layui-nav-child">
					  <dd>
						<a href="<%=request.getContextPath() %>/BackEnd/selectFreeListenByQid?aid=0" target="myFrame">&nbsp;预约课程查询</a>
					  </dd>
					  <dd>					  
					  <a href="reservationDeal3.jsp" target="myFrame">&nbsp;预约课程处理</a>
					  </dd>
					</dl>
				  </li>
				  <li class="layui-nav-item">
					<a href="javascript:;">订单管理</a>
					<dl class="layui-nav-child">
					  <dd>
						<a href="orderSearch.jsp" target="myFrame">&nbsp;订单查询</a>
					  </dd>
					  <dd>
						<a href="orderRefund.jsp" target="myFrame">&nbsp;退款处理</a>
					  </dd>
					  <dd>
						<a href="orderCheck.jsp" target="myFrame">&nbsp;订单核销</a>
					  </dd>
					</dl>
				  </li>
				  <li class="layui-nav-item">
					<a href="javascript:;">朋友圈管理</a>
					<dl class="layui-nav-child">
					  <dd>
						<a href="messageAdd.jsp" target="myFrame">&nbsp;发布消息</a>
					  </dd>
					  <dd>
						<a href="<%=request.getContextPath()%>/BackEnd/message/messagelist"  target="myFrame">&nbsp;消息列表</a>
					  </dd>
					 <!--  <dd>
						<a href="firstPageOfMessages.jsp" target="myFrame">&nbsp;朋友圈首页图片</a>
					  </dd> -->
					</dl>
				  </li>
				</ul>
			</div>

			<div class="layui-body">
				<!-- 内容主体区域 -->
			  <iframe id="myFrame" name="myFrame" src="summary.jsp"></iframe>
			</div>
		</div>
		
		<script type="text/javascript" src="../layui/layui.js"></script>
		<script>
			//JavaScript代码区域
			layui.use('element', function() {
				var element = layui.element;

			});
			layui.use('layer ', function() {
				var layer = layui.layer;
			});
		</script>
		<script src="<%=request.getContextPath() %>/BackEnd_final/jquery-3.2.0.min.js"></script>
	</body>
</html>