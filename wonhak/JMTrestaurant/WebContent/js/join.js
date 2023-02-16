$(function(){
	$('#submit').click(function(){
		var m_id =$('input[name="m_id"]').val();
		var password =$('input[name="password"]').val();
		var password_re =$('input[name="password_re"]').val();
		var name =$('input[name="name"]').val();
		var email =$('input[name="email"]').val();
		var age =$('select[name="age"]').val();
		var gender =$('input:radio[name="gender"]:checked').val();
		
		console.log(m_id,password,password_re,name,email,age,gender);
		
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
		if(password != password_re){
			$('input[name="password_re"]').focus();
			$('input[name="password_re"]').after('<p class="infoWarning">비밀번호가 일치하지 않습니다.</p>');
			return false;
		}
		if(!name || name == ""){
			$('input[name="name"]').focus();
			$('input[name="name"]').after('<p class="infoWarning">이름을 확인하세요.</p>');
			return false;
		}
		
		$.ajax({
			url:'/JMTrestaurant/join.do',
			type:'post',
			data:{
				m_id:m_id,
				password:password,
				name:name,
				email:email,
				age:age,
				gender:gender
			},
			dataType:'json',
			success:function(result){
				var data = result.data;
				
				if(data=='success'){
					alert('가입이 완료되었습니다.');
					location.replace('/JMTrestaurant/login.do');
				}else if(data=='fail, exists m_id'){
					alert('이미 존재하는 계정입니다.');
				}else{
					alert('내용을 다시 한번 확인해주세요.');
				}
			}
		})
	});	
});