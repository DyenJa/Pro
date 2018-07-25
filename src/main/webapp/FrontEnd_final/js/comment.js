$(document).on("click",".btn-reply",function(){
// console.log($(this).index());

// 获取回复按钮集合,getElementByClassName;

var m
= document.getElementsByClassName("btn-reply");

var n
= document.getElementsByClassName("user-reply");

console.log('回复按钮集合'
+ m);

// 获取回复按钮的索引

var index
= $(".btn-reply").index($(this));

console.log(index);

$(".user-reply").eq(index).css("display",
"block");

});













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
