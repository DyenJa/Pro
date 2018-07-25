<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%> 

<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程信息</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		 <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.js"></script>
		<link rel="stylesheet" href="${path}BackEnd_final/layui/css/layui.css">
		<style>
			.layui-card {margin: 35px 45px 45px 0; border-radius: 10px; text-align: center;}
			.layui-card-header {
				font-size: 25px; 
				font-weight: 600;
				background-color: antiquewhite; 
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
				text-align: left;
			}
			.layui-icon {font-size: 21px;}
			.thead {font-weight: 600; font-size: 18px;}
  			.layui-card-body {margin-top: 2%; padding: 0px 40px 10px 40px;}
		    #a_courseAdd {text-decoration: none;font-size: 17px; color: #808080;}
		    #selectStyle {display: inline-block; margin-left: 20px; font-size: 16px; font-weight: 500;}
		    td {text-align: center;}
			img {width: 80px; height: 80px;}
			button {border: none; background-color: transparent;}
			body {font-family: "宋体"; background-color: #F8F8FF;}
  		</style>
		<script type="text/javascript">
            function IFrameResize()
            {
                    //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                obj.height = "2000px";
            } 
        
        </script>
	</head>

	<body class="layui-layout-body" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin" style="margin: 0px 50px 0px 0px;">
			<!-- 内容主体区域 -->
			<div class="layui-card">
				<div class="layui-card-header">
					<span>课程信息表</span>
					<div id="selectStyle">
						<select id="branch" name="branch"  >    
						   	<c:forEach items="${requestScope.branches }" var="b">
						   				<c:if test="${current_branch==b.aid}" >
						   					<option value="${b.aid }" selected="selected">${b.branch }</option>
						   				</c:if>
										<c:if test="${current_branch!=b.aid}">
						   					<option value="${b.aid }">${b.branch }</option>
						   				</c:if>
							</c:forEach>

					    </select>
				    </div>
					<span style="float: right;">
						<a href="<%=request.getContextPath()%>/BackEnd_final/BackEnd_final/courseAdd.jsp" id="a_courseAdd">
							<i class="layui-icon layui-icon-add-1"></i>添加课程
						</a>
					</span>
				</div>
				<div class="layui-card-body">
					<table style="border-collapse: separate; width: 100%; border-spacing: 10px 20px;">
						<thead>
							<tr>
						        <th class="td1" width="10%">课程编号</th>
						        <th class="td1" width="25%">课程名称</th>
						        <th class="td1" width="20%">课程图片</th>
						        <th class="td2" width="12%">课程价钱</th>                       
						        <th class="td1" width="15%">课程类别</th>
						        <th>操作</th>
						    </tr> 
						</thead>
						<tbody style="font-size: 15px;" id="courseinfo">
							<c:forEach items="${lessons }" var="c">
								<tr>
							      <td>${c.lid }</td>
							      <td>${c.lname }</td>
							      <td >    	 
							        <img src="/webapps/../upload/cover/${c.imgUrl}" id="img" />
							      </td>
							      <td>${c.lprice }</td>
								    <td>${c.category }</td>
								    <td>
									    <button onClick="viewCourseDetail(${c.lid})"><i class="layui-icon layui-icon-right"></i>&nbsp;</button>
										<button onClick="modifyCourseDetail(${c.lid})"><i class="layui-icon layui-icon-edit" ></i>&nbsp;</button>
										<button onclick="deleteRow(this)"><i class="layui-icon layui-icon-delete"></i></button>
								    </td>
							    </tr> 
						  
							</c:forEach>
						</tbody>
					</table>
					<div id="test1" style="margin-top: 40px; margin-left: 8%"></div>
				</div>
			</div>	
		</div>
	</body>
	<script src="${path}BackEnd_final/layui/layui.js"></script>
	<script>
	layui.use('laypage', function(){
		  var laypage = layui.laypage;
		  var branchid = parseInt($("#branch option:selected").val());
		  //alert(branchid+"：branchid");
		 
		  $("#branch").change(function(){
		        console.log($(this).val());//可以在这里做判断选中值
		     
		        branchid=$(this).val();
		        window.location.href="<%=request.getContextPath()%>/BackEnd/selectCourseByQid?aid="+branchid;
		       <%--  $.ajax({
		        	url:"<%=request.getContextPath()%>/BackEnd/selectCourseByPage",
		        	type:"post",
		        	data:{
		        		branchid:branchid,
	    				curr:1,
	    				limit:5
		        	},
			        dataType:"json",
	    			success:function(data){
	    				console.log(data);
	    				$("#courseinfo").empty();
	    				var trStr = '';//动态拼接table
	    				 for (var i = 0; i < data.length; i++) {//循环遍历出json对象中的每一个数据并显示在对应的td中
	    				 trStr += '<tr>';//拼接处规范的表格形式
	    				 trStr += '<td>' + data[i].lid + '</td>';//数据表的主键值
	    				 trStr += '<td>'+data[i].lname+'</td>';
	    				 trStr += '<td><img src="webapps/../upload/cover/' + data[i].imgUrl + ' "/></td>';//对应数组表的字段值
	    				 trStr += '<td>' + data[i].lprice + '</td>';
	    				 trStr += '<td>' + data[i].category + '</td>';
	    				 trStr +='<td><button onClick="viewCourseDetail('+data[i].lid+')"><i class="layui-icon layui-icon-right"></i>&nbsp;</button>';
	    				 trStr +='<button onClick="modifyCourseDetail('+data[i].lid+')"><i class="layui-icon layui-icon-edit" ></i>&nbsp;</button>';
	    				 trStr += '<button onclick="deleteRow(this)"><i class="layui-icon layui-icon-delete"></i></button>';
	    				 trStr += '</td></tr>'
	    				 } 
	    				$("#courseinfo").html(trStr);
	    			}
		        }); --%>
		    });
		  
		  //执行一个laypage实例
						  laypage.render({
						    elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
						    ,count: <%= request.getAttribute("count")%> //数据总数，从服务端得到
						    ,limit:5
						    ,jump:function(obj,first){
						    	if(!first){
						    		//alert("not first");
						    		$.ajax({
						    			url:"<%=request.getContextPath()%>/BackEnd/selectCourseByPage",
						    			type:"post",
						    			data:{
						    				branchid:parseInt($("#branch option:selected").val()),
						    				curr:obj.curr,
						    				limit:5
						    			},
						    			dataType:"json",
						    			success:function(data){
						    				console.log(data);
						    				$("#courseinfo").empty();
						    				var trStr = '';//动态拼接table
						    				 for (var i = 0; i < data.length; i++) {//循环遍历出json对象中的每一个数据并显示在对应的td中
						    				 trStr += '<tr>';//拼接处规范的表格形式
						    				 trStr += '<td>' + data[i].lid + '</td>';//数据表的主键值
						    				 trStr += '<td>'+data[i].lname+'</td>';
						    				 trStr += '<td><img src="/webapps/../upload/cover/' + data[i].imgUrl + ' "/></td>';//对应数组表的字段值
						    				 trStr += '<td>' + data[i].lprice + '</td>';
						    				 trStr += '<td>' + data[i].category + '</td>';
						    				
						    				 trStr +='<td><button onClick="viewCourseDetail('+data[i].lid+')"><i class="layui-icon layui-icon-right"></i>&nbsp;</button>';
						    				 trStr +='<button onClick="modifyCourseDetail('+data[i].lid+')"><i class="layui-icon layui-icon-edit" ></i>&nbsp;</button>';
						    				 trStr += '<button onclick="deleteRow(this)"><i class="layui-icon layui-icon-delete"></i></button>';
						    				 trStr += '</td></tr>'
						    				 } 
						    				$("#courseinfo").html(trStr);
						    			}
						    		});
						    	}
									
						    }
						  });
		});
	</script>

	<script>
		var lid;
	function deleteRow(obj){
		var res = confirm("确定要删除该课程信息吗？");
		if(res == true){
			lid = $(obj).parents("tr").children("td").eq(0).text();
			$(obj).parents("tr").remove();
			$.ajax({
				url: "<%= request.getContextPath()%>/BackEnd/deleteCourseByLid",
				type:"post",
				data:{
					lid:lid,
				},
				dataType:"json",
				success:function(data){
					alert(data.result);
				}
			});
		}
	}	
	
	function viewCourseDetail(obj){
		//alert(obj);
	
		window.location.href="<%= request.getContextPath()%>/BackEnd/detail/lesson?lid="+obj;
	}
	
	function modifyCourseDetail(obj){
	
		window.location.href="<%= request.getContextPath()%>/BackEnd/edit?lid="+obj;
	}
	</script>
</html>