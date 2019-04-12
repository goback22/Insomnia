<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function(){
		//서브들 숨기기...
// 		$("#memberfirstlevel ul").hide();
// 		$("#anotherfirstlevel ul").hide();
// 		$("#anotherfirstlevel2 ul").hide();
// 		$("#instrumentfirstlevel ul").hide();
		//
		
		//메뉴 클릭시 서브 나오기
// 		$("#memberfirstlevel").click(function(){
// 			$("#membersecondlevel").toggle();
// 		});
// 		$("#anotherfirstlevel").click(function(){
			
// 			$("#anothersecondlevel").toggle();
// 		});
// 		$("#anotherfirstlevel2").click(function(){
// 			$("#anothersecondlevel2").toggle();
// 		});
// 		$("#instrumentfirstlevel").click(function(){
// 			$("#instrumentsecondlevel").toggle();
// 		});
		
	});
</script>
<!-- top sidebar start -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/home.ins'/>">ISOMNIA</a>
				
				<a class="navbar-brand" href="">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Table
				</a>
				<a class="navbar-brand" href="">Chart</a>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<!-- side -->
				<ul id="active" class="nav navbar-nav side-nav">
					<li class="selected"><a href="<c:url value='/admin/index.ins'/>">관리자 메인</a></li>
					<li id="memberfirstlevel"><a href="#">회원관리<b class="caret"></b></a>
					<!--  -->
						<ul id="membersecondlevel">
						<li><a href="<c:url value='/admin/allmember.ins'/>">전체보기</a></li>
							<li><a href="<c:url value='/admin/newmember.ins'/>">신규회원</a></li>
							<li><a href="<c:url value='/admin/submember.ins'/>">방구석회원</a></li>
							
						</ul>
					</li>
					<li id="anotherfirstlevel"><a href="#">main content<b class="caret"></b></a>
					<!--  -->
						<ul id="anothersecondlevel">
							<li><a href="<c:url value='/admin/maincontent.ins'/>">main 신청 정보</a></li>
							<li><a href="#">second level 2</a></li>
						</ul>
					</li>
					<li id="anotherfirstlevel2"><a href="#">sub content?<b class="caret"></b></a>
						<!--  -->
						<ul id="anothersecondlevel2">
							<li><a href="#">second level 1</a></li>
							<li><a href="#">second level 2</a></li>
						</ul>
					</li>
					<li id="instrumentfirstlevel"><a href="#">물품 목록<b class="caret"></b></a>
						<!--  -->
						<ul id="instrumentsecondlevel">
							<li><a href="#">보유중</a></li>
							<li><a href="#">대여중</a></li>
						</ul>
					</li>
					<li><a href="#">결제관련</a></li>
					<li><a href="#">etc</a></li>
					<li><a href="#">etc</a></li>
				</ul>
				<!-- side end -->
				<!-- top -->
				<ul class="nav navbar-nav navbar-right navbar-user">
					<!-- 윗부분 -->
					
					<li class="dropdown messages-dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Messages<span class="badge">2</span>
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">
									<span class="message">메세지1</span>
								</a>
							</li>
							<li>
								<a href="#"> <span class="avatar"></span> 
									<span class="message">메세지2</span>
								</a>
							</li>
							<li class="divider"></li>
							<li><a href="#">Go to Inbox<span class="badge">2</span></a></li>
						</ul>
					</li>
					
					<li class="divider-vertical"></li>
					<li>
						<form class="navbar-search">
							<input type="text" placeholder="Search" class="form-control">
						</form>
					</li>
				</ul>
				<!-- top end -->
			</div>
		</nav>
		<!-- top sidebar end -->