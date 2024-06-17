<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String Id = (String) session.getAttribute("memberId");
%> 
    <script>
    function getMyBook() {
        var info = { "Id": "<%=Id%>" };

        $.ajax({
            url: "myBook.bk", 
            type: "POST",
            data: info,
            dataType: "json",
            success: function(data) {
                $('.content-list tbody').empty();

               
                try {
                    $.each(data.MyBooks, function(i, book) { 
                        
                        var bookNum = book.BookNum;
                        
                        let btnHtml = "<button onclick='can(\"" + book.BookNum + "\")'>취소</button>";
                        let rowHtml = "<tr>" +
                                      "<td>" + book.BookNum + "</td>" +
                                      "<td>" + book.MemberName + "</td>" +
                                      "<td>" + book.CarName + "</td>" +
                                      "<td>" + book.ToDay + "</td>" +
                                      "<td>" + book.BookDate + "</td>" +
                                      "<td>" + book.ReturnDate + "</td>" +
                                      "<td>" + book.BookStatus + "</td>" +
                                      "<td>" + btnHtml + "</td>" +
                                      "</tr>";
                        $(".content-list tbody").append(rowHtml);
                    });
                } catch (error) {
                    console.error('Error processing books:', error);
                }
            },
            error: function(xhr, status, errorThrown) {
                console.error('AJAX error:', status, errorThrown);
            }
        });
    }
    
    (function() {
    	getMyBook();
	})();
    
    function can(bno) {
    	var result = confirm(bno +"번 예약을 삭제 하시겠습니까?");
    	
    	if(result) {
    		location.href="bookCancel.bk?bookNum=" + bno;
    		alert("해당 예약이 삭제 되었습니다.");
    	}else {
    		alert("해당 예약이 삭제에 실패 했습니다.");
    		
    	}
    }
    </script>
    
    
<div id="mybook" class="my-content">
    <h1 class="mypage-tabmenu">나의 예약 내역</h1>
    <div class="mybook-content-box">
        <div class="content-list">
            <table>
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
</div>