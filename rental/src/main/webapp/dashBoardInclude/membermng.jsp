<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	// 전역변수
	var maxPage; // 전체 페이지의 수 
	var currentPage=1; // 처음에는 무조건 하나의 페이지를 가져옴.
	var pageLimit=5; // 한줄에 가져올 정보
	var listDataAll; // 아작스에서 받아온 전체 데이터

	// 아작스 사용시 위 기능 사용이 안됨__페이지가 로드될 때 실행될 함수
	  	function getMemberList() {
		
			
					let search = {
						"searchCondition" : document.frm.searchCondition.value,
						"conditionValue" : document.frm.conditionValue.value,
						"status" : document.frm.status.value
					};

					$.ajax({
						url : "memberList.member",
						type : "post",
						data : search,
						cache : false,	
						async : false,
						success : function(data) {
							listDataAll = null;
							let totalDataCnt = data.memberList.length; // 전체 데이터의 수
							listDataAll = data;
							maxPage = Math.ceil(totalDataCnt/pageLimit); // 전체 페이지의 수
							
							makeBtn(maxPage); 
							currentPageData(listDataAll, currentPage);
							
						},
						error : function() {
							alert('error');
						}
					});

			}
				
				
				
				function makeBtn(maxPage) {
					$(".content-list  .page-num-list").remove();
					
			        $(".content-list").append("<div class='page-num-list'></div>");
				    for (let i = 1; i <= maxPage; i++) {
						if(i==1)
			        $(".content-list  .page-num-list").append("<button type='button' class='pageBtn' id='pageBtn1' autofocus>"+i+"</button>");
						else
				        $(".content-list   .page-num-list").append("<button type='button' class='pageBtn'>"+i+"</button>");
				     
				    } 
				 }
				
				
				// listDataAll
				function currentPageData(data, currentPage){
					viewData = data.memberList.slice(((currentPage)-1)*pageLimit, currentPage*pageLimit);
					repeatViewDataList(viewData);
				}
				
				$(document).ready(function(){
					$("body").on("click", ".pageBtn" ,function(){
						currentPageData(listDataAll, $(this).text());
					});
				});
				
				// 데이터를 보내주는 반복문
				function repeatViewDataList(viewData){
					$("#member tbody").empty();
				
					for(let i=0; i<viewData.length; i++){
						let addrStr = viewData[i].MemberAddress.replace("상세주소: ", "").replace("참고항목 : ","");
						if(addrStr.length > 40) addrStr = addrStr.substring(0,40) + '...';
						$("#member tbody").append(
								"<tr>" + "<td>" + viewData[i].MemberNo
										+ "</td>" + 
										"<td>" + viewData[i].MemberId
										+ "</td>" + 
										"<td>" + viewData[i].MemberName
										+ "</td>" + 
										"<td>"
										+ viewData[i].MemberBirth
										+ "</td>" + 
										"<td>"
										+ viewData[i].MemberPhone
										+ "</td>" +
										"<td>"
										+ viewData[i].MemberEmail
										+ "</td>" +
										"<td>"
										+ viewData[i].MemberGender
										+ "</td>" + 
										"<td>" + viewData[i].MemberAge
										+ "</td>" + 
										"<td>"
										+ addrStr
										+ "</td>" + 
										"<td>"
										+ viewData[i].MemberStatus
										+ "</td>" + 
										"<td> <button onclick='prepareUp(this)' data-member='" + JSON.stringify(viewData[i]) + "'>수정</button></td>"
										+ 
										"</tr>");
										}
					
					}

			
			function clickPageBtn(){
				if (document.getElementById('pageBtn1')) {
				    // 버튼이 존재하는 경우
					var button = document.getElementById("pageBtn1");
					button.click();
					button.focus();

				} 
}

(function(){
	getMemberList();
	clickPageBtn();
				
})();			

function clearData(){
	var tbody = $("tbody").empty();
	$(".pageBtn").remove();
	getMemberList();
	clickPageBtn();
}

function prepareUp(element) {
	 let member = $(element).data('member');
	 up(member.MemberNo, member.MemberId, member.MemberName, member.MemberBirth ,member.MemberPhone ,member.MemberEmail ,member.MemberGender,member.MemberAge, member.MemberAddress ,member.MemberStatus);
	}

	function up(no, id, name,birth,phone,email,gender,age,address,status) {
	 $.ajax({
	     url: "dashBoardInclude/membermodify.jsp",
	     type: "POST",
	     data: {
	    	 MemberNo : no,
	    	 MemberId : id,
	    	 MemberName : name,
	    	 MemberBirth : birth,
	    	 MemberPhone : phone,
	    	 MemberEmail : email,
	    	 MemberGender : gender,
	    	 MemberAge : age,
	    	 MemberAddress : address,
	    	 MemberStatus :status
	     },
	     success: function(response) {
	         $('#content').html(response);
	     },
	     error: function(xhr, status, error) {
	         alert("오류 발생: " + error);
	     }
	 });
	}


</script>
<div class="top-content">
	<div class="dash-title-box">
		<h2>회원 정보 관리</h2>
	</div>
	<div class="dash-info-box">
		<h4>회원 조회</h4>
	</div>
	<form name="frm">
		<div class="search-con-box form-con-box">
			<div class="form-title">검색 조건</div>
			<div class="search-box-1 search-box">
				<select name="searchCondition" id="searchCondition">
					<option value="none">선택안함</option>
					<option value="memberId">아이디</option>
					<option value="memberName">이름</option>
				</select> <input type="text" name="conditionValue">
			</div>
		</div>

		<div class="radio-con-box form-con-box">
			<div class="form-title">상태 선택</div>
			<div class="radio-box-1 radio-box">
				<input type="radio" name="status" id="statusAll" value="all"
					class="memberStatus" checked> <label for="statusAll">전체</label>
			</div>
			<div class="radio-box-2 radio-box">
				<input type="radio" name="status" id="statusActive" value="active"
					class="memberStatus"> <label for="statusActive">활성 회원</label>
			</div>
			<div class="radio-box-3 radio-box">
				<input type="radio" name="status" id="statusInactive"
					value="inactive" class="memberStatus"> <label
					for="statusFalse">비활성 회원</label>
			</div>
		</div>
		<div class="button-box">
			<button id="search-btn" class="search-btn" type="button"
				onclick="getMemberList()">검색</button>
			<button class="reset-btn" type="reset" onclick="clearData()">초기화</button>
		</div>
	</form>
</div>
<div class="bottom-content">
	<div class="table-top">
		<h4 class="table-title">회원 리스트</h4>
	</div>
	<div class="content-list">
		<table id="member">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>핸드폰</th>
					<th>이메일</th>
					<th>성별</th>
					<th>나이</th>
					<th>주소</th>
					<th>회원여부</th>
					<th>회원관리</th>
				</tr>

			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
	<!-- 		버튼이 생성되는 위치 -->
</div>

