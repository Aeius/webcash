/**
 * 
 */
 var currentPageNum=1;
 var countDataInPage=10;
 var msnry=null;
 var container=null;
 var map=null;
 
$(function(){
	container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    getList();
});

$(window).on('scroll',function(e){
    var scrollTop = $(this).scrollTop();
    var innerHeight = $(this).innerHeight();
    var scrollHeight = $('body').prop('scrollHeight');
    
    if(scrollTop+innerHeight>=scrollHeight){
        getList();
    }
});

$(document).on('click', '.restaurantItemContainer', function(e){
    var r_id=$(this).data('r_id');
    
    getDetail(r_id);
});

$(document).on('click', '.popup .popupFooter>button', function(e){
    $('.popupWrap').css('backdropFilter','blur(0px)');
	$('.popupWrap').css('backgroundColor','#ffffff00');
	$('.popupWrap>.popup').css('opacity','0');
	setTimeout(function(){
		$('.popupForm').hide();
	},500);
});

function getList(){
	$.ajax({
		url:'/JMTrestaurant/restaurant/list.do',
		type:'post',
		data:{
			currentPageNum:currentPageNum,
			countDataInPage:countDataInPage
		},
		dataType:'json',
		success:function(result){
			if(result.data.length>0){
				var restaurantList = result.data;
				
				restaurantList.map(function(value, index){
					var imgSrc = "https://picsum.photos/id/"+(index%50)+"/300/150";
					if(value.img1 && value.img1!="") imgSrc ="/JMTrestaurant/upload/"+value.img1;
					var restaurantItemContainer = $('<div data-r_id="'+value.r_id+'" />');
					
					var restaurantItemHtml="";
					restaurantItemHtml+="<img src='"+imgSrc+"' />";
					restaurantItemHtml+="<div class='restaurantInfoContainer'><h2>"+value.name+"</h2><p>"+value.content+"</p><p><i class='fa fa-map-marker' aria-hidden='true'></i>"+value.addr+"</p></div>";
					
					restaurantItemContainer.html(restaurantItemHtml);
					restaurantItemContainer.addClass('restaurantItemContainer');
					$('.restaurantListContainer').append(restaurantItemContainer);
				})

				msnry = new Masonry( '.restaurantListContainer', {
			        itemSelector: '.restaurantItemContainer',
			        columnWidth: 300,
			        gutter : 20
			    });
    
			    imagesLoaded( '.restaurantListContainer' ).on( 'progress', function() {
			        msnry.layout();
			    });
				
				currentPageNum++;
			}
		    	
		}
	})
}

function getDetail(r_id){
	$.ajax({
		url:'/JMTrestaurant/restaurant/detail.do',
		type:'post',
		data:{
			r_id:r_id
		},
		dataType:'json',
		success:function(result){
			if(result.data){
				var data = result.data;
				
				$('.popupForm').show(function(){
					$('.popupWrap').css('backdropFilter','blur(2px)');
					$('.popupWrap').css('backgroundColor','#ffffff61');
					$('.popupWrap>.popup').css('opacity','1');
					
					$('.popup .popupMain>div:first-child').find('h2').text(data.name);
					$('.popup .popupMain>div:first-child').find('p').text(data.content);
					
					var imgSrc="/JMTrestaurant/imgs/logo.png";
					if(data.img1 && data.img1!="") imgSrc="/JMTrestaurant/upload/"+data.img1;
					$('.popup .popupMain>div:nth-child(2)').find('img').attr('src',imgSrc);
					
					$('.popup .popupMain>div:last-child').find('span').text(data.addr);
					
					var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new kakao.maps.LatLng(data.loc_x!=0?data.loc_x:35.125938053321796, data.loc_y!=0?data.loc_y:129.04540240071168), //지도의 중심좌표.
						level: 3 //지도의 레벨(확대, 축소 정도)
					};
				
					map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
					
					// 지도를 클릭한 위치에 표출할 마커입니다
					var marker = new kakao.maps.Marker({ 
					    // 지도 중심좌표에 마커를 생성합니다 
					    position: map.getCenter() 
					}); 
					// 지도에 마커를 표시합니다
					marker.setMap(map);
				});
			}
		}
	})
}