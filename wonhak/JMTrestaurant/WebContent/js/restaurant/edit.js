/**
 * restaurant - edit.js
 */
 var xhr;
 var r_id;
 var container=null;
 var map=null;
 
 window.onload=function(){
 	r_id=document.getElementsByName('r_id')[0].value;
 	
 	container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
 	
 	xhr=new XMLHttpRequest();
 	xhr.onreadystatechange=function(ele){
 		if(xhr.readyState==4 && xhr.status==200){
 		 	var result = JSON.parse(xhr.responseText);
 		 	var data = result.data;
 		 	
 		 	document.getElementById('name').value=data.name;
			document.getElementById('addr').value=data.addr;
			document.getElementById('content').value=data.content;
			document.getElementById('loc_x').value=data.loc_x;
			document.getElementById('loc_y').value=data.loc_y;
			
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
			
			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng; 
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
		
			    console.log(latlng.getLat(), latlng.getLng());
			    
			    document.getElementById('loc_x').value = latlng.getLat();
			    document.getElementById('loc_y').value = latlng.getLng();
			});
			
			if(data.img1 && data.img1!='null'){
				var img1PE = document.querySelector('#img1').parentElement;
				
				var img1El = document.createElement('img');
				img1El.setAttribute('src','/JMTrestaurant/upload/'+data.img1);
				img1PE.appendChild(img1El);
				
				var img1Input = document.createElement('input');
				img1Input.setAttribute('type','hidden');
				img1Input.setAttribute('name','prev_img1');
				img1Input.setAttribute('value',data.img1);
				img1PE.appendChild(img1Input);
			}
			if(data.img2 && data.img2!='null'){
				var img2PE = document.querySelector('#img2').parentElement;
				
				var img2El = document.createElement('img');
				img2El.setAttribute('src','/JMTrestaurant/upload/'+data.img2);
				img2PE.appendChild(img2El);
				
				var img2Input = document.createElement('input');
				img2Input.setAttribute('type','hidden');
				img2Input.setAttribute('name','prev_img2');
				img2Input.setAttribute('value',data.img2);
				img2PE.appendChild(img2Input);
			}
			if(data.img3 && data.img3!='null'){
				var img3PE = document.querySelector('#img3').parentElement;
				
				var img3El = document.createElement('img');
				img3El.setAttribute('src','/JMTrestaurant/upload/'+data.img3);
				img3PE.appendChild(img3El);
				
				var img3Input = document.createElement('input');
				img3Input.setAttribute('type','hidden');
				img3Input.setAttribute('name','prev_img3');
				img3Input.setAttribute('value',data.img3);
				img3PE.appendChild(img3Input);
			}
			if(data.img4 && data.img4!='null'){
				var img4PE = document.querySelector('#img4').parentElement;
				
				var img4El = document.createElement('img');
				img4El.setAttribute('src','/JMTrestaurant/upload/'+data.img4);
				img4PE.appendChild(img4El);
				
				var img4Input = document.createElement('input');
				img4Input.setAttribute('type','hidden');
				img4Input.setAttribute('name','prev_img4');
				img4Input.setAttribute('value',data.img4);
				img4PE.appendChild(img4Input);
			}
			if(data.img5 && data.img5!='null'){
				var img5PE = document.querySelector('#img5').parentElement;
				
				var img5El = document.createElement('img');
				img5El.setAttribute('src','/JMTrestaurant/upload/'+data.img5);
				img5PE.appendChild(img5El);
				
				var img5Input = document.createElement('input');
				img5Input.setAttribute('type','hidden');
				img5Input.setAttribute('name','prev_img5');
				img5Input.setAttribute('value',data.img5);
				img5PE.appendChild(img5Input);
			}
 		}
 	};
 	xhr.open('post','/JMTrestaurant/restaurant/detail.do?r_id='+r_id);
 	xhr.send();
 };