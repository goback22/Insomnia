<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
 -->


  <!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="<c:url value='/vendor/js/web-adapter.js'/>"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">



<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight:bolder;
		font-size:14px;
		overflow:hidden;
		margin:0;
	}
	input{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight:bolder;
		font-size:14px;
	}

	video{
		width:800px;
		height:600px;
	}
	
	.right-side-background{
		position:absolute;
		top:0;
		right:0;
		width:300px;
		height:600px;
		background:linear-gradient(to top, black, rgba(0,0,0,0) 66%);
	}
	.right-side{
		position:absolute;
		top:0;
		right:0;
		width:300px;
		height:540px;
		opacity:1;
	}
	.display-message{
		opacity:1;
		width:100%;
		margin-top:530px;
	}
	#input{
		display:-webkit-box;
		background-color:white;
		border-radius:30px;
		width:95%;
		margin:0 auto;
		margin-top: 560px;
	}
	#message{
		border:none;
		padding:5px;
		margin-left:15px;
		width:210px;
	}
	#sendBtn{
		margin: 5px 0px 0px 15px;
	}
	#minBtn{
		margin:5px 0 0 8px;
	}
	input:focus {
    	outline-offset:0;
	}
	:focus {
	    outline: none;'
	}
	
	.msg-img{
		width:35px;
		border-radius:50%;
		margin: 0px 10px -22px 10px;
	}
	.span-div{
		
	}
	
	.msg{
		margin:10px 0;
	}
	.msg-span{    
		color: gray;
    	font-size: 11px;
    	font-weight:500}
	.msg-p{
		margin: 0 0 0 55px;
		color:white;
		font-weight:100;
	}
	
	.entrance{
		background-color: beige;
	    border-radius: 50px;
	    margin: 5 auto;
	    text-align: center;
	    width: 90%;
	}
	.off{
		background-color: beige;
	    border-radius: 50px;
	    margin: 5 auto;
	    text-align: center;
	    width: 90%;
	}
	.my-msg{
		margin:10px 0;
		text-align:right;
		}
	.my-msg-span{color: gray;
    	font-size: 11px;
    	font-weight:500}
	.my-msg-img{
		width:35px;
		border-radius:50%;
		margin: 0px 10px -22px 10px;}
	.my-msg-p{
		margin: 0px 55px 0 10px;
		color:white;
		font-weight:100;}
	

</style>

</head>
<body>

	<div class="obj"></div>

	<div class="site-wrap">
		<!-- 동영상쪽 -->
		<div class="left-side">
			<!-- 비디오 -->
			<video id="gum-local" autoplay playsinline></video>
    		<button id="showVideo">Open camera</button>
		</div><!-- left-side -->
	
	
	
		<!-- 채팅쪽 -->
		<div class="right-side-background">
			<!-- 입출력버튼 -->
	    	<div id='input'>
		    	<input id='message'>
		    	<div id='sendBtn'><img style="width:16px;" src='<c:url value="/resource/img/stream_enter.png"/>'></div>
		    	<div id='minBtn'><img style="width: 16px;" src="<c:url value='/resource/img/stream_minimize.png'/>"></div>
	    	</div>
		</div>
		<div class="right-side">
			<div class="display-message"">
			</div>
    	</div><!-- right-side -->
    	
	</div><!-- site-wrap -->




<script src="<c:url value='/vendor/js/web-getUserMedia.js'/>"></script>
<script>
/////////////////////////// 2019 05 21 streaming 동영상에 웹소켓 채팅 구현

var wsocket;
var id;
$(function(){
	//웹소켓 시작
	//웹 소켓 객체로 서버에 연결하기
	wsocket = new WebSocket("ws://192.168.0.39:8080/insomnia/stream-ws.ins");
	wsocket.onopen = open;
	wsocket.onclose = function(){
		wsocket.send('off$' + id);
	};
	wsocket.addEventListener('message', message);
	
	//윈도우 강제 종료시 호출
	window.onbeforeunload = function(e){
		wsocket.send('off$' + id);
	};
	
	//사용자가 입력한 아이디 저장
	id = '${id}';
	
	 //퇴장버튼 클릭시]
    $('#chatExitBtn').one('click', function() {
       wsocket.send('off$' + id);
       wsocket.close();
       closeChat(); //채팅창 가리기
    });
    
    $('#sendBtn').click(function(){
    	sendMessage();
    });//sendBtn click
    
    //메시지 입력후 전송 버튼 클릭이 아닌 엔터키처리
    $('#message').on('keypress', function(e) {
       //console.log('e.keyCode:%s,e.which:%s',e.keyCode,e.which);
       var keyvalue = e.keyCode ? e.keyCode : e.which;
       if (keyvalue == 13) {//엔터 입력
          sendMessage();
       }
       e.stopPropagation();
    });
 });///// function 
 //팝업
 

 function closeChat() {
    $("#draggable").hide();
 };//function closeChat0
 
 //서버에 연결되었을 때 호출되는 함수
 var open = function(){
	 //서버로 연결한 사람의 정보(아이디)전송
	 wsocket.send('entrance$'+id);
 };//
 
 //서버에서 메세지를 받을때마다 호출되는 함수
 var message = function(e){
	 //서버로부터 받은 데이터는 이벤트객체(e).data속성에 저장되어 있다.
	 var receive = e.data;
	 var protocol = receive.split("$")[0];
	 var inputString = '';
	 
	 switch(protocol){
	 case "entrance":
		 inputString = "<div class='entrance'>"+receive.split("$")[1]+"</div>";
		 $('.display-message').append(inputString);
		 scroll();
		 break;
	 case "off":
		 inputString = "<div class='off'>" + receive.split("$")[1]+"</div>";
		 $('.display-message').append(inputString);
		 scroll();
		 break;
	 case "msg":
		 if(receive.split("$")[4] == id){
			 inputString = "<div class='my-msg'><span class='my-msg-span'>"+receive.split("$")[1]+"</span><img class='my-msg-img' src='"+receive.split("$")[2]+"'>" +
			 		"<p class='my-msg-p'>"+receive.split("$")[3]+"</p></div>";
			 $('.display-message').append(inputString);}
		 else{
			 inputString = "<div class='msg'><img class='msg-img' src='"+receive.split("$")[2]+"'><span class='msg-span'>"+receive.split("$")[1]+"</span>" +
		 		"<p class='msg-p'>"+receive.split("$")[3]+"</p></div>";
		 	$('.display-message').append(inputString);}
		 scroll();
		 break;
	 default:
		 console.log('처리되지 않은 프로토콜');
	 }//switch
 };//message

 
 //서버로 메세지 전송하는 함수
 var sendMessage = function(){
	 //서버로 메세지 전송
	 if($('#message').val().length != 0){
		 wsocket.send('msg$'+id+"$"+$('#message').val());
		 $('#message').val('');
		 $('#message').focus();
	 }///
 };//sendMessage
 
 function scroll(){
	 console.log($(".display-message"));
	 console.log($(".display-message").prop('clientHeight'));
	 var top = 547;
	 $(".display-message").css('marginTop', top-parseInt($(".display-message").prop('clientHeight')));
	 console.log($(".display-message").prop('margin-top'));
 }///scroll




</script>





<script>
/*
//https://developer.mozilla.org/ko/docs/Web/API/WebRTC_API/Signaling_and_video_calling
// singaling and video calling

function sendToOneUser(target, msgString){
	var isUnique = true;
	var i;
	
	for(i = 0; i<connectionArray.length; i++){
		if(connectionArray[i].username === target){
			connectionArray[i].sendUTF(msgString);
			break;
		}//if
	}//for
}//sendToOneUser

if(sendToClients){
	var msgString = JSON.stringify(msg);
	var i;
	
	//If the message specifies a target username, 
	//only send the message to them. Otherwise, send it to every user
	if(msg.target && msg.target !== undefined && msg.target.length !== 0){
		senddToOneUser(msg.target, msgString);
	}//if
	else{
		for(i = 0; i < connectionArray.length; i++){
			connectionArray[i].sendUTF(msgString);
		}//for
	}//else
}//if(sendToClients)
	
function sendToServer(msg){
	var msgJSON = JSON.stringify(msg);
	connection.send(msgJSON);
}

var mediaConstraints = {
		audio : true,
		video: true
};

function invite(evt){
	if(myPeerConnection){
		alert("you can't start a call because you already have one open!");
	}else{
		var clickedUsername = evt.target.textContent;
		
		if(clickedUsername === myUsername){
			alert("i'm afraid I cant't let you talk to yourself");
			return;
		}//if
	}//else
		targetUsername = clickedUsername;
		createPeerConnection();
		navigator.mediaDevices.getUserMedia(mediaConstraints).then(function(localStrream){
			document.getElementById("local_video").srcObject = localStream;
			myPeerConnection.addStream(localStream);
		}).catch(handleGetUserMediaError);
}//invite

function handleGetUserMediaError(e){
	switch(e.name){
	case "NotFoundError":
		alert("unable to open your call becaouse no camera and or microhpone where found");
		break;
	case "securityError":
	case "PermissionDeniedError":
		break;
		default:
			alert("error opening your camera and /or microphone : " e.message);
		break;
	}//switch
	closeVideoCall();
}//function HandleGetUserMediaError

var myHostname = window.location.hostname;
function createPeerConnection(){
	myPeerConnection = new RTCPeerConnection)({
		iceServers:[{
			urls:"turn:"+myHostname,
			username:"webrtc",
			credential:"turnserver"
		}]
	});
}//createPeerConnection

myPeerConnection.onicecandidate = handleICECandidateEvent;
myPeerConnection.onaddstream = handleAddStreamEvent;
myPeerConnection.onremovestream = handleRemoveStreamEvent;
myPeerConnection.oniceconnectiionstatechange = handleICEConnectionStateChangeEvent;
myPeerConnection.onsignalingstatechange = handleSignalingStateChangeEvent;
myPeerConnection.onnegetitationneeded = handleNegotiationNeededEvent;

function handleNegotiationNeededEvent(){
	myPeerConnection.createOffer().then(function(offer){
		return myPeerConnection.setLocalDescription(offer);
	}).then(function(){
		sendToServer({
			name : myUsername.
			target:targetUsername,
			type: "video-offer",
			sdp : myPeerConnection.localDescription
		})
	}).catch(reportError);//then
};//function handleNegotiationNeededEvent

function handleVideoOfferMsg(msg){
	var localStream = null;
	targetUsername = msg.name;
	createPeerConnection();
	var desc = new RTCSessionDescrption(msg.sdp);
	myPeerConnection.setRemoteDescription(desc).then(function(){
		return navigator.mediaDevices.getUserMedia(mediaConstraints);
	}).then(function(stream){
		localStream = stream;
		
		document.getElementById("local_video").srcObject = localStream;
		return myPeerConnection.addStream(localStream);
	}
}
*/

</script>
























