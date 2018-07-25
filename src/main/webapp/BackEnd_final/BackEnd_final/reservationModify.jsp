<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程信息编辑页</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../layui/css/layui.css">
		<script type="text/javascript" charset="utf-8" src="../js/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="../js/ueditor.all.min.js"></script>
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
            } 
        </script>
	</head>

	<body class="layui-layout-body" 
		style="font-family: '宋体'; background-color: #F8F8FF;" onload="IFrameResize();">
		<div class="layui-layout layui-layout-admin">
				<!-- 内容主体区域 -->
		  <div style="background-color: white; 
			  	margin: 0px 50px 0px 0px; background-color: #F8F8FF;">
			<form class="layui-form">
				<div class="layui-collapse">
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">预约课程名称</div>
							<div class="layui-card-body layui-colla-content layui-show" style="height: 50px; line-height: 50px;">
								<input class="layui-input" type="text" placeholder="大数据免费试听课" />
							</div>
						</div>
					</div>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">预约课程状态</div>
							<div class="layui-card-body layui-colla-content layui-show" style="text-align: left;">
								<div class="layui-form-item">
									<select id="classification">
										<option value="handled">请选择</option>
										<option>进行中</option>
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
									<input type="radio" name="sub" value="train_center" title="实训中心" id="train_center" />
									<input type="radio" name="sub" value="art_center" id="art_center" title="艺术中心" />
									<input type="radio" name="sub" value="hengda" id="hengda" title="恒大名都" />
								</div>
							</div>
						</div>
					</div>
				
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">课程图片</div>
							<div class="layui-card-body layui-colla-content layui-show" style="padding-left: 3%;">
								<img src="" name="course_img" class="layui-upload-img" id="demo1" style="width: 100%;"><br /><br />
								<button type="button" class="layui-btn" id="btn_upload">选择图片</button>
								<div class="layui-inline layui-word-aux">
									文件最大限制为1M
								</div><br /><br />
							</div>
						</div>
					</div>
					<div class="layui-col-md8 layui-col-lg-offset2 layui-colla-item">
						<div class="layui-card">
							<div class="layui-card-header layui-colla-title">课程描述</div>
							<div class="layui-card-body layui-colla-content layui-show">
								<script id="editor" type="text/plain" ></script>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<button class="layui-btn" style="margin: 5% 0 0 43%;">
						<a href="enterpriseModify.jsp" style="color: white;">保存课程信息</a>
					</button>
				</div>
			</form>
		  </div>
		</div>
		
		<script type="text/javascript" src="../layui/layui.js"></script>
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
			layui.use(['form', 'upload'], function() {
				var form = layui.form,
					layer = layui.layer,
					$ = layui.jquery,
					upload = layui.upload;

				//监听提交
				form.on('submit(demo1)', function(data) {
					layer.alert(JSON.stringify(data.field), {
						title: '最终的提交信息'
					})
					return false;
				});

				$("#demo1").attr("src", "../images/2.jpg");

				upload.render({
					elem: '#btn_upload',
					url: '/upload/',
					size: 1024,
					before: function(obj) {
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result) {
							$('#demo1').attr('src', result); //图片链接（base64）

						});
					},
					done: function(res) {
						//如果上传失败
						if(res.code > 0) {
							return layer.msg('上传失败');
						}

						//上传成功
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
