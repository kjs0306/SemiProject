<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../header.jsp" %>

<div id="carbookpage">
    <div class="bookpage-inner">
        <form action="../bookInsert.bk" method="post">
            <div class="bookpage-box">
                <h1 class="bookpage-title">예약하기</h1>
<% 
    request.setCharacterEncoding("UTF-8");
    String memberName = request.getParameter("memberName");
    String carName = request.getParameter("carName");
    String carPriceStr = request.getParameter("carPrice");
    long differenceDays = (long) session.getAttribute("differenceDays");
    int carPrice = Integer.parseInt(carPriceStr);
    int insPrice = (int) (carPrice * 0.1); 
    session.setAttribute("carName", carName);
    session.setAttribute("carPrice", carPrice);
    session.setAttribute("insPrice", insPrice);
%>
                <div class="bookinfo-box">
                    <h1 class="bookinfo-title book-section-title">예약 정보</h1>
                    <div class="bookinfo">
                        <div class="book-member">
                            <p class="bookinfo-name">예약자</p>
                            <span><%= session.getAttribute("memberName") %></span> 
                            <span><%= session.getAttribute("memberPhone") %></span> 
                        </div>
                        <div class="book-car">
                            <p class="bookinfo-name">예약 차량</p>
                            <span><%= carName %></span> 
                        </div>
                        <div class="book-date">
                            <p class="bookinfo-name">대여 기간</p>
                            <span><%= session.getAttribute("bookDate") %></span> 
                            ~
                            <span><%= session.getAttribute("returnDate") %></span> 
                        </div>
                        <div class="sub-anno-box">
                            <p>· 결제 후 발송되는 알림톡에서 면허증을 등록해주세요</p>
                            <p>· 면허 취득 1년 미만/만 21세 미만은 대여가 불가해요</p>
                            <p>· 10인승 이상 차량은 1종 보통 이상 면허가 필요해요</p>
                        </div>
                    </div>
                </div>
                <div class="bookpayment-box">
                    <h1 class="bookpayment-title book-section-title">결제 정보</h1>
                    <div class="bookpayment">
                        <div class="book-price-box">
                            <div class="main-price-box">
                                <div class="book-price-text">차량 대여료 (1일)</div>
                                <div class="book-price" id="rentalFee1" ></div>
                            </div>
                            <div class="option-price-box" id="insurance-option">
                                <div class="option-price-text">자차손해면책조건(CDW) 선택 (1일)</div>
                                <div class="option-price" id="insurance-price1"></div>
                            </div>
                        </div>
                        <div class="select-option-box">
                            <input type="radio" class="add-insurance" name="insurance" id="add-insurance" value="addin" checked>
                            <label for="add-insurance">보험 가입</label>
                            <input type="radio" class="none-insurance" name="insurance" id="none-insurance" value="nonein">
                            <label for="none-insurance">보험 미가입</label>
                        </div>
                    </div>
                </div>
                <div class="bookconfirm-box">
                    <h1 class="bookconfirm-title book-section-title">결제 상세내역</h1>
                    <div class="bookconfirm">
                        <div class="main-price-box">
                            <div class="book-price-text">총 차량대여요금</div>
                            <div class="book-price" id="rentalFee2" ></div>
                        </div>
                        <div class="option-price-box" id="insurance-option">
                            <div class="option-price-text">총 차량보험료</div>
                            <div class="option-price" id="insurance-price2"></div>
                        </div>
                    </div>
                    <div class="total-price-box">
                        <div class="total-price-text">총 결제할 금액</div>
                        <div class="total-price" id="total-price"></div>
                    </div>
                </div>
                <div class="confirm-box">
                    <button class="bookconfirm-btn" type="submit">예약 하기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    var carPrice = <%= carPrice %>;
    var insPrice= <%= insPrice %>;
    var differenceDays = <%= differenceDays %>;
    
    var carPrice_2 = carPrice*differenceDays;
    var insPrice_2 = insPrice*differenceDays;
//     var carTotalPrice = carPrice_2*differenceDays;
    var totalPrice = carPrice_2+insPrice_2; 
    
    document.getElementById("total-price").innerText = totalPrice.toLocaleString() + "원";

    document.getElementById("add-insurance").addEventListener("change", function() {
        var totalPriceWithInsurance = carPrice_2 + insPrice_2;
        document.getElementById("total-price").innerText = totalPriceWithInsurance.toLocaleString() + "원";
        document.getElementById("insurance-price1").innerText = insPrice.toLocaleString() + "원";
        document.getElementById("insurance-price2").innerText = insPrice_2.toLocaleString() + "원";
        document.querySelector(".option-price-box .option-price-text").innerText = "자차손해면책조건(CDW) 선택";
    });

    document.getElementById("none-insurance").addEventListener("change", function() {
        var totalPriceWithoutInsurance = carPrice_2;
        document.getElementById("total-price").innerText = totalPriceWithoutInsurance.toLocaleString() + "원";               
        document.getElementById("insurance-price1").innerText = "0원";
        document.getElementById("insurance-price2").innerText = "0원";

        document.querySelector(".option-price-box .option-price-text").innerText = "자차손해면책조건(CDW) 미선택";
        document.querySelector(".option-price-box .option-price").innerText = "0원";
    });

    document.querySelectorAll(".book-price").forEach(function(element) {
        element.innerText = carPrice.toLocaleString() + "원";
    });

    document.querySelectorAll(".option-price").forEach(function(element) {
        element.innerText = insPrice.toLocaleString() + "원";
    });
    
    document.getElementById("rentalFee1").innerText = carPrice.toLocaleString() + "원";
    document.getElementById("rentalFee2").innerText = (carPrice*differenceDays).toLocaleString() + "원";
    document.getElementById("insurance-price1").innerText = insPrice.toLocaleString()+ "원";
    document.getElementById("insurance-price2").innerText = (insPrice*differenceDays).toLocaleString()+ "원";
    document.getElementById("total-price").innerText = ((carPrice*differenceDays)+(insPrice*differenceDays)).toLocaleString() + "원";
</script>
<%@ include file="../footer.jsp" %>
