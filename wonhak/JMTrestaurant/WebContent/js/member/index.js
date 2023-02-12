/**
 * member - index.js
 */
 var xhr;
 var currentPageNum=0;
 var countDataInPage=10;
 var countInPageGroup=5;
 var parameter="?currentPageNum="+currentPageNum+"&countDataInPage="+countDataInPage+"&countInPageGroup="+countInPageGroup;

 window.onload=function(){
 	getData();
 	
 	 var closeButton = document.querySelector('.popupForm .popupHeader i').onclick=function(){
 	 	document.querySelector('#main .popupForm').style.display='none';
		document.querySelector('#main .popupWrap').style.backdropFilter='blur(0px)';
		document.querySelector('#main .popupWrap').style.backgroundColor='#ffffff00';
 	 };
 };
 
function removeMember(m_id){
	document.querySelector('#main .popupForm').style.display='block';
	document.querySelector('#main .popupWrap').style.backdropFilter='blur(2px)';
	document.querySelector('#main .popupWrap').style.backgroundColor='#ffffff61';
	
	var removeButton=document.createElement('button');
	removeButton.innerText="삭제";
	removeButton.setAttribute("onclick","location.href='/JMTrestaurant/pages/member/api/delete.jsp?m_id="+m_id+"'");
	
	if(document.querySelector('#main .popupWrap .popupFooter').children.length>0) document.querySelector('#main .popupWrap .popupFooter').firstElementChild.remove();
	document.querySelector('#main .popupWrap .popupFooter').append(removeButton);
}

function searchResult(){
	var searchColumn = document.getElementById('searchColumn').value;
	var searchValue = document.getElementById('searchValue').value;
	
	parameter="?currentPageNum="+currentPageNum+"&countDataInPage="+countDataInPage+"&countInPageGroup="+countInPageGroup+"&searchColumn="+searchColumn+"&searchValue="+searchValue;
	getData();
}

function getData(){
	var tbody,tbodyHTML;
 	
 	tbody=document.querySelector('tbody');
 	tbodyHTML="";
 	xhr=new XMLHttpRequest();
 	xhr.onreadystatechange=function(ele){
 		if(xhr.readyState==4 && xhr.status==200){
 		 	var result = JSON.parse(xhr.responseText);
 		 	var data = result.data;
 		 	var totalDataCount = result.totalDataCount;
 		 	
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
 				tbodyHTML+="<td><button type=\"button\" onclick=\"location.href='/JMTrestaurant/pages/member/edit.jsp?m_id="+value.m_id+"'\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></button><button type=\"button\" onclick=\"removeMember('"+value.m_id+"')\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></button></td>";
 				tbodyHTML+="</tr>";
 				num++;
 			}
 			tbody.innerHTML=tbodyHTML;
 			
 			console.log(totalDataCount/countInPageGroup);
 		}
 	};
 	xhr.open('get','/JMTrestaurant/pages/member/api/list.jsp'+parameter);
 	xhr.send();
}