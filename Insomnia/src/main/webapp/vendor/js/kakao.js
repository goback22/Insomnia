
///카카오 초기화
Kakao.init('9db89cfefc1651dffe3e0d2694cd52c0');
   		
//로그인 메서드
function loginWithKakao() {
	
      Kakao.Auth.login({
	        success: function(authObj) {
	        		
	        	console.log(JSON.stringify(authObj));
	        	
	        	Kakao.API.request({
	        		url : '/v2/user/me',
	        		success : function(res){
	        			
	        			$('#socialId').prop('value', res.id);
	        			$('#socialName').prop('value', res.properties.nickname);
	        			$('#socialProfile').prop('value', res.properties.profile_image);
	        			$('#socialSite').prop('value', 'kakao');
	        			//$('#socialBirth').html();
	        			$('#socialEmail').prop('value', res.kakao_account.email);
	        			$('#socialForm').submit();
	        		},
	        		fail : function(res){
	        			
	        		}
	        	});//////Kakao.API.request
	        	
	     	    	
 	         },/////Kakao.Auth.login : success
 	              
 	        fail: function(error) {
                alert('카카오 로그인에 실패했습니다.' + JSON.stringify(err));
            }///Kakao.Auth.login : fail
 	         
      });/////////Kakao.Auth.login   	
     	            	
     	              
  };///////////loginWithKakao
		        
    
    
    
