<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file ="../header.jsp" %>
   <script>
   function carselect() {

	      var search = {
	              "CAR_YEAR": $("input[name='CAR_YEAR']").val(),
	              "CAR_SEATER": $("input[name='CAR_SEATER']").val(),
	              "CAR_INSURANCEAGE": $("input[name='CAR_INSURANCEAGE']").val(),
	              "CAR_FUEL": $("select[name='CAR_FUEL']").val(),
	              "CAR_PRICE": $("input[name='CAR_PRICE']").val(),
	              "CAR_TYPE": $("select[name='CAR_TYPE']").val(),
	              "CAR_DATE" : $("input[name='selectdate']").val()
	          };
	       // 결과를 표시하는 ul 요소를 선택하여 비웁니다.
	      $(".afr-list-box > ul").empty();
	      
	      $.ajax({
	    	    url: "./carsearch.bo",
	    	    type: "POST",
	    	    data: search,
	    	    async: false,
	    	    success: function(responseData) {
	    	        // 가격에 따라 정렬
	    	        responseData.carList.sort(function(a, b) {
	    	            return a.CAR_PRICE - b.CAR_PRICE;
	    	        });

	    	        // 정렬된 데이터로 리스트 구성
	    	        responseData.carList.forEach(function(car) {
	    	            let btnHtml = "<button onclick='carinsert(this)' class='afr-btn'  data-car='" + JSON.stringify(car) + "'>예약하기</button>";
	    	            var carName = car.CAR_NUMBER + "_" + car.CAR_NAME + "1번.png";

	    	            var liContent =
	    	                "<li class='afr-list'>" +
	    	                "<div class='afr-left-info'>" +
	    	                "<img src='../upload/" + carName + "' alt='이미지 준비중입니다'>" +
	    	                "<span>" + car.CAR_FUEL + "</span>" +
	    	                "</div>" +
	    	                "<div class='afr-right-info'>" + 
	    	                "<div class='afr-flex-box'>" +
	    	                "<div class='afrcar-name'>" + car.CAR_NAME + "</div>" +
	    	                "<div class='afrcar-price'>" + car.CAR_PRICE.toLocaleString() + "원</div>" + "</div>" +
	    	                "<div>" + btnHtml + "</div>" +
	    	                "</div>" +
	    	                "</li>";

	    	            $(".afr-list-box > ul").append(liContent);
	    	        });
	    	    },
	    	    error: function() {
	    	    }
	    	});
	   }
	function carinsert(element){
		var nm = '<%= name%>';
		if(nm == "null"){
			alert("회원 전용 페이지 입니다.");
		location.href="loginhome.jsp";
		}else{
		let car = $(element).data('car');
		carin(car.CAR_NAME, car.CAR_PRICE);
		}
	}  
function carin(carName, carPrice){
	location.href = "bookpage.jsp?carName=" + encodeURIComponent(carName) + "&carPrice=" + encodeURIComponent(carPrice);
}


</script>
<div id="carbookhome">
    <div class="inner">
        <div class="selectbookdate-box">
            <div class="select-date-box">
                <div class="date-form-box">
                    <form action="" class="date-form">
                        <div class="car-form-frame">
                            <div class="date-form-group">
                             
								<div class="carbook car-sort">
                                    <div class="date-text">대여 기간 선택</div>
                                    <% 
                                String datefilter = request.getParameter("datefilter");
                                if (datefilter == null) {
                                    datefilter = "대여 기간 선택";
                                }
                            %>
                                    <input type="text" name="selectdate" value="<%= datefilter %>" id="selectdate" placeholder="대여 기간 선택">
                                </div>

                                <div class="cartypes car-sort">
                                    <div class="car-text">차종</div>
                                    <select name="CAR_TYPE" id="CAR_TYPE">
                                        <option value="">선택안함</option>
                                        <option value="경차">경차</option>
                                        <option value="준중형">준중형</option>
                                        <option value="중형">중형</option>
                                        <option value="준대형">준대형</option>
                                        <option value="SUV">SUV</option>
                                    </select>
                                </div>

                                <div class="caroils car-sort">
                                    <div class="car-text">연료</div>
                                    <select name="CAR_FUEL" id="CAR_FUEL">
                                        <option value="">선택안함</option>
                                        <option value="LPG">LPG</option>
                                        <option value="가솔린">가솔린</option>
                                        <option value="디젤">디젤</option>
                                        <option value="전기">전기</option>
                                        <option value="하이브리드">하이브리드</option>
                                    </select>
                                </div>
                            </div>
                            <div class="date-form-group">
                                <div class="range-bar-group">
                                    <div class="caryears car-sort">
                                        <div class="car-text">연식</div>
                                        <input type="range" min="2018" max="2024" step="1" id="caryear" oninput="CAR_YEAR.value=parseInt(caryear.value)" value="2021">
                              <input name="CAR_YEAR" for="caryear" type="text" placeholder="선택안함" readonly>
                                    </div>
                                    <div class="carinsage car-sort">
                                        <div class="car-text">보험연령</div>
                                        <input type="range" min="20" max="30" step="1" id="carinsure" oninput="CAR_INSURANCEAGE.value=parseInt(carinsure.value)" value="25"> 
                              <input name="CAR_INSURANCEAGE" for="carinsure" type="text" placeholder="선택안함" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="date-form-group">
                                <div class="range-bar-group">
                                    <div class="carprice car-sort">
                                        <div class="car-text">가격</div>
                                        <input type="range" min="40000" max="100000" step="10000" id="carprice" oninput="CAR_PRICE.value=parseInt(carprice.value)" value="70000"> 
                                        <input name="CAR_PRICE" for="carprice" type="text" placeholder="선택안함" readonly>
                                    </div>
                                    <div class="carseats car-sort">
                                        <div class="car-text">인승</div>
                                        <input type="range" min="2" max="6" step="1" id="passengers" oninput="CAR_SEATER.value=parseInt(passengers.value)" value="4">
                              <input name="CAR_SEATER" for="passengers" type="text" placeholder="선택안함" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="car-form-frame car-form-btn">
                            <div class="date-form-group">
                                <button type="button" class="car-form-submit" onclick="carselect()">차량 검색하기</button>
                            </div>
                            <div class="date-form-group">
                                <button type="reset" class="car-form-reset">필터링 초기화</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="afr-list-box">
                <ul>
                
                </ul>
            </div>
        </div>
    </div>
</div>
<%@include file ="../footer.jsp" %>