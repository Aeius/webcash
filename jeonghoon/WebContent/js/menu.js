
$(function() {
	var booleanThis=false;
	$('ul>li:eq(0)')
	.click(function(){return booleanThis;})
	.mouseenter(function() {
		$('.bx-controls-direction').find('a').css({'height':'0px'})
		$(this).get(0).addEventListener('mouseenter',function(e){
			e.stopPropagation();})
		$('ul>li:eq(0)>ol>li')
		.find('ol:eq(0)').css({'opacity':'0','height':'0px', 'width':'0px'})
		.find('ol:eq(1)').css({'opacity':'0','height':'0px', 'width':'0px'})
		.find('ol:eq(2)').css({'opacity':'0','height':'0px', 'width':'0px'});
		var styleOn={
			"backgroundColor":"rgb(200,50,50)"
		}
        $(this).find('ol').clearQueue()
        .animate({'opacity':'1','height':'300px'},300,'linear');
        $('ul>li:eq(0)>a').css(styleOn);
	}).mouseleave(function() {
		$('.bx-controls-direction').find('a').css({'height':'282px'})
		var styleOff={
			"backgroundColor":"rgb(122,122,0)"
		}
        $(this).find('ol').clearQueue()
        .animate({'opacity':'0','height':'0px'},300,'linear');
        $('ul>li:eq(0)>a').css(styleOff);
	})
	
	$('ul>li:eq(0)>ol>li').mouseenter(function(){
		$(this).find('ol').clearQueue()
        .mouseenter(function(){booleanThis=true;})
        .mouseleave(function(){booleanThis=false;})
        .css({'left': '100px'})
		.animate({'opacity':'1','height':'300px','width':'500px'},300,'linear');
	}).mouseleave(function() {  
		$(this).find('ol').clearQueue()
		.css({'left': '-9999px'})
        .animate({'opacity':'0','height':'300px', 'width':'0px'},300,'linear');
	})
});