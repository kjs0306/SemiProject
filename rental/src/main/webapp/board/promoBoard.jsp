<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<div class="inner">
	<div id="board-main">
		<div class="board-inner">
		<h1 class="board-title">이벤트</h1>

		<div class="board-search-box">
			<form action="" class="board-search">
				<select name="" id="">
					<option value="">선택안함</option>
					<option value="">제목</option>
					<option value="">작성자</option>
				</select> <input type="text">

				<button type="submit">검색</button>
			</form>
		</div>

		<%
		String status2 = (String) session.getAttribute("memberStatus");
		if (status2 == null) {
			status2 = "";
		}
		;
		%>
		<div class="board-list-box">
			<%
			if (status2.equals("admin")) {
			%>
			<div class="board-top-btn-box">
				<a class="admin-mode addwrite"
					href="<%=request.getContextPath()%>/board/promoBoardWrite.jsp">글
					등록</a>
			</div>
			<%
			}
			%>
			<ul class="promo-list">
				<li><a href=""> <img
						src="<%=request.getContextPath()%>/images/event_img_01.png" alt="">
						<div class="promo-title">안양지역 전 지점 최대 55% 할인</div>
				</a> <%
 if (status2.equals("admin")) {
 %> <span>
						<button class="admin-mode">수정</button>
						<button class="admin-mode">삭제</button>
				</span> <%
 }
 %></li>

				<li><a href=""> <img
						src="<%=request.getContextPath()%>/images/event_img_02.png" alt="">
						<div class="promo-title">안양지점 카니발 대여 시 요금 할인</div>
				</a>  <%
 if (status2.equals("admin")) {
 %> <span>
						<button class="admin-mode">수정</button>
						<button class="admin-mode">삭제</button>
				</span> <%
 }
 %></li>

				<li><a href=""> <img
						src="<%=request.getContextPath()%>/images/event_img_03.png" alt="">
						<div class="promo-title">서울 안심 픽업 서비스 출시 기념</div>
				</a>  <%
 if (status2.equals("admin")) {
 %> <span>
						<button class="admin-mode">수정</button>
						<button class="admin-mode">삭제</button>
				</span> <%
 }
 %></li>
			</ul>
		</div>
		</div>
	</div>
</div>
<%@include file="../footer.jsp"%>