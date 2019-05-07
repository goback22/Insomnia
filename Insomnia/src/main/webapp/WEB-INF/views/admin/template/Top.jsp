<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

</style>
<script>
$(function(){
	
	
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
				
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<!-- side -->
				<ul id="active" class="nav navbar-nav side-nav">
					<li class="firstlevel"><a href="<c:url value='/admin/index.ins'/>">관리자 메인</a>
						
					</li>	
					<li class="firstlevel"><a href="#">회원관리<b class="caret"></b></a>
					<!--  -->
						<ul class="secondlevel">
							<li><a href="<c:url value='/admin/allmember.ins'/>">전체보기</a></li>
							<li><a href="<c:url value='/admin/newmember.ins'/>">신규회원</a></li>
<%-- 							<li><a href="<c:url value='/admin/maincontentmember.ins'/>">main(band)목록</a></li> --%>
<%-- 							<li><a href="<c:url value='/admin/subcontent.ins'/>">sub 목록</a></li> --%>
						</ul>
					</li>
					<li class="firstlevel"><a href="#">main content<b class="caret"></b></a>
					<!--  -->
						<ul class="secondlevel">
							<li><a href="<c:url value='/admin/maincontentmember.ins'/>">main(band)목록</a></li>
							<li><a href="<c:url value='/admin/maincontentsubmit.ins'/>">진행중인 밴드목록</a></li>
							<li><a href="<c:url value='#'/>">band bbs(not yet)</a></li>
						</ul>
					</li>
					<li class="firstlevel"><a href="#">sub content?<b class="caret"></b></a>
						<!--  -->
						<ul class="secondlevel">
							<li><a href="<c:url value='/admin/subcontent.ins'/>">sub 목록 & 신청회원보기</a></li>
							<li><a href="#">sub bbs(not yet)</a></li>
						</ul>
					</li>
					<li class="firstlevel"><a href="#">결제관련<b class="caret"></b></a>
						<!--  -->
						<ul class="secondlevel">
							<li><a href="<c:url value='/admin/paymain.ins'/>">main 결제</a></li>
							<li><a href="<c:url value='/admin/paysub.ins'/>">sub 결제(ing)</a></li>
						</ul>
					</li>
					<li><a href="#">etc</a></li>
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