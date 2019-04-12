window.onload = function() {
	window.fbAsyncInit = function() {
		console.log('들어오는지?');
		    FB.init({
		      appId      : '1073792512792998',
		      cookie     : true, 
		                          
		      xfbml      : true,  
		      version    : 'v3.2' 
		    });
		
		    FB.getLoginStatus(function(response) {
		      statusChangeCallback(response);
		    });
		
		 };//////window.fbAsyncInit()

	(function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "https://connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));
	/////////////////



	function statusChangeCallback(response) {
    
	    if (response.status === 'connected') {
	     // testAPI();
	    	console.log('Logged in and authenticated');
	    	setElements(true);
	    	testAPI();
	    } else {
	     
	    	console.log('Not authenticated');
	    	setElements(false);
	    }
  }//////////////statusChangeCallback()

	
	function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	}///////checkLoginState()
  

	function setElements(isLoggedIn) {
		if(isLoggedIn) {
			document.getElementById('profile').style.display = 'block';
			document.getElementById('fb-btn').style.display = 'none';
			document.getElementById('logout').style.display = 'block';
			document.getElementById('feed').style.display = 'block';
		} else {
			document.getElementById('profile').style.display = 'none';
			document.getElementById('fb-btn').style.display = 'block';
			document.getElementById('logout').style.display = 'none';
			document.getElementById('feed').style.display = 'none';
		}
		
	}////////setElements()
	
	function logout() {
		FB.logout(function(response){
			setElements(false);
		})
	}/////////logout()
	
	function testAPI() {  
	    FB.api('/me?fields=name,email,birthday, picture', function(response) {
	      if(response && !response.error) {
	    	  console.log(response);
	    	  buildProfile(response);
	    	  callController(response);
	      }
	      
	      FB.api('/me/feed', function(response) {
	    	  if(response && !response.error) {
		    	  buildFeed(response);
		      }
	      });
	      
	      document.getElementById('statusImg').src = response.picture.data.url;
	      $('#fimgsrc').prop('value', response.picture.data.url);
	    });
	 }////////testAPI()
	
	
	/////
	

	function callController(user) {
		
		$('#fname').prop('value', user.name);
		$('#femail').prop('value', user.email);
		$('#fbirthday').prop('value', user.birthday);
		
	}

	 function buildProfile(user) {
		 let profile = `
			 <h3>[${user.name}] 프로필</h3>
			 <ul class="list-group">
			 	<li class='list-group-item'>이름: ${user.name}</li>
			 	<li class='list-group-item'>이메일: ${user.email}</li>
			 	<li class='list-group-item'>생일: ${user.birthday}</li>
			 	<li class='list-group-item'>아이디 : ${user.id}</li>
			 </ul>
		 `;
		 
		 document.getElementById('profile').innerHTML = profile;
		 
	 }///////////buildProfile
	 

	 function buildFeed(feed) {
		 let output = '<h3>[최근 내 포스팅]</h3>';
		 for(let i in feed.data) {
			 if(feed.data[i].message) { 
				 output += `
					 <div>
					 	${feed.data[i].message} <span>${feed.data[i].created_time}</span>
					 </div>
				 `;
			 }
		 }
		 
		 document.getElementById('feed').innerHTML = output;
	 }////////////buildFeed()
	 
	 
	 function post() {
		 FB.api('/me/feed', 'post', {message: '내 상태'}, function(response) {
	    	  if(response && !response.error) {
		    	  document.getElementById('***').innerHTML = response.id;  //불필요 한듯
		      }
	      });
	 }
	 
	 function shareLink() {
		 FB.api('/me/feed', 'post', {link: '링크'}, function(response) {
	    	  if(response && !response.error) {
		    	  document.getElementById('***').innerHTML = response.id;  //불필요 한듯
		      }
	      });
	 }
	 
	 function uploadPhoto() {
		 FB.api('/me/photos', 'post', {url: '링크'}, function(response) {
	    	  if(response && !response.error) {
		    	  document.getElementById('***').innerHTML = response.id;  //불필요 한듯
		      } else {
		    	  document.getElementById('***').innerHTML = "에러";  //불필요 한듯
		      }
	      });
	 }
	 
/*});*/}	
