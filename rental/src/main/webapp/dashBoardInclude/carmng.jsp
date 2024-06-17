<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

/*
 * 처음 페이지가 생겼을때
 * 모든 목록들 보여주기 위한 즉시실행함수
 */
 	var carMaxPage=0; // 전체 페이지 수
	var carCurrentPage = 1; // 현재 페이지
	var carPageLimit = 5; // 한 페이지에 표시할 데이터 수
	var carListDataAll; // 전체 데이터

function searchCars(){
	
	
    var search = {
        "CAR_NUMBER": $("input[name='CAR_NUMBER']").val(),
        "CAR_YEAR": $("input[name='CAR_YEAR']").val(),
        "CAR_SEATER": $("input[name='CAR_SEATER']").val(),
        "CAR_COMPANY": $("select[name='CAR_COMPANY']").val(),
        "CAR_INSURANCEAGE": $("input[name='CAR_INSURANCEAGE']").val(),
        "CAR_FUEL": $("select[name='CAR_FUEL']").val(),
        "CAR_PRICE": $("input[name='CAR_PRICE']").val(),
        "CAR_STATUS": $("input[name='CAR_STATUS']:checked").val()
    };
    
    $.ajax({
        url: "carSelectForm.bo",
        type: "post",
        data: search,
        cache: false,
        async: false,
        success: function(responseData) {
        	var carList = responseData.carList;
        	carListDataAll = carList;
        	
            
            let totalDataCnt = carList.length;
            carMaxPage = Math.ceil(totalDataCnt / carPageLimit);
            makeBtn(carMaxPage);
            carCurrentPageData(responseData.carList, carCurrentPage);
            
            
        },
        error: function() {
            console.error('error');
        }
    });
}


(function(){
	searchCars();
})();

function makeBtn(carMaxPage) {
	 $(".content-list .page-num-list").remove();
	 $(".content-list").append("<div class='page-num-list'></div>");
	 for (let i = 1; i <= carMaxPage; i++) {
	    if(i==1)
	     $(".content-list .page-num-list").append("<button type='button' id='pageBtn1'class='pageBtn' autofocus>" + i + "</button>");
	    else
	     $(".content-list .page-num-list").append("<button type='button' class='pageBtn'>" + i + "</button>");
	 }
}

function carCurrentPageData(data, carCurrentPage) {
	var tbody = $("tbody").empty();
	let viewData = data.slice((carCurrentPage - 1) * carPageLimit, carCurrentPage * carPageLimit);

	$.each(viewData, function(index, car) { // carList 안에 있는 배열을 순회
	        var row = $("<tr>");
	    	var carNumber = car.CAR_NUMBER;
	    	var carName = car.CAR_NAME;
	    	
	    	row.append($("<td>").text(car.CAR_NUMBER)); // 객체의 속성에 접근하여 데이터 출력
	    	row.append($("<td>").text(car.CAR_NAME));
	        row.append($("<td>").text(car.CAR_COMPANY));
	        row.append($("<td>").text(car.CAR_YEAR));
	        row.append($("<td>").text(car.CAR_SEATER));
	        row.append($("<td>").text(car.CAR_INSURANCEAGE));
	        row.append($("<td>").text(car.CAR_FUEL));
	        row.append($("<td>").text(car.CAR_PRICE));
	        row.append($("<td>").text(car.CAR_STATUS));
	        
	        var editButton = $("<button>").text("수정");
	        var deleteButton = $("<button>").text("삭제");
	        
	        editButton.click(function() {
	        	modify_car(carNumber, carName);
	        });
	        deleteButton.click(function() {
	        	delete_car(carNumber);
	            
	        });
	        
	        var buttonCell = $("<td>").append(editButton).append(" ").append(deleteButton);
	        row.append(buttonCell);
	        tbody.append(row);
	        
	    	
	    });
}

$(".content-list").on("click", ".pageBtn", function() {
	carCurrentPage = parseInt($(this).text());
	carCurrentPageData(carListDataAll, carCurrentPage);
	
});

</script>



<div class="top-content">
	<div class="dash-title-box">
		<h2>차량 정보 관리</h2>
	</div>
	<div class="dash-info-box">
		<h4>차량 조회</h4>
	</div>
	<form>
		<div class="search-con-box form-con-box">
			<div>
				<div class="search-line">
					<div class="search-line-box">
						<div class="form-title">등록 번호</div>
						<div class="search-box">
							<input type="text" name="CAR_NUMBER">
						</div>
					</div>

					<div class="search-line-box">
						<div class="form-title">연식</div>
						<div class="search-box">
							<input type="range" min="2018" max="2024" step="1" id="caryear"
								oninput="CAR_YEAR.value=parseInt(caryear.value)" value="2021">
							<input name="CAR_YEAR" for="caryear" type="text"
								placeholder="선택안함" readonly>
						</div>
					</div>

					<div class="search-line-box">
						<div class="form-title">인승</div>
						<div class="search-box">
							<input type="range" min="1" max="10" step="1" id="passengers"
								oninput="CAR_SEATER.value=parseInt(passengers.value)" value="6">
							<input name="CAR_SEATER" for="passengers" type="text"
								placeholder="선택안함" readonly>
						</div>
					</div>
				</div>

				<div class="search-line">
					<div class="search-line-box lb">
						<div class="form-title">제조사</div>
						<div class="search-box">
							<select name="CAR_COMPANY" id="member-search">
								<option value="">선택안함</option>
								<option value="BMW">BMW</option>
								<option value="KGM">KGM</option>
								<option value="기아">기아</option>
								<option value="렉서스">렉서스</option>
								<option value="제네시스">제네시스</option>
								<option value="기아">기아</option>
								<option value="벤츠">벤츠</option>
								<option value="볼보">볼보</option>
								<option value="아우디">아우디</option>
								<option value="풀스타">풀스타</option>
								<option value="현대">현대</option>
							</select>
						</div>
					</div>

					<div class="search-line-box">
						<div class="form-title">보험 연령</div>
						<div class="search-box">
							<input type="range" min="20" max="30" step="1" id="carinsure"
								oninput="CAR_INSURANCEAGE.value=parseInt(carinsure.value)"
								value="25"> <input name="CAR_INSURANCEAGE"
								for="carinsure" type="text" placeholder="선택안함" readonly>
						</div>
					</div>
				</div>

				<div class="search-line">
					<div class="search-line-box lb">
						<div class="form-title">연료 종류</div>
						<div class="search-box">
							<select name="CAR_FUEL" id="member-search">
								<option value="">선택안함</option>
								<option value="LPG">LPG</option>
								<option value="가솔린">가솔린</option>
								<option value="경차">경차</option>
								<option value="디젤">디젤</option>
								<option value="전기">전기</option>
								<option value="하이브리드">하이브리드</option>
							</select>
						</div>
					</div>

					<div class="search-line-box">
						<div class="form-title">가격</div>
						<div class="search-box">
							<input type="range" min="40000" max="100000" step="10000"
								id="carprice" oninput="CAR_PRICE.value=parseInt(carprice.value)"
								value="70000"> <input name="CAR_PRICE" for="carprice"
								type="text" placeholder="선택안함" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="radio-con-box form-con-box">
			<div class="form-title">상태 선택</div>
			<div class="radio-box-1 radio-box">
				<input type="radio" name="CAR_STATUS" value="전체" checked> 
				<label for="statusAll">전체</label>
			</div>
			<div class="radio-box-2 radio-box">
				<input type="radio" name="CAR_STATUS" value="예약가능">
				<label for="statusTrue">예약 가능</label>
			</div>
			<div class="radio-box-3 radio-box">
				<input type="radio" name="CAR_STATUS" value="예약중">
				<label for="statusFalse">예약중</label>
			</div>
			<div class="radio-box-4 radio-box">
				<input type="radio" name="CAR_STATUS" value="정비중">
				<label for="statusRent">정비중</label>
			</div>
		</div>

		<div class="button-box">
			<button class="search-btn" type="button" onclick="searchCars()">검색</button>
			<button class="reset-btn" type="reset">초기화</button>
		</div>
	</form>
</div>

<div class="bottom-content">
	<div class="table-top">
		<h4 class="table-title">차량 리스트</h4>
		<button type="button" onclick="enroll_car()">+ 차량 등록</button>
	</div>
	<div class="content-list">
		<table>
			<thead>
				<tr>
					<th>등록번호</th>
					<th>차량 이름</th>
					<th>제조사</th>
					<th>연식</th>
					<th>인승</th>
					<th>차종보험연령</th>
					<th>연료종류</th>
					<th>가격</th>
					<th>차량 상태</th>
					<th>차량관리</th>
				</tr>

			</thead>
			<tbody>
			    
			</tbody>

		</table>
	</div>
</div>
 <div class="pagination"></div>
	
<script>
	
	
	function enroll_car() {
        $.ajax({
             url:"dashBoardInclude/carnew.jsp",
             type: "GET",
             async: false,
             success: function(data) {
                 $("#content").html(data);
             },
             error: function() {
                 $("#content").html("Error loading page.");
             }
         });
     }
	
	function modify_car(carN, carNa) {
		
        $.ajax({
        	 url: "dashBoardInclude/carmodify.jsp",
             type: "GET",
             async: false,
             data: {
            	 carNumber: carN,
            	 carName: carNa
            	 
             },
             success: function(data) {
                 $("#content").html(data);
             },
             error: function() {
                 $("#content").html("Error loading page.");
             }
         });
     }
	
	function delete_car(carN) {
		var result = confirm("확인을 누르면 계속 진행됩니다. 취소를 누르면 취소됩니다.");
        
		if (result) {
			 $.ajax({
		    	 url: "carDeleteForm.bo",
		         type: "GET",
		         async: false,
		         data: {
		        	 CAR_NUMBER: carN
		         },
		         success: function() {
		             back();
		         },
		         error: function() {
		             $("#content").html("Error loading page.");
		         }
		     });
		} else {
		    // 사용자가 취소를 클릭한 경우
		    alert("사용자가 취소를 클릭했습니다.");
		}
		
	}
	
	function back() {
        $.ajax({
             url:"dashBoardInclude/carmng.jsp",
             type: "GET",
             cache: false,
             async: false,
             success: function(data) {
                 $("#content").html(data);
             },
             error: function() {
                 $("#content").html("Error loading page.");
             }
         });
     }
     
</script>

<%@include file="../dashFooter.jsp"%>