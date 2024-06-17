<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.MemberVO, action.MemberLoginAction"%>

<!DOCTYPE html>
<html lang="ko">


<!-- // //HTTP 1.0. response.setHeader("Pragma", "no-cache"); /* 캐시를 쌓지 못함 */ -->
<!-- // //Proxy : Client와 Server사이에 위치하여 요청을 중계하는 역할을 하는 서버 -->
<!-- // response.setHeader("Expries", "0"); // 쌓이지 못하게 만료처리 //HTTP 1.1. -->
<!-- // response.setHeader("Cache-Control", "no-store, no-cache, -->
<!-- // must-revalidate"); // must-revalidate 유효성 다시 재요청 // 전반적인 캐시를 제어 한다. -->
<!-- 방문기록을 저장하지 않는다. 캐시를 저장하지 않는다.  -->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport" />
<title>렌트어때</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sub.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard-dynamic-subset.min.css" />
<link rel="icon" href="<%=request.getContextPath()%>/favicon.png">


<script defer src="<%=request.getContextPath()%>/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

</head>
	<%
		response.setHeader("Pragma", "no-cache"); /* 캐시를 쌓지 못함 */
		response.setHeader("Expries", "0"); // 쌓이지 못하게 만료처리
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate"); // must-revalidate 유효성 다시 재요청
		// 전반적인 캐시를 제어 한다.  방문기록을 저장하지 않는다.  캐시를 저장하지 않는다.
	%>
<body>

	<header id="header">
		<div class="h-inner">
			<h1 class="h-logo">
				<a href="<%=request.getContextPath()%>/index.jsp"> <img
					src="<%=request.getContextPath()%>/images/logo_blue.png"
					alt="렌트어때 로고">
				</a>
			</h1>
			<nav class="pc">
                <ul class="nav-menu">
                    <li class="nav-menu-btn"><a href="<%=request.getContextPath()%>/sub/carBookHome.jsp">렌트카 예약</a></li>
                    <li class="nav-menu-btn"><a href="<%=request.getContextPath()%>/board/promoBoard.jsp">이벤트</a></li>
                    <li class="nav-menu-btn"><a href="<%=request.getContextPath()%>/board/annoBoard.jsp">공지사항</a></li>
                    <li class="nav-menu-btn">
                        <a href="#">고객센터</a>
                        <ul class="sub-menu">
                            <li>
                                <a href="#" onclick="clickEvent()">자주 묻는 질문</a>
                            </li>
                            <li>
                                <a href="#" onclick="clickEvent()">예약 상담 및 문의</a>
                            </li>
                            <li>
                                <a href="#" onclick="clickEvent()">차량 반납 안내</a>
                            </li>
                            <li>
                                <a href="#" onclick="clickEvent()">이용 후기</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
			<div class="login pc">
				<%
				String name = (String) session.getAttribute("memberName");
				String id = (String) session.getAttribute("memberId");
				String status = (String) session.getAttribute("memberStatus");
				%>
				<%
				if (status == null) {
				%>
					<span>
				<a href="<%=request.getContextPath()%>/sub/loginhome.jsp">
						로그인/회원가입
				</a>
					</span>
				<%
				} else if (status.equals("active")) {
				%>
					<span>
						<a href="<%=request.getContextPath()%>/mypage/mypage.jsp">
							<%=name%>님 마이 페이지
						</a>
					</span>
				<%
				String url = request.getRequestURL().toString();
				if (url.contains("/rental/mypage/mypage.jsp") || url.contains("/rental/board/") || url.contains("/rental/sub/")) {
				%>
					<span>
						<a href="../memberLogout.jsp" id="logout" class='logout'>
							로그아웃
						</a>
					</span>
				<%
				} else {
				%>
					<span>
						<a href="./memberLogout.jsp" id="logout" class='logout'>
							로그아웃
						</a>
					</span>
				<%
				}
				%>
				<!-- 서블릿으로 처리하여 컨트롤러 타게 해야겠음.  -->
				<%
				} else if (status.equals("admin")) {
				%>
				<a
					href="<%=request.getContextPath()%>/adminDashBoard.jsp?urlName=dashBoardInclude/membermng.jsp">
					<span><%=name%>님 관리자 페이지 </span>
				</a>
				<%
				String url = request.getRequestURL().toString();
				if (url.contains("/rental/mypage/mypage.jsp") || url.contains("/rental/board/") || url.contains("/rental/sub/")) {
				%>
					<a href="../memberLogout.jsp" id="logout" class='logout'>
						<span>로그아웃</span>
					</a>
				<%
				} else {
				%>
					<a href="./memberLogout.jsp" id="logout" class='logout'>
						<span>로그아웃</span>
					</a>
				<%
				}
				%>
				<%
				} else {
				%>
				<a href="<%=request.getContextPath()%>/sub/loginhome.jsp">
					<span>
						로그인/회원가입
					</span>
				</a>
				<%
				}
				%>
			</div>
			
			<div class="nav_m">
                <div class="burger_box">
                    <input class="burger-check" type="checkbox" id="burger-check" />
                    <label class="burger-icon" for="burger-check">
                        <span class="burger-sticks"></span>
                    </label>
                    
                    <div class="menu">
                        <nav>
                            <ul class="nav-menu-mo">
                                <li class="nav-menu-btn-mo"><a href="<%=request.getContextPath()%>/sub/carBookHome.jsp">렌트카 예약</a></li>
                                <li class="nav-menu-btn-mo"><a href="<%=request.getContextPath()%>/board/promoBoard.jsp">이벤트</a></li>
                                <li class="nav-menu-btn-mo"><a href="<%=request.getContextPath()%>/board/annoBoard.jsp">공지사항</a></li>
                                <li class="nav-menu-btn-mo ">
                                    <div id="Accordion_wrap">         
                                        <div class="accordion_box">
                                            <div class="accordion-btn">
                                                <span class="font-bo">고객센터</span>
                                            </div>
                                            <div class="accordion-menu">
                                                <a href="#" onclick="clickEvent()">자주 묻는 질문</a>
                                                <a href="#" onclick="clickEvent()">예약 상담 및 문의</a>
                                                <a href="#" onclick="clickEvent()">차량 반납 안내</a>
                                                <a href="#" onclick="clickEvent()">이용 후기</a>
                                            </div>

                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                        <div class="login">
                            <%
								name = (String) session.getAttribute("memberName");
								id = (String) session.getAttribute("memberId");
								status = (String) session.getAttribute("memberStatus");
							%>
							<%
							if (status == null) {
							%>
							<a href="<%=request.getContextPath()%>/sub/loginhome.jsp"> 
								<span>로그인/회원가입</span>
							</a>
							<%
							} else if (status.equals("active")) {
							%>
							<a href="<%=request.getContextPath()%>/mypage/mypage.jsp"> 
								<span>
									<%=name%>님 마이 페이지
								</span>
							</a>
							<%
							String url = request.getRequestURL().toString();
							if (url.contains("/rental/mypage/mypage.jsp") || url.contains("/rental/board/") || url.contains("/rental/sub/")) {
							%>
								<a href="../memberLogout.jsp" id="logout" class='logout'>
									<span>로그아웃</span>
								</a>
							<%
							} else {
							%>
							<a href="./memberLogout.jsp" id="logout" class='logout'>
								<span>로그아웃</span>
							</a>
							<%
							}
							%>
							<!-- 서블릿으로 처리하여 컨트롤러 타게 해야겠음.  -->
							<%
							} else if (status.equals("admin")) {
							%>
							<a href="<%=request.getContextPath()%>/adminDashBoard.jsp?urlName=dashBoardInclude/membermng.jsp">
								<span><%=name%>님 관리자 페이지 </span>
							</a>
							<%
							String url = request.getRequestURL().toString();
							if (url.contains("/rental/mypage/mypage.jsp") || url.contains("/rental/board/") || url.contains("/rental/sub/")) {
							%>
							<a href="../memberLogout.jsp" id="logout" class='logout'>
								<span>로그아웃</span>
							</a>
							<%
							} else {
							%>
							<a href="./memberLogout.jsp" id="logout" class='logout'>
								<span>로그아웃</span>
							</a>
							<%
							}
							%>
							<%
							} else {
							%>
							<a href="<%=request.getContextPath()%>/sub/loginhome.jsp">
								<span>로그인/회원가입</span>
							</a>
							<%
							}
							%>
                        </div>
                    </div>
                </div>
            </div>
	<script>
		document.getElementById('logout').addEventListener('click',
				function(event) {
					history.pushState(null, null, "./index.jsp");
					window.addEventListener('popstate', function() {
						history.pushState(null, null, "./index.jsp");
					});
				});
		
		function clickEvent(){
			alert('죄송합니다 준비중입니다.');
		}
	</script>
		</div>
	</header>