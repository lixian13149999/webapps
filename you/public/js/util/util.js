var util = new Object();

$(function(){
//    底部按钮的点击样式切换方法
    $('[data-page-button="bottom"]').on("click",function(){
        $(this).parents(".bottom-button-box").first().find('[data-page-button="bottom"]').each(function(index,ele){
            $(ele).removeClass('checked');
        });
        
        $(this).addClass('checked');
        
        var url = $(this).data('button-href');
        if(url=="find"){
        	window.location.href = "/proj";
        }else{
        	if(url=="create"){
        		window.location.href = "/proj/create";
        	}else{
        		if(url=="user"){
        			window.location.href = "/user";
        		}
        	}
        }
    });
});

//滚动条在Y轴上的滚动距离
util.getScrollTop = function (){
　　var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
　　if(document.body){
　　　　bodyScrollTop = document.body.scrollTop;
　　}
　　if(document.documentElement){
　　　　documentScrollTop = document.documentElement.scrollTop;
　　}
　　scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
　　return scrollTop;
}
//文档的总高度
util.getScrollHeight = function (){
　　var scrollHeight = 0, bodyScrollHeight = 0, documentScrollHeight = 0;
　　if(document.body){
　　　　bodyScrollHeight = document.body.scrollHeight;
　　}
　　if(document.documentElement){
　　　　documentScrollHeight = document.documentElement.scrollHeight;
　　}
　　scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight;
　　return scrollHeight;
}
//浏览器视口的高度
util.getWindowHeight = function (){
　　var windowHeight = 0;
　　if(document.compatMode == "CSS1Compat"){
　　　　windowHeight = document.documentElement.clientHeight;
　　}else{
　　　　windowHeight = document.body.clientHeight;
　　}
　　return windowHeight;
}
//window.onscroll = function(){
//　　if(getScrollTop() + getWindowHeight() == getScrollHeight()){
//　　　　alert("you are in the bottom!");
//　　}
//};