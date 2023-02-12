/**
 * member - edit.js
 */
 var xhr;
 var m_id;
 
 window.onload=function(){
 	m_id=document.getElementsByName('m_id')[0].value;
 	
 	xhr=new XMLHttpRequest();
 	xhr.onreadystatechange=function(ele){
 		if(xhr.readyState==4 && xhr.status==200){
 		 	var data = JSON.parse(xhr.responseText);
 		 	
 		 	document.getElementById('m_id').value=data.m_id;
 		 	document.getElementById('m_id').style.backgroundColor='#ddd';
 		 	document.getElementById('name').value=data.name;
 		 	document.getElementById('email').value=data.email;
 		 	for(var ele of document.getElementById('age')){
 		 		if(ele.value===data.age){
 		 			document.getElementById('age').value=ele.value;
 		 		}	
 		 	};
 		 	for(var ele of document.getElementsByName('gender')){
 		 		if(ele.value===data.gender){
 		 			ele.setAttribute('checked',true);
 		 		}
 		 	};
 		}
 	};
 	xhr.open('get','/JMTrestaurant/pages/member/api/detail.jsp?m_id='+m_id);
 	xhr.send();
 };