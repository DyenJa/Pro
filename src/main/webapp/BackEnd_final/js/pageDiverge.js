
	layui.use('laypage', function(){
	  var laypage = layui.laypage;
	  
	  //执行一个laypage实例
	  laypage.render({
	    elem: 'pageDiverge' //注意，这里的 test1 是 ID，不用加 # 号
	    ,count: 50 //数据总数，从服务端得到
	    ,curr: location.hash.replace('#!fenye=', '') //获取起始页
	  	,hash: 'fenye' //自定义hash值
	  });
	});