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
 		}
 	};
 	xhr.open('post','/JMTrestaurant/restaurant/detail.do?r_id='+r_id);
 	xhr.send();
 };