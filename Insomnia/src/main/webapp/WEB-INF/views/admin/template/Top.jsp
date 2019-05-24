<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- top sidebar start -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="<c:url value='/home.ins'/>" style="margin-left:35px;color:#800000;font:bold;font-size:1.5em;">I S O M N I A</a>
<%-- 				<img src="<c:url value='/resource/img/logo_5.png'/>" alt="ISOMNIA"> --%>
				
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
					<li class="firstlevel"><a href="#">밴드<b class="caret"></b></a>
					<!--  -->
						<ul class="secondlevel">
							<li><a href="<c:url value='/admin/maincontentmember.ins'/>">밴드 관리</a></li>
							<li><a href="<c:url value='/admin/maincontentsubmit.ins'/>">펀딩 진행중</a></li>
<%-- 							<li><a href="<c:url value='#'/>">band bbs(not yet)</a></li> --%>
						</ul>
					</li>
					<li class="firstlevel"><a href="#">방구석 기타리스트<b class="caret"></b></a>
						<!--  -->
						<ul class="secondlevel">
							<li><a href="<c:url value='/admin/subcontent.ins'/>">방구석 회원관리</a></li>
<!-- 							<li><a href="#">sub bbs(not yet)</a></li> -->
						</ul>
					</li>
					<li class="firstlevel"><a href="#">결제관련<b class="caret"></b></a>
						<!--  -->
						<ul class="secondlevel">
							<li><a href="<c:url value='/admin/paymain.ins'/>">밴드 결제 현황</a></li>
<%-- 							<li><a href="<c:url value='/admin/paysub.ins'/>">방구석 기타리스트</a></li> --%>
						</ul>
					</li>
<!-- 					<li><a href="#">etc</a></li> -->
<!-- 					<li><a href="#">etc</a></li> -->
<!-- 					<li><a href="#">etc</a></li> -->
				</ul>
				<!-- side end -->
				<!-- top 
				<ul class="nav navbar-nav navbar-right navbar-user">
					
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
				</ul>-->
				<!-- top end -->
			</div>
		</nav>
		<!-- top sidebar end -->