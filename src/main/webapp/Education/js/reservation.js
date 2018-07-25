
//声明全局变量page,找到page的数量
var page1=1;
var page2=1;
var page3=1;
var totalPage1;
var totalPage2;
var totalPage3;
var tel="111";
//1.send ajax request
function getRootPath(){
//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
var curWwwPath=window.document.location.href;
//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
var pathName=window.document.location.pathname;
var pos=curWwwPath.indexOf(pathName);
//获取主机地址，如： http://localhost:8083
var localhostPaht=curWwwPath.substring(0,pos);
//获取带"/"的项目名，如：/uimcardprj
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
return(localhostPaht+projectName);
}
function getTotalPages(){
	$.ajax({
		url:getRootPath()+"/freeListenBook/findCountPageThree",
		data:{tel:tel,qid:1},
		success:function(data){
			console.log(data);
			totalPage1 = data[0];
			totalPage2 = data[1];
			totalPage3 = data[2];
		}
	})
}

$(function(){
	loadNextPage1();
	loadNextPage2();
	loadNextPage3();
	getTotalPages();
})

function loadNextPage1(){
	var fragment = document.createDocumentFragment();
	var ul = document.getElementById("item1mobile").querySelector('.mui-table-view');
	$.ajax({
	url:getRootPath()+"/freeListenBook/findPersonAll",
	data:{tel:tel,qid:1,currentPage:page1} ,
	async:false,
	success:function(data){
		console.log(data);
		var li;
		for(var i=0;i<data.length;i++){
			li = document.createElement('li');
			li.className = 'mui-table-view-cell';
			tr =  '<h5 class="mui-content-padded">'+data[i].bookTime+'</h5>';
			tr += '<div class="mui-card">';
			tr += '<div class="mui-card-header mui-card-media" style="height:40vw;background-image:url(/upload/cover/' + data[i].freelisten.imgUrl +')"></div>';
			tr += '<div class="mui-card-content">';
			tr += '<div class="mui-card-content-inner">';
			tr += '<p style="color: #333;">'+data[i].freelisten.title+'</p>';
			tr += '</div></div></div>';
			li.innerHTML = tr;
			fragment.appendChild(li);
		}
	}
	})
	ul.appendChild(fragment);
	page1++;	
}
function loadNextPage2(){
	var fragment = document.createDocumentFragment();
	var ul = document.getElementById("item2mobile").querySelector('.mui-table-view');
	$.ajax({
		url:getRootPath()+"/freeListenBook/findPersonByStatus",
		data:{tel:tel,status:"待处理",qid:1,currentPage:page2} ,
		async:false,
		type:"post",
		success:function(data){
			console.log(data);
			var li;
			for(var i=0;i<data.length;i++){
			li = document.createElement('li');
			li.className = 'mui-table-view-cell';
			tr =  '<h5 class="mui-content-padded">'+data[i].bookTime+'</h5>';
			tr += '<div class="mui-card">';
			tr += '<div class="mui-card-header mui-card-media" style="height:40vw;background-image:url(/upload/cover/' + data[i].freelisten.imgUrl +')"></div>';
			tr += '<div class="mui-card-content">';
			tr += '<div class="mui-card-content-inner">';
			tr += '<p style="color: #333;">'+data[i].freelisten.title+'</p>';
			tr += '</div></div></div>';
			li.innerHTML = tr;
			fragment.appendChild(li);
		}
		}
	})
	ul.appendChild(fragment);
	page2++;
}
function loadNextPage3(){
	var fragment = document.createDocumentFragment();
	var ul = document.getElementById("item3mobile").querySelector('.mui-table-view');
	$.ajax({
		url:getRootPath()+"/freeListenBook/findPersonByStatus",
		data:{tel:tel,status:"已处理",qid:1,currentPage:page3} ,
		async:false,
		type:"post",
		success:function(data){
			console.log(data);
			var li;
			for(var i=0;i<data.length;i++){
			li = document.createElement('li');
			li.className = 'mui-table-view-cell';
			tr =  '<h5 class="mui-content-padded">'+data[i].bookTime+'</h5>';
			tr += '<div class="mui-card">';
			tr += '<div class="mui-card-header mui-card-media" style="height:40vw;background-image:url(/upload/cover/' + data[i].freelisten.imgUrl +')"></div>';
			tr += '<div class="mui-card-content">';
			tr += '<div class="mui-card-content-inner">';
			tr += '<p style="color: #333;">'+data[i].freelisten.title+'</p>';
			tr += '</div></div></div>';
			li.innerHTML = tr;
			fragment.appendChild(li);
		}
		}
	})
	ul.appendChild(fragment);
	page3++;
}

mui.init();
(function($) {
	//阻尼系数
	var deceleration = mui.os.ios?0.003:0.0009;
	$('.mui-scroll-wrapper').scroll({
		bounce: false,
		indicators: true, //是否显示滚动条
		deceleration:deceleration
	});
	$.ready(function() {
		//循环初始化所有下拉刷新，上拉加载。
		$.each(document.querySelectorAll('.mui-slider-group .mui-scroll'), function(index, pullRefreshEl) {
			$(pullRefreshEl).pullToRefresh({
				down: {
					callback: function() {
						var self = this;
						setTimeout(function() {
							var ul = self.element.querySelector('.mui-table-view');
							//获得第一个元素的时间
							//var time = $('.mui-table-view-cell .mui-content-padded',ul)[0].innerText;
							//alert(time);
							//清空所有元素
							while(ul.hasChildNodes()){
								ul.removeChild(ul.firstChild);
							}
							if(index==0) page1=1;
							else if(index==1) page2=1;
							else if(index==2) page3=1;
							ul.appendChild(createFragment(ul, index, 5,false));
							//ul.insertBefore(createUpdate(ul, index, 10, true), ul.firstChild);
							self.endPullDownToRefresh();
						}, 1000);
					}
				},
				up: {
					callback: function() {
						var self = this;
						setTimeout(function() {
							var ul = self.element.querySelector('.mui-table-view');
							ul.appendChild(createFragment(ul, index, 5,true));
							self.endPullUpToRefresh();
						}, 1000);
					}
				}
			});
		});
		var createUpdate = function(ul, index, count,reverse) {
			var length = ul.querySelectorAll('li').length;
			var fragment = document.createDocumentFragment();
			var li;
			var url=getRootPath()+"/freeListenBook/pullUpRefresh";
			var status;
			if(index==0){
				status="";
			}else if(index==1){
				status="待处理";
			}else if(index==2){
				status="已处理";
			}
			$.ajax({
				url:url,
				data:{tel:tel,qid:1,status:status,bookTime:time} ,
				type:"post",
				async:false,
				success:function(data){
					console.log(data);
					var tr;var cal=false;
					for(var i=0;i<data.length;i++){
						li = document.createElement('li');
						li.className = 'mui-table-view-cell';
						tr =  '<h5 class="mui-content-padded">'+data[i].bookTime+'</h5>';
						tr += '<div class="mui-card">';
						tr += '<div class="mui-card-header mui-card-media" style="height:40vw;background-image:url(/upload/cover/' + data[i].freelisten.imgUrl +')"></div>';
						tr += '<div class="mui-card-content">';
						tr += '<div class="mui-card-content-inner">';
						tr += '<p style="color: #333;">'+data[i].freelisten.title+'</p>';
						tr += '</div></div></div>';
						li.innerHTML = tr;
						fragment.appendChild(li);
						cal=true;
					}
					if(cal){
						mui.toast("最新订单");
					}else{
						mui.toast("已最新");
					}
				}
			})
			return fragment;
		};
		var createFragment = function(ul, index, count,up) {
			var length = ul.querySelectorAll('li').length;
			var fragment = document.createDocumentFragment();
			var li;
			var url;
			var status;
			var page;
			var doit=false;
			if(index==0){
				url=getRootPath()+"/freeListenBook/findPersonAll";
				page=page1;
				if(page<=totalPage1)
				doit=true;
				page1++;
			}else if(index==1){
				url=getRootPath()+"/freeListenBook/findPersonByStatus";
				page=page2;
				status="待处理";
				if(page<=totalPage2)
				doit=true;
				page2++;
			}else if(index==2){
				url=getRootPath()+"/freeListenBook/findPersonByStatus"
				page=page3;
				status="已处理";
				if(page<=totalPage3)
				doit=true;
				page3++;
			}
			if(doit){
				var update_len=0;
				$.ajax({
					url:url,
					data:{tel:tel,qid:1,currentPage:page,status:status} ,
					type:"post",
					async:false,
					success:function(data){
						console.log(data);
						var tr;
						for(var i=0;i<data.length;i++){
							li = document.createElement('li');
							li.className = 'mui-table-view-cell';
							tr =  '<h5 class="mui-content-padded">'+data[i].bookTime+'</h5>';
							tr += '<div class="mui-card">';
							tr += '<div class="mui-card-header mui-card-media" style="height:40vw;background-image:url(/upload/cover/' + data[i].freelisten.imgUrl +')"></div>';
							tr += '<div class="mui-card-content">';
							tr += '<div class="mui-card-content-inner">';
							tr += '<p style="color: #333;">'+data[i].freelisten.title+'</p>';
							tr += '</div></div></div>';
							li.innerHTML = tr;
							fragment.appendChild(li);
						}
						if(up){
							update_len = data.length;
							mui.toast("更新了"+update_len+"个订单" );
						}else{
							mui.toast("更新成功")
						}
					}
				})
			}else{
				mui.toast("没有更多了");
			}
			return fragment;
		};
	});
})(mui);