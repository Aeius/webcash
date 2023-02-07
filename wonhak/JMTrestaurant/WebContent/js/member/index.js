/**
 * member - index.js
 */
 var xhr;
 
 window.onload=function(){
 	console.log('welcome');
 	var tbody,tbodyHTML;
 	
 	tbody=document.querySelector('tbody');
 	tbodyHTML="";
 	xhr=new XMLHttpRequest();
 	xhr.onreadystatechange=function(ele){
 		if(xhr.readyState==4 && xhr.status==200){
 		 	var data = JSON.parse(xhr.responseText);
 		 	var num=1;
 			for(value of data){
 				tbodyHTML+="<tr>";
 				tbodyHTML+="<td>"+num+"</td>";
 				tbodyHTML+="<td>"+value.m_id+"</td>";
 				tbodyHTML+="<td>"+value.name+"</td>";
 				tbodyHTML+="<td>"+value.email+"</td>";
 				tbodyHTML+="<td>"+value.age+"</td>";
 				tbodyHTML+="<td>"+value.gender+"</td>";
 				tbodyHTML+="<td>"+value.reg_date+"</td>";
 				tbodyHTML+="</tr>";
 				num++;
 			}
 			tbody.innerHTML=tbodyHTML;
 		}
 	};
 	xhr.open('get','/JMTrestaurant/pages/member/api/list.jsp');
 	xhr.send();
 };