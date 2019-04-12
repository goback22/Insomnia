Kakao.init('9db89cfefc1651dffe3e0d2694cd52c0');
   		
   		//여기부터
   		function loginWithKakao() {
		      Kakao.Auth.login({
		        success: function(authObj) {
		        	
		     	    	  Kakao.API.request({
	     	              url: '/v2/user/me',
	     	              success: function(res) {
	     	            	
	     	            	$('#socialName').prop('value', res.properties.nickname);
	     	            	$('#socialEmail').prop('value', res.properties.nickname);
	     	            	$('#socialProfile').prop('value', res.properties.nickname);
	     	            	$('#socialBirth').prop('value', res.properties.nickname);
	     	            	
	     	            	$('#socialForm').submit();
	     	            	  
	     	              }, 
	     	              
	     	    fail: function(error) {
      	                alert(JSON.stringify(error));
      	              	}
       	         });   	
		     	            	
		     	              
		        },
		        fail: function(err) {
		          alert(JSON.stringify(err));
		        }
		      });
    };