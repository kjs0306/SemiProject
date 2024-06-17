<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1">

<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport" />
<title>렌트어때</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dashheader.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/dashbody.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">	
    <link rel="icon" href="<%=request.getContextPath()%>/favicon.png">
	<script defer src="<%=request.getContextPath()%>/js/dashboard.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
</head>


<body>
	<div id="dash-wrap">
		<div class="dash-header">
			<h1 class="h_logo">
				<a href="<%=request.getContextPath()%>/index.jsp"> <img src="<%=request.getContextPath()%>/images/logo_white.png" alt=""> </a>
			</h1>
			<div class="dash-home">
			<a href="<%=request.getContextPath()%>/index.jsp">			
				렌트어때 홈
			</a>
			</div>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">회원 관리</li>
				<li class="tab-link" data-tab="tab-2">예약 관리</li>
				<li class="tab-link" data-tab="tab-3">차량 관리</li>
				<details>
					<summary> 게시판 관리 </summary>
					<ul class="tabs">
						<li class="tab-link" data-tab="tab-4">공지사항 게시판</li>
						<li class="tab-link" data-tab="tab-5">이벤트 게시판</li>
						<li class="tab-link" data-tab="tab-6">이용후기 게시판</li>
						<li class="tab-link" data-tab="tab-7">문의 및 상담 게시판</li>
					</ul>
				</details>
			</ul>

			<div class="dash-footer">
				<button onclick="window.location.href='./memberLogout.jsp';" id="logout"class="logout">로그아웃</button>
			</div>
		</div>
		<script>
	document.getElementById('logout').addEventListener('click', function(event) {
	    // 뒤로 가기 버튼 이벤트 막기
	    console.log("함수 실행");
	    history.pushState(null, null, "./index.jsp");
	    window.addEventListener('popstate', function () {
	        history.pushState(null, null, "./index.jsp");
	    });
	});
	</script>

		<div class="dash-body">