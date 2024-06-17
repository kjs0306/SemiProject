<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.NtcVo"%>
<%-- <% 
NtcVo article = (NtcVo) request.getAttribute("article");
%> --%>
<div class="inner">
    <div id="board-main">
    <div class="board-inner">
        <h1 class="board-title">
            공지사항
        </h1>

        <h4 class="board-top-title">공지사항 게시글 수정</h4>
        <div class="board-write-box">
            <form action="" class="board-form"> 
            <input type="hidden" id="NOTICENUM" name="NOTICENUM"  value="${article.NOTICENUM }">
                <div class="form-frame board-title-box">
                    <div class="label-tag board-title-text">글 제목</div>
                    <input type="text" id="NOTICETITLE" name="NOTICETITLE" placeholder="제목 입력" value="${article.NOTICETITLE }">
                </div>

                <div class="form-frame board-info-box">
                    <div class="label-tag board-info-text">글 내용</div>
                    <textarea name="NOTICECONTENT" id="NOTICECONTENT" cols="30" rows="20">${article.NOTICECONTENT }</textarea>
                </div>

                <div class="btn-frame">
                    <button type="button" onclick="modify_anno()">등록</button>
                    <button type="button" onclick="location.reload()">취소</button>
                </div>
            </form>
        </div>
    </div>
    </div>
</div>

<script>
function modify_anno() {
    // FormData 객체 생성
    var formData = new FormData();
    
    // 차량 정보 데이터 추가
    formData.append('NOTICENUM', $('#NOTICENUM').val());
    formData.append('NOTICETITLE', $('#NOTICETITLE').val());
    formData.append('NOTICECONTENT', $('#NOTICECONTENT').val());

    // AJAX 요청 보내기
    $.ajax({
         url: "ntcModify.no",
         type: "POST",
         data: formData,
         processData: false, 
         contentType: false, 
         cache: false,
         async: false,
         success: function() {
        	 location.reload();
         },
         error: function() {
             $("#content").html("Error loading page.");
         }
     });
}
</script>
