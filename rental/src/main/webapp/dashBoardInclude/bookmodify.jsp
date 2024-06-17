<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <script>
     
        function submit() {
            alert("해당 정보가 수정되었습니다.");
        }
        
        function back() {
           
           $.ajax({
                url:"dashBoardInclude/bookmng.jsp",
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
<div class="adm-box">
    <div class="dash-title-box">
        <h2>예약 정보</h2>
    </div>

    <div class="adm-form-box">
        <h4 class="adm-form-title">예약 정보 수정</h4>
        <form action="bookUpdate.bk" class="adm-form">
        <%
        request.setCharacterEncoding("UTF-8");
        int bookNum = Integer.parseInt(request.getParameter("bookNum"));
        String memberName =  request.getParameter("memberName");
        String carName  = request.getParameter("carName");
        String today   = request.getParameter("today");
        String bookDate   = request.getParameter("bookDate");
        String returnDate   = request.getParameter("returnDate");
        String bookStatus   = request.getParameter("bookStatus");
        %>
            <div class="form-frame">
                <div class="label-tag">예약 번호</div>
                <input type="text" name="bookNum" readonly value="<%=bookNum%>">
            </div>

            <div class="form-frame">
                <div class="label-tag">예약자 성함</div>
                <input type="text" name="memberName" value="<%=memberName%>">
            </div>

            <div class="form-frame">
                <div class="label-tag">차량 이름</div>
                <input type="text" name="carName" value="<%=carName%>" readonly>
            </div>

            <div class="form-frame">
                <div class="label-tag">예약한 날짜</div>
                <input type="text" name="today" value="<%=today%>" readonly>
            </div>

            <div class="form-frame">
                <div class="label-tag">대여 시작 날짜</div>
                <input type="date" name="bookDate" value="<%=bookDate%>">
            </div>

            <div class="form-frame">
                <div class="label-tag">대여 반납 날짜</div>
                <input type="date" name="returnDate" value="<%=returnDate%>">
            </div>
            <div class="btn-frame">
                <button type="submit" onclick="submit()">등록</button>
                <button type="button" onclick="back()">취소</button>
            </div>
        </form>

    </div>
</div>