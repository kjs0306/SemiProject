<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp"%>  
<div id="carbookpage">
    <div class="bookpage-inner">
        <form action="../bookInsertNonDate.bk">
            <div class="bookpage-box">
                <h1 class="bookpage-title">
                    예약하기
                </h1>                
<%
    request.setCharacterEncoding("UTF-8");
    String memberName = request.getParameter("memberName");
    String carName = request.getParameter("carName");
    String carPriceStr = request.getParameter("carPrice");
    int carPrice = Integer.parseInt(carPriceStr);
    int insPrice = (int) (carPrice * 0.1);
    
    session.setAttribute("carName", carName);
    session.setAttribute("carPrice", carPrice);
%>
<input type="hidden" id="carPrice" value="<%=carPrice%>">
<input type="hidden" id="insPrice" value="<%=insPrice%>">
<script>
function calculateDays() {
    var dateText = document.getElementsByName("datefilter")[0].value;
    var dates = dateText.split(" - ");
    var bookDate = new Date(dates[0]);
    
 	var bookDateStr = dates[0];
 	var returnDateStr = dates[1];
    var returnDate = new Date(dates[1]);
    var timeDifference = Math.abs(returnDate.getTime() - bookDate.getTime());
    var differenceDays = Math.ceil(timeDifference / (1000 * 3600 * 24)); 
    var carPrice = parseInt(document.getElementById("carPrice").value);
    var insPrice = parseInt(document.getElementById("insPrice").value);
    
    document.getElementById("rentalFee1").innerText = carPrice.toLocaleString() + "원";
    document.getElementById("rentalFee2").innerText = (carPrice*differenceDays).toLocaleString() + "원";
    document.getElementById("insurance-price1").innerText = insPrice.toLocaleString()+ "원";
    document.getElementById("insurance-price2").innerText = (insPrice * differenceDays).toLocaleString()+ "원";
    document.getElementById("total-price").innerText = ((carPrice*differenceDays)+(insPrice * differenceDays)).toLocaleString() + "원";
    document.getElementById("bookDate").value = bookDateStr;
    document.getElementById("returnDate").value = returnDateStr;
    
}
</script>
		<input type="hidden" id="bookDate" name="bookDate" >
		<input type="hidden" id="returnDate" name="returnDate">
                <div class="bookinfo-box">
                    <h1 class="bookinfo-title book-section-title">예약 정보</h1>
                    <div class="bookinfo">
                        <div class="book-member">
                            <p class="bookinfo-name">
                                예약자
                            </p>
                            <span> <%= session.getAttribute("memberName")%> </span> 
                            <span> <%= session.getAttribute("memberPhone") %> </span>  
                        </div>

                        <div class="book-car">
                            <p class="bookinfo-name">
                                예약 차량
                            </p>
                            <span> <%= carName%></span> 
                        </div>

                        <div class="book-date">
                            <p class="bookinfo-name book-date-d">
                                대여 기간
                            </p>
                            <input type="text" class="select-nonebook" name="datefilter" value="" placeholder="대여 기간 선택">
                            <button class="confirm-date" type="button" onclick="calculateDays()">확인</button>
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
                                <div id="rentalFee1" class="book-price"></div>
                            </div>
                            <div class="option-price-box">
                                <div class="option-price-text">차자손해면책조건(CDW) 선택 (1일)</div>
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
                            <div class="book-price" id="rentalFee2"></div>
                        </div>
                        <div class="option-price-box">
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
document.getElementById("none-insurance").addEventListener("change", function() {
    var carPrice = parseInt(document.getElementById("carPrice").value);
    var dateText = document.getElementsByName("datefilter")[0].value;
    var dates = dateText.split(" - ");
    var bookDate = new Date(dates[0]);
    var returnDate = new Date(dates[1]);
    var timeDifference = Math.abs(returnDate.getTime() - bookDate.getTime());
    var differenceDays = Math.ceil(timeDifference / (1000 * 3600 * 24));
    var totalPriceWithoutInsurance = carPrice * differenceDays;

    document.getElementById("total-price").innerText = totalPriceWithoutInsurance.toLocaleString() + "원";
    document.getElementById("insurance-price1").innerText = "0원";
    document.getElementById("insurance-price2").innerText = "0원";
    document.querySelector(".option-price-box .option-price-text").innerText = "자차손해면책조건(CDW) 미선택";
});

document.getElementById("add-insurance").addEventListener("change", function() {
    var carPrice = parseInt(document.getElementById("carPrice").value);
    var dateText = document.getElementsByName("datefilter")[0].value;
    var dates = dateText.split(" - ");
    var bookDate = new Date(dates[0]);
    var returnDate = new Date(dates[1]);
    var timeDifference = Math.abs(returnDate.getTime() - bookDate.getTime());
    var differenceDays = Math.ceil(timeDifference / (1000 * 3600 * 24)); 
    var insPricePerDay = parseInt(document.getElementById("insPrice").value);
    var totalInsPrice = insPricePerDay * differenceDays;
    var totalPriceWithInsurance = (carPrice * differenceDays) + totalInsPrice;

    document.getElementById("insurance-price1").innerText = insPricePerDay.toLocaleString() + "원";
    document.getElementById("insurance-price2").innerText = totalInsPrice.toLocaleString() + "원";
    document.getElementById("total-price").innerText = totalPriceWithInsurance.toLocaleString() + "원";
    document.querySelector(".option-price-box .option-price-text").innerText = "자차손해면책조건(CDW) 선택";
});


document.addEventListener("DOMContentLoaded", () => {
    alert("대여 할 기간을 선택 후 확인 버튼을 클릭해주시기 바랍니다");
  });
</script>
<%@include file ="../footer.jsp"%>