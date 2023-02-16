$(function(){
	$('#submit').click(function(){
		var m_id =$('input[name="m_id"]').val();
		var password =$('input[name="password"]').val();
		
		$('.infoWarning').remove();
		if(!m_id || m_id == ""){
			$('input[name="m_id"]').focus();
			$('input[name="m_id"]').after('<p class="infoWarning">아이디를 확인하세요.</p>');
			return false;
		}
		if(!password || password == ""){
			$('input[name="password"]').focus();
			$('input[name="password"]').after('<p class="infoWarning">비밀번호를 확인하세요.</p>');
			return false;
		}
		
		$.ajax({
			url:'/JMTrestaurant/login.do',
			type:'post',
			data:{
				m_id:m_id,
				password:password
			},
			dataType:'json',
			success:function(result){
				var data = result.data;
				
				if(data!='empty'){
					location.replace('/JMTrestaurant/');
				}else{
					alert('로그인에 실패하였습니다.');
				}
			}
		})
	});	
});