Kakao.init('9db89cfefc1651dffe3e0d2694cd52c0');
   		
   		//여기부터
   		function loginWithKakao() {
		      Kakao.Auth.login({
		        success: function(authObj) {
		        	
		     	    	  Kakao.API.request({
	     	              url: '/v2/user/me',
	     	              success: function(res) {
	     	            	document.getElementById('kkname').innerHTML = res.properties.nickname;
	     	            	document.getElementById('kakaoStatusImg').src = res.properties.profile_image;
	     	            	document.getElementById('kkemail').innerHTML = res.kakao_account.has_email == true ? '이메일 있음' : '이메일 없음';
	     	            	$('#kname').prop('value', res.properties.nickname);
	     	    			$('#kimgsrc').prop('value', res.properties.profile_image);
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