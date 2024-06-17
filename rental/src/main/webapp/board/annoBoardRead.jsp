<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="inner">
    <div id="board-main">
       <div class="board-inner">
        <h1 class="board-title">
            공지사항
        </h1>

        <div class="board-read-box">
            <div class="board-top-info-box">
                <span class="writer"> 
                    <span class="span-point">
                        작성자
                    </span>
                    <span>
                        랜트어때.
                    </span>
                </span>
                <span class="write-date">
                    <span class="span-point">
                        등록일
                    </span>
                    <span>
                        ${article.NOTICEDATE }
                    </span>
                </span>
            </div>
            <form class="board-form"> 
                <div class="form-frame board-title-box">
                    <input type="text" id="NOTICETITLE" name="NOTICETITLE" value="${article.NOTICETITLE }" readonly>
                </div>

                <div class="form-frame board-info-box">
                    <textarea name="NOTICECONTENT" id="NOTICECONTENT" cols="30" rows="20" readonly>${article.NOTICECONTENT }</textarea>
                </div>

                <div class="btn-frame">
                    <button type="button" onclick="reload()">글 목록</button>
                </div>
            </form>
        </div>
    </div>
    </div>
</div>
<script>

function reload(){
   if (window.location.search) {
         // 현재 URL의 쿼리 문자열을 가져옴
         var queryString = window.location.search;

         // URLSearchParams 객체 생성
         var urlParams = new URLSearchParams(queryString);
         
         var newUrl = 'rental/board/annoBoard.jsp';
         // 페이지를 새로운 URL로 다시로드
         window.location.href = '/rental/board/annoBoard.jsp';

          
      } else {
         location.reload()
      }
   
}



</script>