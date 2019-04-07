
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- JQuery Migrate Plugin -->
<script src="vendor/js/jquery-migrate-1.4.1.min.js"></script>

<!-- site style sheets -->
<!-- Dependency Styles -->
<link rel="stylesheet"
	href="dependencies/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="dependencies/intro/css/stylesheet.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/swiper/swiper.min.css"
	type="text/css">
<link rel="stylesheet"
	href="dependencies/font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/wow/css/animate.css"
	type="text/css">
<link rel="stylesheet"
	href="dependencies/magnific-popup/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="dependencies/jquery-ui/css/jquery-ui.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/slick-carousel/css/slick.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/colornip/css/colornip.min.css"
	type="text/css">
<link rel="stylesheet" href="dependencies/css-loader/css/css-loader.css"
	type="text/css">

<!-- Site Stylesheet -->
<link rel="stylesheet" href="assets/css/woocommerce.css" type="text/css">
<link rel="stylesheet" href="assets/css/app.css" type="text/css">
<link id="theme" rel="stylesheet"
	href="assets/css/theme-color/theme-default.css" type="text/css">

<!-- fonts -->
<link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond"
	rel="stylesheet">


<style>
.user-login {
	padding-top: 7px;
}

.section-title.style-four {
	margin-top: 75px;
}

body {
	width: 100%;
	background-color: #171717;
}

#site {
	width: 100%;
}

/* 배너 */
.banner {
	width: 100%;
}

.banner-video {
	width: 100%;
}

.queen {
	width: 100%;
}

.banner-title {
	font-family: 'Cormorant Garamond', serif;
	border-bottom: 4px solid orange;
	color: white;
	position: absolute;
	padding: 80px;
	top: 300px;
	margin-left: 27%;
	font-size: 120px;
}
</style>

</head>
<body>

	
	<jsp:include page="../template/Nav.jsp"/>

	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<form class="form-inline" method="post"
		action="<c:url value='/home/supporters.ins'/>">
		<button type="submit" class="btn btn-primary">검색</button>

	</form>



	<table>

		<c:forEach var="record" items="${requestScope.list}">
			<tr>
				<td>이름 :${record.ID }</td>
			</tr>

		</c:forEach>
	</table>

