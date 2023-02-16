/**
 * restaurant - index.js
 */
 var xhr;
 var currentPageNum=1;
 var countDataInPage=10;
 var countInPageGroup=5;
 var parameter="?currentPageNum="+currentPageNum+"&countDataInPage="+countDataInPage+"&countInPageGroup="+countInPageGroup;

 var session_m_id=null;
 var session_level=10;

 window.onload=function(){
  	getData();
 	
 	 var closeButton = document.querySelector('.popupForm .popupHeader i').onclick=function(){
 	 	document.querySelector('#main .popupForm').style.display='none';
		document.querySelector('#main .popupWrap').style.backdropFilter='blur(0px)';
		document.querySelector('#main .popupWrap').style.backgroundColor='#ffffff00';
 	 };
 };
 
function removeData(r_id){
	document.querySelector('#main .popupForm').style.display='block';
	document.querySelector('#main .popupWrap').style.backdropFilter='blur(2px)';
	document.querySelector('#main .popupWrap').style.backgroundColor='#ffffff61';
	
	var removeButton=document.createElement('button');
	removeButton.innerText="삭제";
	removeButton.setAttribute("onclick","location.href='/JMTrestaurant/restaurant/delete.do?r_id="+r_id+"'");
	
	if(document.querySelector('#main .popupWrap .popupFooter').children.length>0) document.querySelector('#main .popupWrap .popupFooter').firstElementChild.remove();
	document.querySelector('#main .popupWrap .popupFooter').append(removeButton);
}

function searchResult(){
	var searchColumn = document.getElementById('searchColumn').value;
	var searchValue = document.getElementById('searchValue').value;
	
	parameter="?currentPageNum="+currentPageNum+"&countDataInPage="+countDataInPage+"&countInPageGroup="+countInPageGroup+"&searchColumn="+searchColumn+"&searchValue="+searchValue;
	getData();
}

function clickPage(PageNum){
	currentPageNum=PageNum;
	searchResult();
}

function getData(){
	session_m_id=document.getElementById('m_id').value;
	session_level=document.getElementById('level').value;

	var tbody,tbodyHTML;
 	
 	tbody=document.querySelector('tbody');
 	tbodyHTML="";
 	xhr=new XMLHttpRequest();
 	xhr.onreadystatechange=function(ele){
 		if(xhr.readyState==4 && xhr.status==200){
 		 	var result = JSON.parse(xhr.responseText);
 		 	var data = result.data;
 		 	var totalDataCount = result.totalDataCount;
 		 	
 			for(value of data){
 				tbodyHTML+="<tr>";
 				tbodyHTML+="<td>"+value.num+"</td>";
 				tbodyHTML+="<td><a href='./detail.do?r_id="+value.r_id+"'>"+value.name+"</a></td>";
 				tbodyHTML+="<td>"+value.addr+"</td>";
 				tbodyHTML+="<td>"+value.m_id+"</td>";
 				tbodyHTML+="<td>"+value.reg_date+"</td>";
 				if((session_m_id || session_m_id!='null') && session_level==1){
 					tbodyHTML+="<td><button type=\"button\" onclick=\"location.href='/JMTrestaurant/restaurant/edit.do?r_id="+value.r_id+"'\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></button><button type=\"button\" onclick=\"removeData('"+value.r_id+"')\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></button></td>";
 				}
 				tbodyHTML+="</tr>";
 			}
 			tbody.innerHTML=tbodyHTML;
 			
 			var countTotalPage=Math.ceil(totalDataCount/countDataInPage);
 			var PageGroup = (Math.floor(currentPageNum/countInPageGroup));
 			if(PageGroup>0 && (Math.floor(currentPageNum%countInPageGroup))==0){
 				PageGroup-=1;
 			}
 			var startPageGroupNum = ((PageGroup)*countInPageGroup)+1;
 			var endPageGroupNum = startPageGroupNum+(countInPageGroup-1);
 			if(endPageGroupNum>=countTotalPage) endPageGroupNum=countTotalPage;
 			var pageGroupHTML='';
 			
 			if(endPageGroupNum>countInPageGroup) pageGroupHTML+='<span class="active" onclick="clickPage('+(startPageGroupNum-2)+')">이전</span>';
 			console.log('currentPageNum : '+currentPageNum,' PageGroup : '+PageGroup,' startPageGroupNum : '+startPageGroupNum,' endPageGroupNum : '+endPageGroupNum);
 			var activeClass='';
 			for(var i=startPageGroupNum;i<=endPageGroupNum;i++){
 				activeClass='';
 				if(currentPageNum==i) activeClass='active';
 				pageGroupHTML+='<span class="'+activeClass+'" onclick="clickPage('+i+')">'+i+'</span>';
 			}
 			if(endPageGroupNum<countTotalPage) pageGroupHTML+='<span class="active" onclick="clickPage('+(endPageGroupNum+1)+')">다음</span>';
 			document.getElementById('pageGroup').innerHTML=pageGroupHTML;	
 		}
 	};
 	xhr.open('post','/JMTrestaurant/restaurant/list.do'+parameter);
 	xhr.send();
}