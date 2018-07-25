<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>师资力量</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/BackEnd_final/layui/css/layui.css">
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
			.layui-icon {font-size: 25px;}
			.thead {font-weight: 600; font-size: 18px;}
  			
		  	.te {
		        margin-left: 30px;
		        resize: none;
		        background-color: white;
		        border: none;
		        margin-top: 5px;
		    }
		    #a_teacherAdd {text-decoration: none;font-size: 17px; color: #808080;}
		    td {text-align: center;}
			img {width: 90px; height: 90px;}
			button {border: none; background-color: transparent;}
			body {font-family: "宋体"; background-color: #F8F8FF;}
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
			<!-- 内容主体区域 -->
			<div class="layui-card">
				<div class="layui-card-header">
					<span>讲师信息表</span>
					<span style="float: right;">
						<a href="<%=request.getContextPath() %>/BackEnd_final/BackEnd_final/teacherAdd.jsp?qid=<%=request.getParameter("qid") %>" id="a_teacherAdd">
							<i class="layui-icon layui-icon-add-1"></i>添加教师
						</a>
					</span>
				</div>
				<div class="layui-card-body" style="margin-top: 2%;">
					<table style="border-collapse: separate; width: 100%; border-spacing: 10px 20px;">
						<thead>
							<tr>
								<th width="0px"></th>
								<th width="17%">讲师姓名</th>
								<th width="15%">讲师图片</th>
								<th width="53%">讲师简介</th>
								<th width="">操作</th>
							</tr>
						</thead>
						<tbody style="font-size: 13px;" id="teacherinfo">
						<c:forEach items="${teachers }" var="t">
							<tr>
								<td style="color:white; width:0px;">${t.tid }</td>						
								<td>${t.tname }</td>
								<td><img src="/uploadImage/${t.tphoto }" id="img" /></td>
								<td>
									<textarea class="te" rows="5" cols="60" readonly>${t.introduction }
								    </textarea>
								</td>
								<td>
									<button onClick="callFunction(${t.tid})"><i class="layui-icon layui-icon-edit" ></i>&emsp;</button>
									<button onClick="deleteRow(this)"><i class="layui-icon layui-icon-delete"></i></button>
									
								</td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
					<div id="test1" style="margin-top: 40px; margin-left: 8%;"></div>
				</div>
			</div>	
		</div>
	</body>
	<script src="<%=request.getContextPath() %>/BackEnd_final/layui/layui.js"></script>
	<script src="<%=request.getContextPath() %>/BackEnd_final/jquery-3.2.0.min.js"></script>			
	<script>
	layui.use('laypage', function(){
	  var laypage = layui.laypage;
	  
	  //执行一个laypage实例
	  laypage.render({
	    elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
	    ,count: <%= request.getAttribute("count")%> //数据总数，从服务端得到
	    ,limit:3
	    ,jump:function(obj,first){
	    	if(!first){
	    		//alert("not first");
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/BackEnd/Handler_selectTeachersByPage",
	    			type:"post",
	    			data:{
	    				qid:<%= request.getParameter("qid")%>,
	    				curr:obj.curr,
	    				limit:obj.limit
	    			},
	    			dataType:"json",
	    			success:function(data){
	    				console.log(data);
	    				$("#teacherinfo").empty();
	    				var trStr = '';//动态拼接table
	    				 for (var i = 0; i < data.length; i++) {//循环遍历出json对象中的每一个数据并显示在对应的td中
	    				 trStr += '<tr>';//拼接处规范的表格形式
	    				 trStr += '<td style="color:white; width:0px;">' + data[i].tid + '</td>';//数据表的主键值
	    				 trStr += '<td>'+data[i].tname+'</td>';
	    				 trStr += '<td><img src="/uploadImage/' + data[i].tphoto + ' "/></td>';//对应数组表的字段值
	    				 trStr += '<td><textarea class="te" rows="5" cols="60" readonly>' + data[i].introduction + '</textarea></td>';
	    				 trStr +='<td><button onClick="callFunction('+data[i].tid+')"><i class="layui-icon layui-icon-edit" ></i>&emsp;</button><button onClick="deleteRow(this)"><i class="layui-icon layui-icon-delete"></i></button></td>';
	    				 trStr += '</tr>'
	    				 } 
	    				$("#teacherinfo").html(trStr);
	    			}
	    		});
	    	}
				
	    }
	  });
	});
	</script>
	
	<script>
	
	var tid;
	function deleteRow(obj){
		var res = confirm("确定要删除该教师信息吗？");
		if(res == true){
			tid = $(obj).parents("tr").children("td").eq(0).text();
			$(obj).parents("tr").remove();
			$.ajax({
				url: "<%= request.getContextPath()%>/BackEnd/Handler_deleteTeacherByQidTid",
				type:"post",
				data:{
					tid:tid,
					qid:<%= request.getParameter("qid")%>
				},
				dataType:"json",
				success:function(data){
					alert(data.result);
				}
			});
		}
	}	
	
	function callFunction(obj){
		var tid = parseInt(obj);
		window.location.href="<%= request.getContextPath()%>/BackEnd/Handler_selectSingleTeacherByQidId?qid=<%= request.getParameter("qid")%>&tid="+tid;
	}
</script>								
</html>