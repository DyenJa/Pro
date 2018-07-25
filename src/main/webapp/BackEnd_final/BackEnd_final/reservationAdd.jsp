<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加预约课程页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${path}BackEnd_final/layui/css/layui.css">
	    <script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/ueditor.all.min.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.0.js"></script>
		<script type="text/javascript" charset="utf-8" src="${path}BackEnd_final/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
		<script src="${path}BackEnd_final/layui/layui.js" charset="utf-8"></script>
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
                  <%--   //得到父页面的iframe框架的对象
                var obj = parent.document.getElementById("myFrame");
                    //把当前页面内容的高度动态赋给iframe框架的高
                obj.height = this.document.body.scrollHeight;
            	
                    
                    //看看这是修改还是上传
                var fdesc = '<%=request.getAttribute("fdesc")%>';
        		
    			if(fdesc!="null"){
    				UE.getEditor('editor').setContent(fdesc);
    			}
    			
    			var ue = UE.getEditor('editor');
             
                ue.addListener("contentChange",function(){
                	refreshHeight();
                });
                ue.addListener("blur",function(){
                	refreshHeight();
                });
                ue.addListener("change",function(){
                	refreshHeight();
                });
              
                window.addEventListener('DOMMouseScroll',refreshHeight(),false);
                window.addEventListener('onMouseWheel',refreshHeight(),false);
              --%>
            //得到父页面的iframe框架的对象
              var obj = parent.document.getElementById("myFrame");
                  //把当前页面内容的高度动态赋给iframe框架的高
              obj.height = this.document.body.scrollHeight*1.5;
          	
                  
                  //看看这是修改还是上传
              var fdesc = '<%=request.getAttribute("fdesc")%>';
      		
  			if(fdesc!="null"){
  				UE.getEditor('editor').setContent(fdesc);
  			}
  			
  	
           
            }
        
            function refreshHeight(){
            	var obj = parent.document.getElementById("myFrame");
                //把当前页面内容的高度动态赋给iframe框架的高
            	obj.height = this.document.body.scrollHeight;
            }
        </script>
	</head>

	<body class="layui-layout-body" style="font-family: '宋体'; background-color: #F8F8FF;" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin">
				<!-- 内容主体区域 -->
		  <div style="background-color: white; margin: 0px 50px 0px 0px; background-color: #F8F8FF;">
			<form class="layui-form" action="<%=request.getContextPath() %>/BackEnd/upload/freelisten" method="post" id="upload_freelisten" >
				<div class="layui-collapse">
					<c:if test="${id!=null}">
						<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
							<div class="layui-card">
								<div class="layui-card-header layui-colla-title">预约课程编号</div>
								<div class="layui-card-body layui-colla-content layui-show" style="height: 50px; line-height: 50px;">
									<input class="layui-input" readonly="true" type="text"  name="f_id"  value="${id}"/>
								</div>
							</div>
						</div>
					</c:if>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">预约课程名称</div>
							<div class="layui-card-body layui-colla-content layui-show" style="height: 50px; line-height: 50px;">
								<c:if test="${title!=null}">
									<input type="text" id="f_title" name="f_title" class="layui-input" placeholder="请输入课程的名称" value=${title} width="200px" />
								</c:if>
								<c:if test="${title==null}">
									<input type="text" id="f_title" name="f_title" class="layui-input" placeholder="请输入课程的名称" width="200px" />
								</c:if>
							</div>
						</div>
					</div>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">预约课程状态</div>
							<div class="layui-card-body layui-colla-content layui-show" style="text-align: left;">
								<div class="layui-form-item">
									<select id="classification" name="f_status">
										<c:if test="${status==null}">
											<option id="on" value="进行中">进行中</option>
											<option id="not_started" value="未开始">未开始</option>
											<option id="finished" value="已结束">已结束</option>
										</c:if>
											<c:if test="${status=='进行中'}">
											<option id="on" value="进行中" selected=true>进行中</option>
											<option id="not_started" value="未开始">未开始</option>
											<option id="finished" value="已结束">已结束</option>
										</c:if>
											<c:if test="${status=='未开始'}">
											<option id="on" value="进行中">进行中</option>
											<option id="not_started" value="未开始" selected=true>未开始</option>
											<option id="finished" value="已结束" >已结束</option>
										</c:if>
											<c:if test="${status=='已结束'}">
											<option id="on" value="进行中">进行中</option>
											<option id="not_started" value="未开始">未开始</option>
											<option id="finished" value="已结束" selected=true>已结束</option>
										</c:if>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">开设分部</div>
							<div class="layui-card-body layui-colla-content layui-show">
								<div class="layui-form-item">
									<c:if test="${branches==null}">
										<c:redirect url="/BackEnd/initBranchFree" />
									</c:if>
									<c:forEach items="${requestScope.branches }" var="b">
										<c:if test="${branch!=null}">
											<c:if test="${branch!=b.radioID}">
												<input type="radio" name="sub" value="${b.branchname}" id="${b.radioID}" title="${b.branchname}" />
											</c:if>
											<c:if test="${branch==b.radioID}">
												<input type="radio" name="sub" value="${b.branchname}" id="${b.radioID}" title="${b.branchname}" checked=true/>
											</c:if>
										</c:if>
										<c:if test="${branch==null}">
											<input type="radio" name="sub" value="${b.branchname}" id="${b.radioID}" title="${b.branchname}" />
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">课程图片</div>
							<div class="layui-card-body layui-colla-content layui-show" style="padding-left: 3%;">
								<div class="layui-upload-list">
									<c:if test="${cover!=null}">
										<img class="layui-upload-img" id="cover" name="cover1" src="/webapps/../upload/cover/${cover}"}>
										<p id="demoText"></p>
										<input type="hidden" name="imgurl" id="coverurl" value="${cover}" />
									</c:if>
									<c:if test="${cover==null}">
										<img class="layui-upload-img" id="cover" name="cover1">
										<p id="demoText"></p>
										<input type="hidden" name="imgurl" id="coverurl" />
									</c:if>
								</div>
								<button type="button" class="layui-btn" id="choose">选择图片</button>
								<div class="layui-inline layui-word-aux">
									文件最大限制为1M
								</div><br /><br />
							</div>
						</div>
					</div>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title" >课程描述</div>
								<div class="layui-card-body layui-colla-content layui-show"  >
									<script id="editor" name="editor" type="text/plain"  ></script>
								</div>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<button  class="layui-btn"  type="submit" style="margin: 5% 0 0 43%;">
						保存课程信息
					</button>
				</div>
			</form>
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

		<script>
			layui.use('upload', function() {
				var $ = layui.jquery,
					upload = layui.upload;
	
				//普通图片上传
				var uploadInst = upload.render({
					elem: '#choose',
					url: '<%=request.getContextPath()%>/BackEnd/upload/cover.do',
					//auto:false,
					//bindAction: '#submitBtn',
					accept: 'file',
		
					before: function(obj) {
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {
							$('#cover').attr('src', result); //图片链接（base64）
						});
					},
					done: function(res) {
						//如果上传失败
						if(res.code > 0) {
							refreshHeight();
							return layer.msg('上传失败');
							
						}
						//上传成功
						else{
				
							//alert(res.url);
							
							document.getElementById("coverurl").value=res.url;
							refreshHeight();
						}
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
	
				layui.use(['form', 'layedit', 'laydate'], function() {
					var form = layui.form,
						layer = layui.layer,
						layedit = layui.layedit,
						laydate = layui.laydate;
				});
			});
		</script>
		
		<script type="text/javascript">
			//实例化编辑器
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
			var ue = UE.getEditor('editor');

			function isFocus(e) {
				alert(UE.getEditor('editor').isFocus());
				UE.dom.domUtils.preventDefault(e)
			}

			function setblur(e) {
				UE.getEditor('editor').blur();
				UE.dom.domUtils.preventDefault(e)
			}

			function insertHtml() {
				var value = prompt('插入html代码', '');
				UE.getEditor('editor').execCommand('insertHtml', value)
			}

			function createEditor() {
				enableBtn();
				UE.getEditor('editor');
			}

			function getAllHtml() {
				alert(UE.getEditor('editor').getAllHtml())
			}

			function getContent() {
				var arr = [];
				arr.push("使用editor.getContent()方法可以获得编辑器的内容");
				arr.push("内容为：");
				arr.push(UE.getEditor('editor').getContent());
				alert(arr.join("\n"));
			}

			function getPlainTxt() {
				var arr = [];
				arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
				arr.push("内容为：");
				arr.push(UE.getEditor('editor').getPlainTxt());
				alert(arr.join('\n'))
			}

			function setContent(isAppendTo) {
				var arr = [];
				arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
				UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
				alert(arr.join("\n"));
			}

			function setDisabled() {
				UE.getEditor('editor').setDisabled('fullscreen');
				disableBtn("enable");
			}

			function setEnabled() {
				UE.getEditor('editor').setEnabled();
				enableBtn();
			}

			function getText() {
				//当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
				var range = UE.getEditor('editor').selection.getRange();
				range.select();
				var txt = UE.getEditor('editor').selection.getText();
				alert(txt)
			}

			function getContentTxt() {
				var arr = [];
				arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
				arr.push("编辑器的纯文本内容为：");
				arr.push(UE.getEditor('editor').getContentTxt());
				alert(arr.join("\n"));
			}

			function hasContent() {
				var arr = [];
				arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
				arr.push("判断结果为：");
				arr.push(UE.getEditor('editor').hasContents());
				alert(arr.join("\n"));
			}

			function setFocus() {
				UE.getEditor('editor').focus();
			}

			function deleteEditor() {
				disableBtn();
				UE.getEditor('editor').destroy();
			}

			function disableBtn(str) {
				var div = document.getElementById('btns');
				var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
				for(var i = 0, btn; btn = btns[i++];) {
					if(btn.id == str) {
						UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
					} else {
						btn.setAttribute("disabled", "true");
					}
				}
			}

			function enableBtn() {
				var div = document.getElementById('btns');
				var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
				for(var i = 0, btn; btn = btns[i++];) {
					UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
				}
			}

			function getLocalData() {
				alert(UE.getEditor('editor').execCommand("getlocaldata"));
			}

			function clearLocalData() {
				UE.getEditor('editor').execCommand("clearlocaldata");
				alert("已清空草稿箱")
			}
		</script>
</body>

</html>