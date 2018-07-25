<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>数据统计页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../layui/css/layui.css">
		<link rel="stylesheet" href="../assets/css/amazeui.min.css" />
	    <link rel="stylesheet" href="../assets/css/admin.css">
	    <link rel="stylesheet" href="../assets/css/app.css">
	    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.js"></script>
		<style>
			.layui-card {
				margin: 35px 45px 45px 0; 
				
				border-radius: 10px; 
				padding: 20px 10px;
			}

			body {font-family: '宋体'; background-color: #F8F8FF; height: 1050px;}
		</style>
		<script>
			$(function(){
				$.ajax({
					url:'<%=request.getContextPath()%>/BackEnd/index/getSixStatics',
					success:function(data){
						console.log(data);
						$(".number")[0].append(data.userNumbers);
						$(".number")[1].append(data.todayReserv);
						$(".number")[2].append(data.todayOrder);
						$(".number")[3].append(data.todayGood);
						$(".number")[4].append(data.monthProfit);
						$(".number")[5].append(data.monthMessage);
					}
				})
			})
		
		</script>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                obj.height = this.document.body.scrollHeight;
                    
            } 
        </script>
	</head>

	<body class="layui-layout-body" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin" style="margin: 0px 50px 0px 0px;">
			<div class="layui-col-md12">
				<div class="layui-col-md12">
					<div class="layui-card">

						<div class="layui-card" style="width: 100%;">
				            <div class="row">
				                <div class="am-u-lg-4 am-u-md-6 am-u-sm-12">
				                    <div class="dashboard-stat green">
				                        <div class="visual">
				                            <i class="am-icon-user"></i>
				                        </div>
				                        <div class="details">
				                            <div class="number"> </div>
				                            <div class="desc"> 用户总数 </div>
				                        </div>
				                        <div class="more" href="#"> &nbsp;</div>
				                    </div>
				                </div>
				                <div class="am-u-lg-4 am-u-md-6 am-u-sm-12">
				                    <div class="dashboard-stat red">
				                        <div class="visual">
				                            <i class="am-icon-shopping-basket"></i>
				                        </div>
				                        <div class="details">
				                            <div class="number">  </div>
				                            <div class="desc"> 今日预约数 </div>
				                        </div>
				                        <div class="more" href="#"> &nbsp;</div>
				                    </div>
				                </div>
				                <div class="am-u-lg-4 am-u-md-6 am-u-sm-12">
				                    <div class="dashboard-stat blue">
				                        <div class="visual">
				                            <i class="am-icon-shopping-bag"></i>
				                        </div>
				                        <div class="details">
				                            <div class="number">  </div>
				                            <div class="desc"> 今日订单数 </div>
				                        </div>
				                        <div class="more" href="#"> &nbsp;</div>
				                    </div>
				                </div>
				                <div class="am-u-lg-4 am-u-md-6 am-u-sm-12">
				                    <div class="dashboard-stat red">
				                        <div class="visual">
				                            <i class="am-icon-wechat"></i>
				                        </div>
				                        <div class="details">
				                            <div class="number">  </div>
				                            <div class="desc"> 今日获赞数 </div>
				                        </div>
				                        <div class="more" href="#"> &nbsp;</div>
				                    </div>
				                </div>
				                
				                <div class="am-u-lg-4 am-u-md-6 am-u-sm-12">
				                    <div class="dashboard-stat blue">
				                        <div class="visual">
				                            <i class="am-icon-money"></i>
				                        </div>
				                        <div class="details">
				                            <div class="number">  </div>
				                            <div class="desc"> 本月流水 </div>
				                        </div>
				                        <div class="more" href="#"> &nbsp;</div>
				                    </div>
				                </div>
				                <div class="am-u-lg-4 am-u-md-6 am-u-sm-12">
				                    <div class="dashboard-stat green">
				                        <div class="visual">
				                            <i class="am-icon-pencil"></i>
				                        </div>
				                        <div class="details">
				                            <div class="number"> </div>
				                            <div class="desc"> 本月朋友圈条数 </div>
				                        </div>
				                        <div class="more" href="#"> &nbsp;</div>
				                    </div>
				                </div>
				            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

