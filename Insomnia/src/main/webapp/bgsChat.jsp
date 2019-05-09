<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>방구석 채팅!</title>

<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 채팅 css -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
   <script>
      //웹 소켓 저장용
      var wsocket;
      //닉네임 저장용
      var nickname;
      $(function() {
         //웹소켓 시작       
         // 웹 소켓 객체로 서버에 연결하기
         wsocket = new WebSocket("ws://192.168.0.51:8082<c:url value='/chat-ws.ins'/>")
         wsocket.onopen = open;
         wsocket.onclose = function() {
            appendMessage('연결을 끊었어요')
         };
         wsocket.addEventListener('message', message);

         //사용자가 입력한 닉네임 저장
         nickname = '${id}';

         //퇴장버튼 클릭시]
         $('#chatExitBtn').one('click', function() {
            wsocket.send('exit:' + nickname);
            wsocket.close();
            closeChat(); //채팅창 가리기
         });
         //전송버튼 클릭시]
         $('#sendBtn').click(function() {
            send_message();
         });

         //메시지 입력후 전송 버튼 클릭이 아닌 엔터키처리
         $('#message').on('keypress', function(e) {
            //console.log('e.keyCode:%s,e.which:%s',e.keyCode,e.which);
            var keyvalue = e.keyCode ? e.keyCode : e.which;
            if (keyvalue == 13) {//엔터 입력
               send_message();
            }
            e.stopPropagation();
         });
      });///// function 
      //팝업
      function closeChat() {
         $("#draggable").hide();
      }
      //함수 정의]
      //서버에 연결되었을때 호출되는 함수
      var open = function() {
         //서버로 연결한 사람의 정보(닉네임) 전송
         wsocket.send('entrance:' + nickname);
      };

      //서버에서 메시지를 받을때마다 호출되는 함수
      var message = function(e) {
         //서버로부터 받은 데이타는 이베튼객체(e).data속성에 저장되어 있다
         var receive_message = e.data;
         var div_message = '';
         if (receive_message.search("msg:") != -1) {
            var name = receive_message.split(":")[0];
            var profile_img = "https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image/" + receive_message.split(":")[1];
//             var profile_img = './캡처.PNG';
            var id = receive_message.split(":")[3];
            var msg = receive_message.split(":")[4];
            var now = new Date();
            if (nickname != id) {
               div_message += '<div class="direct-chat-msg">';
               div_message += '<div class="direct-chat-info clearfix">';
               div_message += '<span class="direct-chat-name pull-left">'
                     + name + '</span>';
               div_message += '<span class="direct-chat-timestamp_pull-left">'
                     + now.getHours()
                     + ':'
                     + now.getMinutes()
                     + ':'
                     + now.getSeconds()
                     + '</span> </div>';
               div_message += '<div><img class="direct-chat-img" src="'+profile_img+'"+ alt="Message User Image">';
               div_message += '<div class="direct-chat-text">' + msg
                     + '</div></<div>';
               div_message += '</div>';
            } else {
               div_message += '<div class="direct-chat-msg right">';
               div_message += '<div class="direct-chat-info clearfix text_right">';
               div_message += '<span class="direct-chat-timestamp_pull-right">'
                     + now.getHours()
                     + ':'
                     + now.getMinutes()
                     + ':'
                     + now.getSeconds()
                     + '</span>';
               div_message += '<span class="direct-chat-name pull-right">'
                     + name + '</span></div>';
               div_message += '<img class="direct-chat-img" src="'+profile_img+'" alt="Message User Image">';
               div_message += '<div class="direct-chat-text">' + msg
                     + '</div>';
               div_message += '</div>';
            }
         } else if (receive_message.search("entrance") != -1) {
            div_message += '<div class="info">[INFO]'
                  + receive_message.split(":")[0] + '님이 접속하였습니다.</div>';
         } else if (receive_message.search("exit") != -1) {
            div_message += '<div class="info">[INFO]'
                  + receive_message.split(":")[0] + '님이 퇴장하셨습니다.</div>';
         }
         $('#chatMessage').append(div_message)
         $('#chatMessage').scrollTop($('#chatMessage').prop('scrollHeight'));
         //         if(receive_message.substring(0, 4)=='msg:')
         //            appendMessage(receive_message.substring(4));
      };
      //서버로 메시지 전송하는 함수]
      var send_message = function() {
         //서버로 메시지 전송
         if ($('#message').val().length != 0) {
            wsocket.send('msg:' + nickname + ":" + $('#message').val());
            //기존 메시지 클리어
            $('#message').val('');
            //포커스 주기
            $('#message').focus();
         }
      };
      //웹소켓 끝
   </script>

   <div class="draggable row bootstrap snippets" id="draggable">
      <div class="col-md-12">
         <!-- DIRECT CHAT PRIMARY -->
         <div class="box box-primary direct-chat direct-chat-primary">
            <!-- /.box-header -->
            <div class="box-header with-border">
               <h3 class="box-title">Free Chat</h3>

               <div class="box-tools pull-right">
                  <span data-toggle="tooltip" title="" class="badge bg-light-blue"
                     data-original-title="3 New Messages">3</span>
                  <button type="button" class="btn btn-box-tool"
                     data-widget="collapse">
                     <i class="fa fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-box-tool"
                     data-toggle="tooltip" title="Contacts"
                     data-widget="chat-pane-toggle">
                     <i class="fa fa-comments"></i>
                  </button>
                  <button type="button" class="btn btn-box-tool" id="chatExitBtn"
                     data-widget="remove" onclick="javascript:closeChat();">
                     <i class="fa fa-times"></i>
                  </button>
               </div>
            </div>

            <div class="box-body">
               <!-- Conversations are loaded here -->
               <div class="direct-chat-messages" id="chatMessage"></div>
               <!--/.direct-chat-messages-->

               <!-- Contacts are loaded here -->
               <div class="direct-chat-contacts">
                  <ul class="contacts-list">
                     <li><a href="#"> <img class="contacts-list-img"
                           src="https://bootdey.com/img/Content/user_1.jpg">
                           <div class="contacts-list-info">
                              <span class="contacts-list-name"> Count Dracula<small
                                 class="contacts-list-date pull-right">2/28/2015</small></span> <span
                                 class="contacts-list-msg">How have you been? I was...</span>
                           </div> <!-- /.contacts-list-info -->
                     </a></li>
                     <!-- End Contact Item -->
                  </ul>
                  <!-- /.contatcts-list -->
               </div>
               <!-- /.direct-chat-pane -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">

               <div class="input-group">
                  <input type="text" name="message" placeholder="메시지를 입력해 주세요~"
                     class="form-control" id="message"> <span
                     class="input-group-btn"> <input type="button"
                     class="btn btn-primary btn-flat" id="sendBtn" value="send" />
                  </span>
               </div>

            </div>
            <!-- /.box-footer-->
         </div>
         <!--/.direct-chat -->
      </div>
   </div>


</body>
<style>
.box {
   position: relative;
   border-radius: 3px;
   background: #ffffff;
   border-top: 3px solid #d2d6de;
   margin-bottom: 20px;
   width: 100%;
   box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}

.box.box-primary {
   border-top-color: #3c8dbc;
}

.box.box-info {
   border-top-color: #00c0ef;
}

.box.box-danger {
   border-top-color: #dd4b39;
}

.box.box-warning {
   border-top-color: #f39c12;
}

.box.box-success {
   border-top-color: #00a65a;
}

.box.box-default {
   border-top-color: #d2d6de;
}

.box.collapsed-box .box-body, .box.collapsed-box .box-footer {
   display: none;
}

.box .nav-stacked>li {
   border-bottom: 1px solid #f4f4f4;
   margin: 0;
}

.box .nav-stacked>li:last-of-type {
   border-bottom: none;
}

.box.height-control .box-body {
   max-height: 300px;
   overflow: auto;
}

.box .border-right {
   border-right: 1px solid #f4f4f4;
}

.box .border-left {
   border-left: 1px solid #f4f4f4;
}

.box.box-solid {
   border-top: 0;
}

.box.box-solid>.box-header .btn.btn-default {
   background: transparent;
   background-color: black;
   color: white;
}

.box.box-solid>.box-header .btn:hover, .box.box-solid>.box-header a:hover
   {
   background: rgba(0, 0, 0, 0.1);
}

.box.box-solid.box-default {
   border: 1px solid #d2d6de;
}

.box.box-solid.box-default>.box-header {
   color: #444;
   background: #d2d6de;
   background-color: #d2d6de;
}

.box.box-solid.box-default>.box-header a, .box.box-solid.box-default>.box-header .btn
   {
   color: #444;
}

.box.box-solid.box-primary {
   border: 1px solid #3c8dbc;
}

.box.box-solid.box-primary>.box-header {
   color: #fff;
   background: #3c8dbc;
   background-color: #3c8dbc;
}

.box.box-solid.box-primary>.box-header a, .box.box-solid.box-primary>.box-header .btn
   {
   color: #fff;
}

.box.box-solid.box-info {
   border: 1px solid #00c0ef;
}

.box.box-solid.box-info>.box-header {
   color: #fff;
   background: #00c0ef;
   background-color: #00c0ef;
}

.box.box-solid.box-info>.box-header a, .box.box-solid.box-info>.box-header .btn
   {
   color: #fff;
}

.box.box-solid.box-danger {
   border: 1px solid #dd4b39;
}

.box.box-solid.box-danger>.box-header {
   color: #fff;
   background: #dd4b39;
   background-color: #dd4b39;
}

.box.box-solid.box-danger>.box-header a, .box.box-solid.box-danger>.box-header .btn
   {
   color: #fff;
}

.box.box-solid.box-warning {
   border: 1px solid #f39c12;
}

.box.box-solid.box-warning>.box-header {
   color: #fff;
   background: #f39c12;
   background-color: #f39c12;
}

.box.box-solid.box-warning>.box-header a, .box.box-solid.box-warning>.box-header .btn
   {
   color: #fff;
}

.box.box-solid.box-success {
   border: 1px solid #00a65a;
}

.box.box-solid.box-success>.box-header {
   color: #fff;
   background: #00a65a;
   background-color: #00a65a;
}

.box.box-solid.box-success>.box-header a, .box.box-solid.box-success>.box-header .btn
   {
   color: #fff;
}

.box.box-solid>.box-header>.box-tools .btn {
   border: 0;
   box-shadow: none;
}

.box.box-solid[class*='bg']>.box-header {
   color: #fff;
}

.box .box-group>.box {
   margin-bottom: 5px;
}

.box .knob-label {
   text-align: center;
   color: #333;
   font-weight: 100;
   font-size: 12px;
   margin-bottom: 0.3em;
}

.box>.overlay, .overlay-wrapper>.overlay, .box>.loading-img,
   .overlay-wrapper>.loading-img {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%
}

.box .overlay, .overlay-wrapper .overlay {
   z-index: 50;
   background: rgba(255, 255, 255, 0.7);
   border-radius: 3px;
}

.box .overlay>.fa, .overlay-wrapper .overlay>.fa {
   position: absolute;
   top: 50%;
   left: 50%;
   margin-left: -15px;
   margin-top: -15px;
   color: #000;
   font-size: 20px;
}

.box .overlay.dark, .overlay-wrapper .overlay.dark {
   background: rgba(0, 0, 0, 0.5);
}

.box-header:before, .box-body:before, .box-footer:before, .box-header:after,
   .box-body:after, .box-footer:after {
   content: " ";
   display: table;
}

.box-header:after, .box-body:after, .box-footer:after {
   clear: both;
}

.box-header {
   color: white;
   background-color: black;
   display: block;
   padding: 10px;
   position: relative;
   display:none;
}

.box-header.with-border {
   border-bottom: 1px solid #f4f4f4;
}

.collapsed-box .box-header.with-border {
   border-bottom: none;
}

.box-header>.fa, .box-header>.glyphicon, .box-header>.ion, .box-header .box-title
   {
   display: inline-block;
   font-size: 3em;
   margin: 0;
   line-height: 1;
}

.box-header>.fa, .box-header>.glyphicon, .box-header>.ion {
   margin-right: 5px;
}

.box-header>.box-tools {
   font-size: 2em;
   position: absolute;
   right: 10px;
   top: 5px;
}

.box-header>.box-tools [data-toggle="tooltip"] {
   position: relative;
}

.box-header>.box-tools.pull-right .dropdown-menu {
   right: 0;
   left: auto;
}

.btn-box-tool {
   padding: 5px;
   font-size: 12px;
   background: transparent;
   color: #97a0b3;
}

.open .btn-box-tool, .btn-box-tool:hover {
   color: #606c84;
}

.btn-box-tool.btn:active {
   box-shadow: none;
}

.box-body {
   border-top-left-radius: 0;
   border-top-right-radius: 0;
   border-bottom-right-radius: 3px;
   border-bottom-left-radius: 3px;
   padding: 10px;
}

.no-header .box-body {
   border-top-right-radius: 3px;
   border-top-left-radius: 3px;
}

.box-body>.table {
   margin-bottom: 0;
}

.box-body .fc {
   margin-top: 5px;
}

.box-body .full-width-chart {
   margin: -19px;
}

.box-body.no-padding .full-width-chart {
   margin: -9px;
}

.box-body .box-pane {
   border-top-left-radius: 0;
   border-top-right-radius: 0;
   border-bottom-right-radius: 0;
   border-bottom-left-radius: 3px;
}

.box-body .box-pane-right {
   border-top-left-radius: 0;
   border-top-right-radius: 0;
   border-bottom-right-radius: 3px;
   border-bottom-left-radius: 0;
}

.box-footer {
   border-top-left-radius: 0;
   border-top-right-radius: 0;
   border-bottom-right-radius: 3px;
   border-bottom-left-radius: 3px;
   border-top: 1px solid #f4f4f4;
   padding: 10px;
   background-color: black;
}

.direct-chat .box-body {
   border-bottom-right-radius: 0;
   border-bottom-left-radius: 0;
   position: relative;
   overflow-x: hidden;
   padding: 0;
}

.direct-chat.chat-pane-open .direct-chat-contacts {
   -webkit-transform: translate(0, 0);
   -ms-transform: translate(0, 0);
   -o-transform: translate(0, 0);
   transform: translate(0, 0);
}

.direct-chat-messages {
   -webkit-transform: translate(0, 0);
   -ms-transform: translate(0, 0);
   -o-transform: translate(0, 0);
   transform: translate(0, 0);
   padding: 10px;
   height: 525px;
   overflow: auto;
   background-color: black;
}

.direct-chat-msg, .direct-chat-text {
   display: block;
   font-size: 20px;
}

.direct-chat-msg {
   margin-bottom: 10px;
}

.direct-chat-msg:before, .direct-chat-msg:after {
   content: " ";
   display: table;
}

.direct-chat-msg:after {
   clear: both;
}

.direct-chat-messages, .direct-chat-contacts {
   -webkit-transition: -webkit-transform .5s ease-in-out;
   -moz-transition: -moz-transform .5s ease-in-out;
   -o-transition: -o-transform .5s ease-in-out;
   transition: transform .5s ease-in-out;
}

.direct-chat-text {
   border-radius: 5px;
   position: relative;
   padding: 5px 10px;
   background: #d2d6de;
   border: 1px solid #d2d6de;
   margin: 5px 0 0 5px;
   color: #444;
}

.direct-chat-text:after, .direct-chat-text:before {
   position: absolute;
   right: 100%;
   top: 15px;
   border: solid transparent;
   border-right-color: #d2d6de;
   content: ' ';
   height: 0;
   width: 0;
   pointer-events: none;
}

.direct-chat-text:after {
   border-width: 5px;
   margin-top: -5px;
}

.direct-chat-text:before {
   border-width: 6px;
   margin-top: -6px;
}

.right .direct-chat-text {
   margin-right: 10px;
   margin-left: 0;
   max-width:85%;
}

.right .direct-chat-text:after, .right .direct-chat-text:before {
   right: auto;
   left: 100%;
   border-right-color: transparent;
   border-left-color: #d2d6de;
}

.direct-chat-img {
   border-radius: 50%;
   float: left;
   width: 40px;
   height: 40px;
}



.right > direct-chat-img {
   float: right;
   
}


.right .direct-chat-img {
   float: right;
}

.direct-chat-info {
   display: block;
   margin-bottom: 2px;
   font-size: 20px;
   color: white;
}

.direct-chat-name {
   font-weight: 600;
   font-size: 20px;
}

.direct-chat-timestamp {
   color: #999;
}

.direct-chat-timestamp_pull-left {
   margin-left: 10px;
   text-align: left;
}

.direct-chat-timestamp_pull-right {
   margin-right: 10px;
   text-align: right;
}

.text_right {
   text-align: right;
}

.direct-chat-contacts-open .direct-chat-contacts {
   -webkit-transform: translate(0, 0);
   -ms-transform: translate(0, 0);
   -o-transform: translate(0, 0);
   transform: translate(0, 0);
}

.direct-chat-contacts {
   -webkit-transform: translate(101%, 0);
   -ms-transform: translate(101%, 0);
   -o-transform: translate(101%, 0);
   transform: translate(101%, 0);
   position: absolute;
   top: 0;
   bottom: 0;
   height: 250px;
   width: 100%;
   background: #222d32;
   color: #fff;
   overflow: auto;
}

.contacts-list>li {
   border-bottom: 1px solid rgba(0, 0, 0, 0.2);
   padding: 10px;
   margin: 0;
}

.contacts-list>li:before, .contacts-list>li:after {
   content: " ";
   display: table;
}

.contacts-list>li:after {
   clear: both;
}

.contacts-list>li:last-of-type {
   border-bottom: none;
}

.contacts-list-img {
   border-radius: 50%;
   width: 40px;
   float: left;
}

.contacts-list-info {
   margin-left: 10px;
   color: #fff;
}

.contacts-list-name, .contacts-list-status {
   display: block;
}

.contacts-list-name {
   font-weight: 600;
}

.contacts-list-status {
   font-size: 12px;
}

.contacts-list-date {
   color: #aaa;
   font-weight: normal;
}

.contacts-list-msg {
   color: #999;
}


.direct-chat-text{
   text-align: left;
   float: left;
   width: fit-content;
   max-width: 85%;
}
.right>.direct-chat-text{
   text-align: right;
   float: right;
   width: fit-content;

}


.direct-chat-danger .right>.direct-chat-text {
   background: #dd4b39;
   border-color: #dd4b39;
   color: #fff;
}

.direct-chat-danger .right>.direct-chat-text:after, .direct-chat-danger .right>.direct-chat-text:before
   {
   border-left-color: #dd4b39;
}

.direct-chat-primary .right>.direct-chat-text {
   background: #3c8dbc;
   border-color: #3c8dbc;
   color: #fff;
}

.direct-chat-primary .right>.direct-chat-text:after,
   .direct-chat-primary .right>.direct-chat-text:before {
   border-left-color: #3c8dbc;
}

.direct-chat-warning .right>.direct-chat-text {
   background: #f39c12;
   border-color: #f39c12;
   color: #fff;
}

.direct-chat-warning .right>.direct-chat-text:after,
   .direct-chat-warning .right>.direct-chat-text:before {
   border-left-color: #f39c12;
}

.direct-chat-info .right>.direct-chat-text {
   background: #00c0ef;
   border-color: #00c0ef;
   color: #fff;
}

.direct-chat-info .right>.direct-chat-text:after, .direct-chat-info .right>.direct-chat-text:before
   {
   border-left-color: #00c0ef;
}

.direct-chat-success .right>.direct-chat-text {
   background: #00a65a;
   border-color: #00a65a;
   color: #fff;
}

.direct-chat-success .right>.direct-chat-text:after,
   .direct-chat-success .right>.direct-chat-text:before {
   border-left-color: #00a65a;
}

.form-control {
   background-color: black;
   color: white;
   height: 60px;
   font-size: 20px;
}

.info {
   border-radius: 30px;
   background-color: gray;
   color: white;
   text-align: center;
   font-size: 20px;
}
html{
   overflow: hidden;
}
#sendBtn{
   width: 90px;
   height:60px; 
   
}
</style>
</html>