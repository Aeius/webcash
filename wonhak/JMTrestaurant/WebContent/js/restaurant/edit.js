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
			document.getElementById('addr').value=data.addr;
			document.getElementById('content').value=data.content;
			document.getElementById('loc_x').value=data.loc_x;
			document.getElementById('loc_y').value=data.loc_y;
			
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