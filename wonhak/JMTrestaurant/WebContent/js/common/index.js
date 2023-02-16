/*
메뉴 애니메이션
*/
$(function(){
	$('#header>h1').click(function(){
		location.href='/JMTrestaurant/';
	});

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