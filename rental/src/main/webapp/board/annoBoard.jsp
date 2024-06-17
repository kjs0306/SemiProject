<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<div class="inner">
   <div id="board-main">
      <div class="board-inner">
      <h1 class="board-title">공지사항</h1>

      <div class="board-search-box">
         <form class="board-search">
            <select name="annSearch" id="announcement-search">
               <option value="">선택없음</option>
               <option value="noticenum">글번호</option>
               <option value="noticetitle">글제목</option>
               <option value="noticename">작성자</option>
            </select> <input type="text" name="searchValue" id="search-input">

            <button type="button" onclick="annList()">검색</button>
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
            <a class="admin-mode addwrite" href="<%=request.getContextPath()%>/board/annoBoardWrite.jsp">글쓰기</a>
         </div>
         <%
         }
         %>
         <table class="board-box">
            <thead>
               <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>등록일</th>
                  <th>작성자</th>
                  <th>조회</th>
                  <%
                  if (status2.equals("admin")) {
                  %>
                  <th class="admin-mode">관리</th>
                  <%
                  }
                  %>
               </tr>
            </thead>
               <tbody>
               </tbody>
         </table>
      </div>
   </div>
   </div>
</div>
<script>
function annList() {

   let sendData = {
      ntcSearch : $('#announcement-search').val(),
      searchValue : $('#search-input').val()
   };

   $.ajax({
      url : "ntcList.no",
      type : "post",
      data : sendData,
      cache : false,
      dataType : 'json',
      success : function(data) {
         let articleList = data.articleList;
         console.log("articleList : ", articleList);
         $(".board-box #anno-content").empty();
         $.each(articleList, function(idx, obj) {
             let str = "<tr id='anno-content'>";
             str += "<th>" + obj.NOTICENUM + "</th>";
             str += "<th class='post-name' data-noticenum='" + obj.NOTICENUM + "' style='cursor: pointer;'>" + obj.NOTICETITLE + "</th>";
             str += "<th>" + obj.NOTICEDATE.slice(0,10) + "</th>";
             str += "<th> 랜트어때. </th>";
             str += "<th>" + obj.NOTICEVIEWS + "</th>";
             <% if (status2.equals("admin")) { %>
             str += "<th>";
             str += "<button class='admin-mode' onclick='ntcModify(" + obj.NOTICENUM + ")'>수정</button> ";
             str += "<button class='admin-mode' onclick='ntcDelete(" + obj.NOTICENUM + ")'>삭제</button>";
             str += "</th>";
             <% } %>
             str += "</tr>";
             $(".board-list-box .board-box").append(str);
         });
      },
      error : function(err) {
         console.log('err: ', err);
         alert('Error');
      }
   });
}

function ntcDetail(noticeNum) {
    
    $.ajax({
      type : 'post',
      url : "ntcView.no",
      data : {
         "NOTICENUM" : noticeNum,
         "view" : "mainok"
      },
      cache : false,
      success : function(response) {
         console.log('요청이 성공했습니다.');
         $("#board-main").empty().html(response);
      },
      error : function(xhr, status, error) {
         console.error('요청이 실패했습니다.');
      }
   });
}
 
 function ntcModify(noticeNum) {
       $.ajax({
           type: "post",
           url: "ntcView.no",
           data : {
            "NOTICENUM" : noticeNum,
            "view" : "userok"
         },
           cache: false,
           success: function(response) {
               console.log("수정 요청 성공");
               // 서버로부터 받은 응답을 어떻게 처리할지 추가하는 부분이 필요합니다.
               $("#board-main").empty().html(response);
           },
           error: function(xhr, status, error) {
               console.error('요청이 실패했습니다.');
           }
       });
   }


function ntcDelete(dno) {
    var result = confirm(dno + "번 게시글을 삭제 하시겠습니까?");

    if (result) {
        $.ajax({
            url: "ntcDelete.no",
            type: "GET",
            async: false,
            data: {
                NOTICENUM: dno
            },
            success: function(data) {
                  location.reload();
            },
            error: function(response) {
                  location.reload();
            }
        });
    } else {
        // 사용자가 취소를 클릭한 경우
        console.log("사용자가 취소를 클릭했습니다.");
    }

}
/* 
function back() {
    $.ajax({
         url:"board/annoBoard.jsp",
         type: "GET",
         cache: false,
         async: false,
         success: function(data) {
            $("#board-main").html(response);
         },
         error: function() {
            $("#board-main").html(response);
         }
     });
 } */

 
window.onload = function() {
    annList();
    
};

if (window.location.search) {
   // 현재 URL의 쿼리 문자열을 가져옴
   var queryString = window.location.search;

   // URLSearchParams 객체 생성
   var urlParams = new URLSearchParams(queryString);

   var numberValue = urlParams.get('number');
   
   console.log("콘솔확인", numberValue);
   
    ntcDetail(numberValue);
    
} else {
    console.log("쿼리 문자열이 없습니다.");
}

$(document).on('click', '.post-name', function() {
    var noticeNum = $(this).data('noticenum');
    ntcDetail(noticeNum);
});
</script>
<%@include file="../footer.jsp"%>