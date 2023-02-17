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
 		 	
 		 	var session_m_id = document.getElementById('session_m_id').value;
 		 	var session_level = document.getElementById('session_level').value;
 		 	
 		 	document.getElementById('m_id').value=data.m_id;
 		 	document.getElementById('name').value=data.name;
 		 	document.getElementById('name').style.backgroundColor='#ddd';
			document.getElementById('addr').value=data.addr;
			document.getElementById('addr').style.backgroundColor='#ddd';
			document.getElementById('content').value=data.content;
			document.getElementById('content').style.backgroundColor='#ddd';
			document.getElementById('loc_x').value=data.loc_x;
			document.getElementById('loc_x').style.backgroundColor='#ddd';
			document.getElementById('loc_y').value=data.loc_y;
			document.getElementById('loc_y').style.backgroundColor='#ddd';
			
			if(session_m_id == data.m_id || session_level == 1){
				document.getElementById('edit_btn').style.display='inline-block';
			}
			
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

			var imgViewForm = document.getElementsByClassName('imgViewForm')[0];
			if(data.img1 && data.img1!='null'){
				var img1El = document.createElement('img');
				img1El.setAttribute('src','/JMTrestaurant/upload/'+data.img1);
				imgViewForm.appendChild(img1El);
			}
			if(data.img2 && data.img2!='null'){
				var img2El = document.createElement('img');
				img2El.setAttribute('src','/JMTrestaurant/upload/'+data.img2);
				imgViewForm.appendChild(img2El);
			}
			if(data.img3 && data.img3!='null'){
				var img3El = document.createElement('img');
				img3El.setAttribute('src','/JMTrestaurant/upload/'+data.img3);
				imgViewForm.appendChild(img3El);
			}
			if(data.img4 && data.img4!='null'){
				var img4El = document.createElement('img');
				img4El.setAttribute('src','/JMTrestaurant/upload/'+data.img4);
				imgViewForm.appendChild(img4El);
			}
			if(data.img5 && data.img5!='null'){
				var img5El = document.createElement('img');
				img5El.setAttribute('src','/JMTrestaurant/upload/'+data.img5);
				imgViewForm.appendChild(img5El);
			}
 		}
 	};
 	xhr.open('post','/JMTrestaurant/restaurant/detail.do?r_id='+r_id);
 	xhr.send();
 };