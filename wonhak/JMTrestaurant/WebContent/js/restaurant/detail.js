/**
 * restaurant - edit.js
 */
 var xhr;
 var r_id;
 
 window.onload=function(){
 	r_id=document.getElementsByName('r_id')[0].value;
 	
 	xhr=new XMLHttpRequest();
 	xhr.onreadystatechange=function(ele){
 		if(xhr.readyState==4 && xhr.status==200){
 		 	var result = JSON.parse(xhr.responseText);
 		 	var data = result.data;
 		 	
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