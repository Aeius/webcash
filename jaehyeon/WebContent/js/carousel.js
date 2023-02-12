function carousel(){
    $('.carousel>ul').animate({marginLeft:'-200px'}, 2000, 'linear',function(){
        $('.carousel>ul').css('margin-left', 0);
        $('.carousel>ul>li').eq(0).appendTo('.carousel>ul');
    })
}
$(function(){
    setInterval(carousel, 2000);
});
