var messageid =23; 
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
function responseComment(mid){
	// console.log($(this).index());

// 获取回复按钮集合,getElementByClassName;
var btn_reply ='btn_reply'+mid;
var user_reply ='user_reply'+mid;
var m
= document.getElementById(btn_reply);

var n
= document.getElementById(user_reply);

console.log('回复按钮集合'
+ m);

// 获取回复按钮的索引

var index
= $('#'+btn_reply).index($(this));

console.log(index);

$('#'+user_reply).eq(index).css("display",
"block");
var id_commentTxt = 'commentTxt'+mid
document.getElementById(id_commentTxt).focus();
}

$(document).on("click",".btn-cancel",function()
 {

var m
= document.getElementsByClassName("btn-reply");

var n
= document.getElementsByClassName("user-reply");

var index
= $(".btn-cancel").index($(this));

console.log(index);

$(".user-reply").eq(index).css("display",
"none");

});
function trim(s){
    return s.replace(/(^\s*)|(\s*$)/g, "");
}
function responseSend(mid){
	var id_commentTxt = 'commentTxt'+mid;
	var ele = document.getElementById(id_commentTxt);
	var commentTxt = ele.value;
	commentTxt = trim(commentTxt);
	if(commentTxt==''){
		mui.toast('内容不能为空');
		ele.value ='';
		ele.focus();
		return;
	}else{		
		 $.ajax({
				url: getRootPath()+"/FrontEnd/more/comment",
				type:"post",
				data:{content:commentTxt,mid:mid},
				dataType:"json",
				success:function(data){
						if(data.result){
							
						}
				}						
			});		
		//alert(commentTxt);
		ele.value='';
		var id_cancel ='cancel'+mid;
		document.getElementById(id_cancel).click();
		var li = document.createElement('li');
		var username = sessionStorage.getItem("nickName");
		li.innerHTML = '<li><a>'+username+'</a>：'+commentTxt+'</li>';
		var id_comment = 'comment'+mid;
		var comment = document.getElementById(id_comment);
		comment.insertBefore(li, comment.firstChild);
	}
}
function getPullMessage(lastpubtime,type){
	 $.ajax({
			url: getRootPath()+"/FrontEnd/more/pullrefresh",
			type:"post",
			data:{pubtime:lastpubtime,type:type},
			dataType:"json",
			success:function(data){
				//sessionStorage.setItem("messagedata", 1);	
				
					if(data.length==0){
						if(type==0){
							mui('#pullrefresh').pullRefresh().endPullupToRefresh(true); //参数为true代表没有更多数据了
							return;
						}
						else{
							mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed
							return;
						}
					}else{
						sessionStorage.setItem("messagedata",JSON.stringify(data));
						if(type==0){
							mui('#pullrefresh').pullRefresh().endPullupToRefresh(false); //参数为true代表没有更多数据了						
						}
						else{
							mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed
						}
					}
					
				    setMessage(data,type);
				    messagedata =1;
			}						
		});
}

function setMessage(data,type){
	console.log(data);
	var table = document.body.querySelector('.mui-table-view');
	if(type==1){
		table.innerHTML='';
	}
	for(var i =0;i<data.length;i++){
	var imgs = getImgs(data[i].messageimgs,data[i].mid);
	var pubtime = getPubtime(data[i].mtime);
	var likeuser = getLikeuser(data[i].messagelikes,data[i].likenum,data[i].mid);
	var messagereplys = getMessageReplys(data[i].messagereplys,data[i].replynum);
	var message ='<li class="messageinfo"'+
			'<div style="margin-left: 8px;">'+
				'<div>'+
				'<a href="javascript:;">'+
					'<img class="mui-media-object mui-pull-left" src="../img/dongruan.jpg">'+
					'<div class="mui-media-body">'+
						'<span style="font-size: small;">东软睿道</span>'+
					'</div>'+
				'</a>'+
				'</div>'+
				'<div style="margin-left: 14px">'+
					'<p style="font-size:15px;color: black;margin-bottom: 0;">'+data[i].mtitle+'</p>'+
				'</div>'+
			'</div>'+			
			'<ul id="'+data[i].mid+'" class="mui-table-view mui-grid-view" style="margin-left:13%;background-color: #EFEFF4;">'+imgs+'</ul>'+
		    '<div style="margin-left: 15%;">'+
			    '<div style="height: auto;padding-left:2%;width: 100%;">'+
			    	'<p style="display: inline;">'+pubtime+'</p>'+
			    	'<div style="float: right;margin-right: 2%;">'+
			    		'<button id="good_'+data[i].mid+'" hidden="hidden"  onclick="responseGood('+data[i].mid+',0)"></button>'+
				    	'<button id="good'+data[i].mid +'" class="mui-icon-extra mui-icon-extra-heart" style="font-size:15px;border:none;padding-top: 4px;background-color: #EFEFF4;" onclick="responseGood('+data[i].mid+',1)">赞</button><!--mui-icon-extra mui-icon-extra-heart-filled-->'+
				    	'<button id="btn_reply'+data[i].mid+'" class="mui-icon mui-icon-chatbubble btn-reply" style="font-size:15px;border:none;width: 50%;padding-top: 5px;background-color: #EFEFF4;" id="comment" onclick="responseComment('+data[i].mid+')">评论</button>'+
			   		'</div>'+
			    '</div>'+
			    '<div id="like_comment' +data[i].mid+'" style="background-color:#F7F7F7 ;margin-top: 5px;padding-left: 2%;margin-bottom: 0px;margin-right: 4%;">'+
			    '<p style="margin-bottom: 2px;">'
			    +likeuser+
			    '</p>'+	
			    '<ul id="comment'+data[i].mid+'" class="comment" style=" padding-left: 2px;list-style: none;font-size: small;">'+messagereplys+
				'</ul>'+
				'</div>'+				
				'<div id="user_reply'+data[i].mid+'" class="user-reply">'+
					'<duv class="reply-in">'+
					'<input style="font-size: 12px;" id="commentTxt'+data[i].mid+'" type="text" value="" name=""  />'+
					'</duv>'+
					'<div class="reply-buttons">'+
						'<button type="button" class="btn btn-primary btn-comment btn-sm" id="send" onclick="responseSend('+data[i].mid+')">发送</button>'+
						'<button type="button" class="btn btn-default btn-cancel btn-sm" id="cancel'+data[i].mid+'">取消</button>'+
					'</div>'+
				'</div>'+
			'</div>'+
			'<hr>'+
			'</li>';
			var li = document.createElement('li');
			li.className = 'messageinfo';
			li.innerHTML = message;
			table.appendChild(li);
			var good_id = 'good_'+data[i].mid;
			document.getElementById(good_id).click();
			if(i==(data.length-1)){
			document.getElementById("lastpubtime").value = data[i].mtime;
			}
			if(data[i].replynum>3){
				var id = 'more_'+data[i].mid;
				var click = document.getElementById(id);
	            click.addEventListener('tap',function(){
	                var more_id =this.getAttribute('id');
	                more_id = more_id.substr(5);
	                //alert(more_id);
	                messageid = parseInt(more_id);
	                var commenlist = document.getElementById("commentlist");
	            		commenlist.innerHTML ='';
	            	mui('#commentrefresh').pullRefresh().pullupLoading();
	            });
			}
		}
	
}
function getMessageReplys(messagereplys,replynum){
/*	 '<li><a>费园园</a>：哈哈哈</li>'+
     '<li><a>陈老师</a>：哈哈哈</li>'+
     '<li><a>陈宇</a>：我也哈哈哈</li>'+
     '<li><a style="text-decoration: underline;font-size: small;">更多评论</a></li>'*/
	var result='';
	for(var i=0;i<messagereplys.length;i++){
		result +='<li><a>'+messagereplys[i].nickName+'</a>：'+messagereplys[i].content+'</li>';
	}
	if(replynum>3){
		result +='<li><a id="more_'+ messagereplys[0].mid+'" href="#middlePopover" style="text-decoration: underline;font-size: small;" >共'+replynum+'条评论>></a></li>';
		/*result +='<li><button style="text-decoration:underline;font-size:small;border:none;padding-left:0px;background-color: #F7F7F7;" onclick="responseMorecomment('+messagereplys[0].mid+')">共'+replynum+'条评论>></button></li>'*/
	}
	return result;
}
function getLikeuser(messagelikes,likenum,mid){
/*	 '<p style="margin-bottom: 2px;">'+
 	'<span class="mui-icon-extra mui-icon-extra-heart-filled" style="font-size: 12px;">费园园、陈老师</span>'+
 '</p>'+*/
	var likelist = 'likelist'+mid;
	if(messagelikes.length==0){
		return '<span id='+likelist+'  style="font-size: 12px;"></span>';
	}else{
		//var likelist = 'likelist'+messagelikes[0].mid;
		var result =	 '<span id='+likelist+' class="mui-icon-extra mui-icon-extra-heart-filled" style="font-size: 12px;">';
		for(var  i=0;i<messagelikes.length;i++){
			if(i==0 ){
				result+=messagelikes[i].nickName;
			}
			else{
			result+='、'+messagelikes[i].nickName;
			}
		}
		if(likenum>1){
			var id_value = 'likenum'+messagelikes[0].mid;
			result+='等<span id='+id_value+'>'+likenum+'</span>人觉得很赞';
		}
		result +='</span>';
		return result;
	}
	
}
function responseGood(mid,goodtype){
	
	 $.ajax({
			url: getRootPath()+"/FrontEnd/more/good",
			type:"post",
			data:{mid:mid,type:goodtype},
			dataType:"json",
			success:function(data){
					if(data.result){
						var goodid = 'good'+mid;
						//document.getElementById(goodid).className = 'mui-icon-extra mui-icon-extra-heart-filled';
						var good = document.getElementById(goodid);
						good.className = '';
						var style = 'font-size:15px;border:none;padding-top: 1px;background-color: #EFEFF4;padding-bottom: 4px;z-index:1;';
						good.style=style;
						var imghtml = '<img src="../img/good.svg" style="z-index: -1;"/>赞';
						good.innerHTML=imghtml;
						/*<button  style="font-size:14px;border:none;padding-top: 1px;background-color: #EFEFF4;padding-bottom: 4px;" ><img src="img/点赞.svg" />赞</button>*/
					/*	style="font-size:15px;border:none;padding-top: 4px;background-color: #EFEFF4;"*/
						//alert(goodtype);
						if(goodtype==1){
							var id_likelist = 'likelist'+mid;
							var id_likenum ='likenum'+mid;
							var likenum = document.getElementById(id_likenum);
							var num =2;
							if(likenum!=null){
								var likenumText = likenum.innerText;
								num= parseInt(likenumText);
								num+=1;
								likenum.innerHTML=''+num;
							}							
							var likelist = document.getElementById(id_likelist);
							var likelistText = likelist.innerText;
							//alert(likelistText);
							var username = sessionStorage.getItem("nickName");
							if(likelistText!=''){		
								likelistText = likelistText.replace('等'+num+'人觉得很赞','');
								likelistText = likelistText.replace('等'+num+'人觉得很赞','');
								likelistText = username+'、'+likelistText;
								var id_value = 'likenum'+mid;
								likelist.innerHTML =likelistText+'等<span id='+id_value+'>'+num+'</span>人觉得很赞';	
								//likelist.innerHTML =likelistText;						
							}else{
								//var id_value = 'likenum'+mid;
								likelist.className = 'mui-icon-extra mui-icon-extra-heart-filled';
								likelist.innerHTML = username;
							}				
						}
					}else{
						//alert(goodtype);
						var goodid = 'good'+mid;
						var good = document.getElementById(goodid);
						good.className = 'mui-icon-extra mui-icon-extra-heart';
						var style = "font-size:15px;border:none;padding-top: 4px;background-color: #EFEFF4;";
						good.style=style;
						var imghtml = '赞';
						good.innerHTML=imghtml;
						
						if(goodtype==1){
							var id_likelist = 'likelist'+mid;
							var id_likenum ='likenum'+mid;
							var likenum = document.getElementById(id_likenum);
							var likelist = document.getElementById(id_likelist);
							var num = 0;
							if(likenum!=null){
								var likenumText = likenum.innerText;
								var num= parseInt(likenumText);
								num-=1;
								likenum.innerHTML=''+num;
							}else{
								likelist.className ='';
								likelist.innerHTML='';
								return;
							}					
							var likelistText = likelist.innerText;
							//alert(likelistText);
							var username = sessionStorage.getItem("nickName");
							if(likelistText!=username){
								likelistText = likelistText.replace(username+'、','');
								likelistText = likelistText.replace('、'+username,'');
								likelistText = likelistText.replace('等'+num+'人觉得很赞','');
								likelistText = likelistText.replace('等'+num+'人觉得很赞','');
								if(num==1){
									likelist.innerHTML =likelistText
								}else{
									var id_value = 'likenum'+mid;
									likelist.innerHTML =likelistText+'等<span id='+id_value+'>'+num+'</span>人觉得很赞';		
								}
							}else{
								likelist.className ='';
								likelist.innerHTML='';
							}				
						}
					}

				/*	if(data.length==0){
						mui('#pullrefresh').pullRefresh().endPullupToRefresh(true); //参数为true代表没有更多数据了
						return;
					}
					mui('#pullrefresh').pullRefresh().endPullupToRefresh(false); //参数为true代表没有更多数据了
					setMessage(data);*/
					 /*for (var i = 0 ;i < 3; i++) {
						var li = document.createElement('li');
						li.className = 'messageinfo';
						li.innerHTML = setMessage();
						table.appendChild(li);
					} */
				
			}						
		});	 
}
function getImgs(imgs,mid){
	
	if(imgs.length==1){
	var img_url = '../../../upload/messageimgs/'+imgs[0].imgUrl;	 
	
	var img = new Image();	 
	img.src = img_url;
	// 判断是否有缓存

	if(img.complete){
				mid = ''+mid;
				var imglist = document.getElementById(mid);
		    	var screen_width = screen.width*0.87*0.858;
	    		var width = img.width;
	    		var height = img.height
	    		var result ='';
		    	if(img.width>img.height){
		    		if(img.width>screen_width){
		    			height =height/ (width/screen_width);
		    			width=screen_width; 
		    		}		
		    		result +='<li class="mui-table-view-cell mui-media ">'+
			            '<a href="#"><img class="mui-media-object" src='+img_url+' data-preview-src="" data-preview-group="1" style="height:'+ height+'px; width:'+width+ 'px;"></a>'+
			        '</li>';
					}
		    	else{
		    		if(img.height>screen_width){
		    			width =width/ (height/screen_width);
		    			height=screen_width; 
		    		}	
		    		result +='<li class="mui-table-view-cell mui-media ">'+
			            '<a href="#"><img class="mui-media-object" src='+img_url+' data-preview-src="" data-preview-group="1" style="height:'+ height+'px; width:'+width+ 'px;"></a>'+
			        '</li>';
		    	}		   
		    		return result;
		    }
	else{
	    // 加载完成执行
		 var result ='';
		// 定时执行获取宽高
		var check = function(){
		    // 只要任何一方大于0
		    // 表示已经服务器已经返回宽高
		    if(img.width>0 || img.height>0){
		    	mid = ''+mid;
		    	var screen_width = screen.width*0.87*0.858;
	    		var width = img.width;
	    		var height = img.height
	    		var imglist = document.getElementById(mid);
		    	if(img.width>img.height){
		    		if(img.width>screen_width){
		    			height =height/ (width/screen_width);
		    			width=screen_width; 
		    		}
		    		var li = document.createElement('li');
					li.className = 'messageinfo';
					li.innerHTML ='<li class="mui-table-view-cell mui-media ">'+
			            '<a href="#"><img class="mui-media-object" src='+img_url+' data-preview-src="" data-preview-group="1" style="height:'+ height+'px; width:'+width+ 'px;"></a>'+
			        '</li>'
					imglist.appendChild(li);	
				}
		    	else{
		    		if(img.height>screen_width){
		    			width =width/ (height/screen_width);
		    			height=screen_width; 
		    		}		
		    		var li = document.createElement('li');
					li.className = 'messageinfo';
					li.innerHTML ='<li class="mui-table-view-cell mui-media ">'+
			            '<a href="#"><img class="mui-media-object" src='+img_url+' data-preview-src="" data-preview-group="1" style="height:'+ height+'px; width:'+width+ 'px;"></a>'+
			        '</li>'
					imglist.appendChild(li);
		    	}
		        clearInterval(set);
		      
		    }
		};
		 
		var set = setInterval(check,40);
		//alert(result);
		return result;
	    }	
		//return result;
	}
	else{
		var result = '';
		for(var i =0;i<imgs.length;i++){
			var img_url = '../../../upload/messageimgs/'+imgs[i].imgUrl;	 
			 result +=  '<li class="mui-table-view-cell mui-media mui-col-xs-5">'+
						            '<a href="#"><img class="mui-media-object" src='+img_url+' data-preview-src="" data-preview-group="1" style="height: 142px;"></a>'+
						      '</li>';
		}
		return result;
	}	
}
function getPubtime(pubtime){
	var year = pubtime.substr(2,2);
	var month = pubtime.substr(5,2);
	var day = pubtime.substr(8,2);
	var hour = pubtime.substr(11,2);
	var minute = pubtime.substr(14,2);
	pubtime = year+'年'+month+'月'+day+'日 '+hour+':'+minute;
	return pubtime;
}

/*function responseMorecomment(mid){

	var commenlist = document.getElementById("commentlist");
	commenlist.innerHTML='';
	messageid = mid;
	document.getElementById("sp").click();
	alert(mid);
}*/
function getPullComment(commentlastpubtime,type){
	$.ajax({
		url: getRootPath()+"/FrontEnd/more/morecomment",
		type:"post",
		data:{pubtime:commentlastpubtime,type:type,mid:messageid},
		dataType:"json",
		success:function(data){				
				if(data.length==0){
					if(type==0){
						//mui('#commentrefresh').pullRefresh().endPullupToRefresh(true); //参数为true代表没有更多数据了
						mui.toast("没有更多评论了");
						return;
					}
					else{
						mui('#commentrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed
						return;
					}
				}else{
					if(type==0){
						mui('#commentrefresh').pullRefresh().endPullupToRefresh(false); //参数为true代表没有更多数据了						
					}
					else{
						mui('#commentrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed
					}
				}				
			    setComments(data,type);
		}						
	});
}
function  setComments(data,type){
	var commenlist = document.getElementById("commentlist");
	if(type==1){
		commenlist.innerHTML='';
	}
	for(var i=0;i<data.length;i++){
		var li = document.createElement('li');
		li.innerHTML = '<li ><a href="#">'+data[i].nickName+'</a>：'+data[i].content+'</li>';
		commenlist.appendChild(li);
		if(i==(data.length-1)){
			document.getElementById("commentlastpubtime").value = data[i].stime;
			}
	}	
	/*<li ><a href="#">千阳</a>：哈哈哈
	</li>*/
}