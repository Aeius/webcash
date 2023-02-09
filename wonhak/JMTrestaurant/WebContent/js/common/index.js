/*
메뉴 애니메이션
*/
$(function(){
    $('#nav .menu')
    .mouseenter(function(){
		$('#nav .menu').children().clearQueue();
        $(this).find('ul').animate({'opacity':'1','height':'100%'},300,'linear');
    })
    .mouseleave(function(){
        $('#nav .menu').children().clearQueue();
        $(this).find('ul').animate({'opacity':'0','height':'0px'},300,'linear');
    });
    
});