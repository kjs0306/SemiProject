<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="board-box">
	<div class="dash-title-box">
		<h2>공지사항 게시판 관리</h2>
	</div>

	<h4 class="board-top-title">공지사항 보기 게시판</h4>
	<div class="board-form-box">
		<form action="" class="board-form">
			<div class="form-frame board-title-box">
				<div class="label-tag board-title-text">글 제목</div>
				<input type="text" id="" name="" placeholder="제목 입력" value="${article.NOTICETITLE }" readonly>
			</div>

			<div class="form-frame board-info-box">
				<div class="label-tag board-info-text">글 내용</div>
				<textarea name="" id="" cols="30" rows="20">${article.NOTICECONTENT }</textarea readonly>
			</div>
			<div class="btn-frame">
				<button type="button" onclick="adminList()">목록</button>
		</form>
		<%
		String status2 = (String) session.getAttribute("memberStatus");
		if (status2 == null) {
			status2 = "";
		}
		;
		%>
	</div>
</div>
<script>
function adminList(){
    $.ajax({
        url: "dashBoardInclude/announceboardmng.jsp",
        type: "GET",
        success: function(data) {
            $("#content").html(data);
        },
        error: function() {
            $("#content").html("Error loading page.");
        }
    });
}
</script>