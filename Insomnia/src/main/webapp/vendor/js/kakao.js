
Kakao.init('9db89cfefc1651dffe3e0d2694cd52c0');
   		
   		//여기부터
   		function loginWithKakao() {
		      Kakao.Auth.login({
		        success: function(authObj) {
		        	
		     	    	  Kakao.API.request({
	     	              url: '/v2/user/me',
	     	              success: function(res) {
	     	            	  
	     	            	$('#socialId').html(res.id);
	     	            	$('#socialName').html(res.properties.nickname);
	     	            	$('#socialProfile').html(res.properties.profile_image);
	     	            	$('#socialSite').html('kakao');
	     	            	
	     	            	$('#socialForm').submit();
	     	              }, 
	     	              
	     	    fail: function(error) {
      	                alert('카카오 로그인에 실패했습니다.');
      	              	}
       	         });   	
		     	            	
		     	              
		        },
		        fail: function(err) {
		          alert(JSON.stringify(err));
		        }
		      });
    };
    
    
    
