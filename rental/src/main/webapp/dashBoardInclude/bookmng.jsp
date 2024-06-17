<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
//전역변수
var bookMaxPage=0; // 전체 페이지의 수
var bookCurrentPage11 = 1; // 현재 페이지
var bookPageLimit = 5; // 한 페이지에 표시할 데이터 수
var bookListDataAll; // 전체 데이터

//페이지 로드 시 실행될 함수
function getBookList() {
 let search = {
     "bookNum": document.frm.bookNum.value,
     "memberName": document.frm.memberName.value,
     "bookStatus": document.frm.bookStatus.value
 };

 $.ajax({
     url: "bookSelect.bk",
     type: "post",
     data: search,
     cache: false,
     async: false,
     success: function(data) {
         bookListDataAll = data; // 데이터 저장
         let totalDataCnt = data.bookList.length; // 전체 데이터 수
         bookMaxPage = Math.ceil(totalDataCnt / bookPageLimit); // 전체 페이지 수 계산
         makeBtn(bookMaxPage); // 페이지 버튼 생성
         bookCurrentPage11Data(bookListDataAll, bookCurrentPage11); // 현재 페이지 데이터 표시
     },
     error: function() {
         alert('데이터 로딩 실패');
     }
 });
}

function makeBtn(bookMaxPage) {
 $(".content-list .page-num-list").remove();
 $(".content-list").append("<div class='page-num-list'></div>");
 for (let i = 1; i <= bookMaxPage; i++) {
    if(i==1)
     $(".content-list .page-num-list").append("<button type='button' id='pageBtn1'class='pageBtn'>" + i + "</button>");
    else
     $(".content-list .page-num-list").append("<button type='button' class='pageBtn'>" + i + "</button>");
 }
}

function bookCurrentPage11Data(data, bookCurrentPage11) {
 let viewData = data.bookList.slice((bookCurrentPage11 - 1) * bookPageLimit, bookCurrentPage11 * bookPageLimit);
 $("#bookInfo tbody").empty(); // 테이블 초기화

 // 데이터를 테이블에 추가
 viewData.forEach(function(book) {
     let btnHtml = "<button onclick='prepareUp(this)' data-book='" + JSON.stringify(book) + "'>수정</button>" +
                   "<button onclick='del(\"" + book.bookNum + "\")'>취소</button>";
     let rowHtml = "<tr>" +
                    "<td>" + book.bookNum + "</td>" +
                    "<td>" + book.memberName + "</td>" +    
                    "<td>" + book.carName + "</td>" +
                    "<td>" + book.today + "</td>" +
                    "<td>" + book.bookDate + "</td>" +
                    "<td>" + book.returnDate + "</td>" +
                    "<td>" + book.bookStatus + "</td>" +
                    "<td>" + btnHtml + "</td>" +
                    "</tr>";
     $("#bookInfo tbody").append(rowHtml);
 });
}

$(document).ready(function() {
   //검색리스트 호출
   getBookList();
 $(".content-list").on("click", ".pageBtn", function() {
     bookCurrentPage11 = parseInt($(this).text());
     bookCurrentPage11Data(bookListDataAll, bookCurrentPage11);
 });

 $("#search-btn").click(getBookList); // 검색 버튼 클릭 이벤트 연결
});

function prepareUp(element) {
 let book = $(element).data('book');
 up(book.bookNum, book.memberName, book.carName, book.today, book.bookDate, book.returnDate, book.bookStatus);
}

function up(bno, mnm, cnm, tod, bd, ret, bs) {
 $.ajax({
     url: "dashBoardInclude/bookmodify.jsp",
     type: "POST",
     data: {
         bookNum: bno,
         memberName: mnm,
         carName: cnm,
         today: tod,
         bookDate: bd,
         returnDate: ret,
         bookStatus: bs
     },
     success: function(response) {
         $('#content').html(response);
     },
     error: function(xhr, status, error) {
         alert("오류 발생: " + error);
     }
 });
}

function del(bno) {
 var result = confirm("해당 예약을 취소하시겠습니까?");
 if (result) {
     alert(bno + "번 예약이 취소 되었습니다.");
     location.href = "bookDelete.bk?bookNum=" + bno;
 }
}


</script>

<div class="top-content">
   <div class="dash-title-box">
      <h2>예약 정보 관리</h2>
   </div>
   <div class="dash-info-box">
      <h4>예약 조회</h4>
   </div>
   <form name="frm">
      <div class="search-con-box form-con-box">
         <div class="form-title">예약 번호</div>
         <div class="search-box-1 search-box">
            <input type="text" name="bookNum" id="bookNum">
         </div>
         <div class="form-title">예약자 성함</div>
         <div class="search-box-2 search-box">
            <label for="book-name"></label> <input type="text" name="memberName"
               id="memberName">
         </div>
      </div>
      <div class="radio-con-box form-con-box">
         <div class="form-title">상태 선택</div>
         <div class="radio-box-1 radio-box">
            <input type="radio" name="bookStatus" id="statusAll" value="all"
               checked> <label for="statusAll">전체</label>
         </div>
         <div class="radio-box-2 radio-box">
            <input type="radio" name="bookStatus" id="statusTrue"
               value="booking"> <label for="statusTrue">예약중</label>
         </div>
         <div class="radio-box-3 radio-box">
            <input type="radio" name="bookStatus" id="statusFalse"
               value="cancel"> <label for="statusFalse">예약 취소</label>
         </div>
      </div>

      <div class="button-box">
         <button id="search-btn" class="search-btn" type="button"
            onclick="getBookList()">검색</button>
         <button class="reset-btn" type="reset">초기화</button>
      </div>
   </form>
</div>

<div class="bottom-content">
   <div class="table-top">
      <h4 class="table-title">예약 리스트</h4>
   </div>
   <div class="content-list">
      <table id="bookInfo">
         <thead>
            <tr>
               <th>예약번호</th>
               <th>예약자 성함</th>
               <th>차량 이름</th>
               <th>예약한 날짜</th>
               <th>대여 시작날짜</th>
               <th>대여 반납날짜</th>
               <th>예약 상태</th>
               <th>예약 관리</th>
            </tr>
         </thead>
         <tbody>

         </tbody>
      </table>

   </div>
</div>