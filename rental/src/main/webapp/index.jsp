<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file ="./header.jsp" %>
<main id="container">
    <div id="section-home">
        <div class="section-home-bg">
            <div class="main-book-box">
                <ul class="maintabs">
                    <li class="tab-link select" data-tab="carRent">차량 렌트</li>
                    <li class="tab-link" data-tab="bookSearch">예약 조회</li>
                </ul>
                
                <div id="carRent" class="main-content select">
                    <form action="sub/carBookHome.jsp" class="carrent-form">
                        <input type="text" name="datefilter" value="" placeholder="렌트 기간 선택">
                        <button>차량 조회</button>
                    </form>
                </div>

                <div id="bookSearch" class="main-content">
                    <form action="Book.check" class="booksearch-form">
                        <input type="text" name="bookNum" value="" placeholder="예약번호 입력">
                        <button>예약 조회</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="section-event" class="section">
        <div class="section-event-box">
            <div class="inner">
                <div class="sec-top-con">
                    <h1 class="section-title">프로모션 이벤트</h1>
                    <span class="more-btn">
                        <a href="<%=request.getContextPath()%>/board/promoBoard.jsp">더보기 ></a>
                    </span>
                </div>

                <ul class="event-list-box">
                    <li class="event-list">
                        <a href="<%=request.getContextPath()%>/board/promoBoard.jsp">
                            <img src="<%=request.getContextPath()%>/images/event_img_01.png" alt="서울지역 전 지점 최대 55% 할인 이벤트 미리보기 사진">
                            <p class="event-title">서울지역 전 지점 최대 55% 할인</p>
                        </a>
                    </li>

                    <li class="event-list">
                        <a href="<%=request.getContextPath()%>/board/promoBoard.jsp">
                            <img src="<%=request.getContextPath()%>/images/event_img_02.png" alt="안양지점 카니발 대여 시 요금 할인 이벤트 미리보기 사진">
                            <p class="event-title">안양지점 카니발 대여 시 요금 할인</p>
                        </a>
                    </li>

                    <li class="event-list">
                        <a href="<%=request.getContextPath()%>/board/promoBoard.jsp">
                            <img src="<%=request.getContextPath()%>/images/event_img_03.png" alt="경기도 안심 픽업 서비스 출시 기념 이벤트 미리보기 사진">
                            <p class="event-title">경기도 안심 픽업 서비스 출시 기념</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div id="section-lowprice" class="section">
        <div class="section-lowprice-box">
            <div class="inner">
                <div class="sec-top-con">
                    <h1 class="section-title">최저가 렌트카 추천</h1>
                    <span class="more-btn">
                        <a href="sub/carBookHome.jsp">더보기 ></a>
                    </span>
                </div>
                <ul class="lowprice-list-box">
                    
                </ul>
            </div>
        </div>
    </div>

    <div id="section-typecar" class="section">
        <div class="section-typecar-box">
            <div class="inner">
                <div class="sec-top-con">
                    <h1 class="section-title">분류별 렌트카 보기</h1>
                    <span class="more-btn">
                        <a href="sub/carBookHome.jsp">더보기 ></a>
                    </span>
                </div>
<!-- 어떤 자동차를 찾을지 거는 조건문 -->

                <ul class="cartabs">
                    <li class="car-link select" data-tab="경차">소형차</li>
                    <li class="car-link" data-tab="준중형">준중형차</li>
                    <li class="car-link" data-tab="중형">중형차</li>
                    <li class="car-link" data-tab="준대형">준대형</li>
                    <li class="car-link" data-tab="SUV">SUV</li>
                </ul>
<!-- 자동차 찾는 조건문 끝 -->
<!-- 자동차가 실제 들어갈 div -->
                <div id="compactCar" class="car-content select">
                    <ul class="typecar-list-box">
                    
                    </ul>
                </div>
<!-- 자동차가 실제 들어갈 div 끝-->
                
            </div>
        </div>
    </div>
    <!-- section-type-car -->

    <div id="section-banner" class="section">
        <div class="section-banner-box section-banner-bg">
            <div class="banner-title">
                <span class="text-point">관리</span>도 <span class="text-point">혜택</span>도 <span class="text-point">안전</span>도 렌트어때와 함께
            </div>
        </div>
    </div>
    <!-- section-banner -->
    
    <div id="section-review" class="section">
        <div class="section-review-box">
            <div class="inner">
                <div class="sec-top-con2">
                    <h1 class="section-title">고객님의 소중한 후기</h1>
                </div>

                <ul class="review-list-box">
                    <li class="review-list">
                        <div class="review-top">
                            <div class="star-point">★★★★★</div>
                            <div class="member-name">박*영</div>
                            <div class="write-date">2024.04.05</div>
                        </div>
                        <div class="review-mid">
                            <div class="review-info">
                                렌트까지 5분정도 밖에 안걸린것 같아요 신속 정확해서 좋았어요 데스크에 여직원분도 친절하세요 지인들에게도 추천하고 여행갈때마다 자주 이용할 것 같습니다.
                            </div>
                        </div>
                        <div class="review-bot">
                            <div class="review-hash-tag">
                                <span class="tag-list">아반떼 SD</span>
                                <span class="tag-list">서울</span>
                            </div>
                        </div>
                    </li>

                    <li class="review-list">
                        <div class="review-top">
                            <div class="star-point">★★★★★</div>
                            <div class="member-name">박*영</div>
                            <div class="write-date">2024.04.05</div>
                        </div>
                        <div class="review-mid">
                            <div class="review-info">
                                렌트까지 5분정도 밖에 안걸린것 같아요 신속 정확해서 좋았어요 데스크에 여직원분도 친절하세요 지인들에게도 추천하고 여행갈때마다 자주 이용할 것 같습니다.
                            </div>
                        </div>
                        <div class="review-bot">
                            <div class="review-hash-tag">
                                <span class="tag-list">아반떼 SD</span>
                                <span class="tag-list">서울</span>
                            </div>
                        </div>
                    </li>

                    <li class="review-list">
                        <div class="review-top">
                            <div class="star-point">★★★★★</div>
                            <div class="member-name">박*영</div>
                            <div class="write-date">2024.04.05</div>
                        </div>
                        <div class="review-mid">
                            <div class="review-info">
                                렌트까지 5분정도 밖에 안걸린것 같아요 신속 정확해서 좋았어요 데스크에 여직원분도 친절하세요 지인들에게도 추천하고 여행갈때마다 자주 이용할 것 같습니다.
                            </div>
                        </div>
                        <div class="review-bot">
                            <div class="review-hash-tag">
                                <span class="tag-list">아반떼 SD</span>
                                <span class="tag-list">서울</span>
                            </div>
                        </div>
                    </li>

                    <li class="review-list">
                        <div class="review-top">
                            <div class="star-point">★★★★★</div>
                            <div class="member-name">박*영</div>
                            <div class="write-date">2024.04.05</div>
                        </div>
                        <div class="review-mid">
                            <div class="review-info">
                                렌트까지 5분정도 밖에 안걸린것 같아요 신속 정확해서 좋았어요 데스크에 여직원분도 친절하세요 지인들에게도 추천하고 여행갈때마다 자주 이용할 것 같습니다.
                            </div>
                        </div>
                        <div class="review-bot">
                            <div class="review-hash-tag">
                                <span class="tag-list">아반떼 SD</span>
                                <span class="tag-list">서울</span>
                            </div>
                        </div>
                    </li>

                    <li class="review-list">
                        <div class="review-top">
                            <div class="star-point">★★★★★</div>
                            <div class="member-name">박*영</div>
                            <div class="write-date">2024.04.05</div>
                        </div>
                        <div class="review-mid">
                            <div class="review-info">
                                렌트까지 5분정도 밖에 안걸린것 같아요 신속 정확해서 좋았어요 데스크에 여직원분도 친절하세요 지인들에게도 추천하고 여행갈때마다 자주 이용할 것 같습니다.
                            </div>
                        </div>
                        <div class="review-bot">
                            <div class="review-hash-tag">
                                <span class="tag-list">아반떼 SD</span>
                                <span class="tag-list">서울</span>
                            </div>
                        </div>
                    </li>

                    <li class="review-list">
                        <div class="review-top">
                            <div class="star-point">★★★★★</div>
                            <div class="member-name">박*영</div>
                            <div class="write-date">2024.04.05</div>
                        </div>
                        <div class="review-mid">
                            <div class="review-info">
                                렌트까지 5분정도 밖에 안걸린것 같아요 신속 정확해서 좋았어요 데스크에 여직원분도 친절하세요 지인들에게도 추천하고 여행갈때마다 자주 이용할 것 같습니다.
                            </div>
                        </div>
                        <div class="review-bot">
                            <div class="review-hash-tag">
                                <span class="tag-list">아반떼 SD</span>
                                <span class="tag-list">서울</span>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- section-review -->

    <div id="section-partner" class="section">
        <div class="section-partner-box">
            <div class="inner">
                <div class="sec-top-con2">
                    <h1 class="section-title">렌트어때 제휴 파트너사</h1>
                    <h3 class="section-sub-title">
                        렌트어때와 제휴를 맺은 호텔&리조트 및 건증된 맛집 안내입니다.
                    </h3>
                </div>

                <ul class="partner-list-box">
                    <li class="partner-list">
                        <img src="<%=request.getContextPath()%>/images/partner_img_1.png" alt="">
                        <div class="brand-box">
                            <div class="brand-name">시골한우 시골돼지(서면점)</div>
                            <div class="brand-info">지역 맛집으로 유명한 프렌차이즈점</div>
                            <div class="brand-tel">TEL. 051-746-7884</div>
                            <div class="brand-address">부산광역시 해운대구 마린시티3로 23벽산이오렌지프라자</div>
                        </div>
                    </li>

                    <li class="partner-list">
                        <img src="<%=request.getContextPath()%>/images/partner_img_2.png" alt="">
                        <div class="brand-box">
                            <div class="brand-name">거제도 프리밀리 호텔&리조트</div>
                            <div class="brand-info">거제의 수려한 자연을 담은 럭셔리</div>
                            <div class="brand-tel">TEL. 055-682-6006</div>
                            <div class="brand-address">부산광역시 해운대구 마린시티3로 23벽산이오렌지프라자</div>
                        </div>
                    </li>

                    <li class="partner-list">
                        <img src="<%=request.getContextPath()%>/images/partner_img_3.png" alt="">
                        <div class="brand-box">
                            <div class="brand-name">부산 해운대 비지니스 호텔</div>
                            <div class="brand-info">청결하고 합리적인 가격</div>
                            <div class="brand-tel">TEL. 051-746-7884</div>
                            <div class="brand-address">부산광역시 해운대구 마린시티3로 23벽산이오렌지프라자</div>
                        </div>
                    </li>

                    <li class="partner-list">
                        <img src="<%=request.getContextPath()%>/images/partner_img_4.png" alt="">
                        <div class="brand-box">
                            <div class="brand-name">부산 해운대 비지니스 호텔</div>
                            <div class="brand-info">청결하고 합리적인 가격</div>
                            <div class="brand-tel">TEL. 051-746-7884</div>
                            <div class="brand-address">부산광역시 해운대구 마린시티3로 23벽산이오렌지프라자</div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- section-partner -->

    <div id="section-boardlist" class="section">
        <div class="section-boardlist-box">
            <div class="inner">
                <div class="board-sort-box">
            		<div class="board-main-box">
                		<div class="board-section">
                    <div class="board-title-m">공지사항</div>
                    <a href="board/annoBoard.jsp" class="more-btn">더보기 ></a>
                </div>
                <table class="main-box">
                <tbody>
                
                </tbody>
                    
                </table>
            </div>

                    <div class="board-main-box">
                        <div class="board-section">
                            <div class="board-title-m">예약상담 및 문의</div>
                            <a href class="more-btn">더보기 ></a>
                        </div>
                        <table>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                        </table>
                    </div>

                    <div class="board-main-box">
                        <div class="board-section">
                            <div class="board-title-m">자주 묻는 질문</div>
                            <a href class="more-btn">더보기 ></a>
                        </div>
                        <table>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                            <tr>
                                <td><a href="">승합 좌석 배열 안내</a></td>
                                <td>2024-04-10</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
//AJAX를 통해 최저가 렌트카 목록을 가져와서 화면에 표시하는 함수
function fetchLowPriceCars() {
 var search = {
       "CAR_LOWPRICE": true,
       "CAR_STATUS": "예약가능"
 }
  $.ajax({
      url: "carSelectForm.bo", 
      type: "GET",
      data: search,
      async: false,
      cache: false,
      success: function(responseData) {
          // 서버에서 받아온 데이터로 최저가 렌트카 목록을 생성하여 화면에 표시합니다
          
          var carList = responseData.carList;
          var lowPriceList = $(".lowprice-list-box");
          
          
          carList.slice(0,3).forEach(function(car) {
             let btnHtml = "<button onclick='carinsert(this)' class='go-book-btn'  data-car='" + JSON.stringify(car) + "'>예약하기</button>";
          var lowPrice_image = car.CAR_NUMBER + "_" + car.CAR_NAME+"1번.png";
          var liContent =
                  "<li class='lowprice-list'>" +
                  "<img src='./upload/" + lowPrice_image + "' alt='이미지 준비중입니다.'>" +
                  "<div>" +
                  "<p class='car-name'>" + car.CAR_NAME + "</p>" +
                  "<p class='car-price'>" + car.CAR_PRICE.toLocaleString() + "원</p>" + "</div>" +
                  "<div>" + btnHtml + "</div>" +
                  "</li>"; 
                  
                 lowPriceList.append(liContent);
          });
          
      },
      error: function() {
          alert("데이터를 불러오는 데 실패했습니다.");
      }
  });
}
  
function fetchCarCategory(carType) {
  var search = {
      "CAR_TYPE": carType,
      "CAR_STATUS": "예약가능"
  };
  
  $.ajax({
      url: "carSelectForm.bo",
      type: "GET",
      data: search,
      cache: false,
      dataType : "json",
      success: function(responseData) {
          var carList = responseData.carList;
          // 상위 요소인 #compactCar 내에서 .typecar-list-box를 찾습니다.
          var typecarList = $(".typecar-list-box");
          typecarList.empty(); // 이전 목록을 지웁니다
          
          carList.slice(0,4).forEach(function(car) {
             let btnHtml = "<button onclick='carinsert(this)' class='go-book-btn'  data-car='" + JSON.stringify(car) + "'>예약하기</button>";
              var car_image = car.CAR_NUMBER + "_" + car.CAR_NAME + "1번.png";
              var liContent =
                  '<li class="typecar-list">' +
                  '<img src="./upload/' + car_image + '" alt="이미지 준비중입니다.">' +
                  "<div>" +
                  "<p class='car-name'>" + car.CAR_NAME + "</p>" +
                  "<p class='car-price'>" + car.CAR_PRICE.toLocaleString() + "원~</p>" + "</div>" + btnHtml +
                  "</li>"; 
                  
              typecarList.append(liContent);
              
          });
       // 데이터가 로드된 후에 요소를 표시합니다.
          typecarList.show();
      },
      error: function() {
          alert("데이터를 불러오는 데 실패했습니다.");
      }
  });
}

function carinsert(element){
	 var nm = '<%= name%>';
	 if(nm == "null"){
		    alert("회원 전용 페이지 입니다.");
		 location.href="sub/loginhome.jsp";
	 }else{
		 let car = $(element).data('car');
		 carin(car.CAR_NAME, car.CAR_PRICE);
	 }
}  
function carin(carName, carPrice){
	location.href = "sub/nondatebookpage.jsp?carName=" + encodeURIComponent(carName) + "&carPrice=" + encodeURIComponent(carPrice);
}



function annList() {
  $.ajax({
      url: "ntcList.no",
      type: "post",
      cache: false,	
      dataType: 'json',
      success: function(response) {
          $(".main-box tbody").empty();

          var count = 0;
          $.each(response.articleList, function(i, obj) {
              if (count >= 5) {
                  return false; 
              }

              var rowHtml = "<tr>" +
              "<td><a href='board/annoBoard.jsp?number=" + obj.NOTICENUM + "'>" + obj.NOTICETITLE + "</a></td>" +
                            "<td>" +  obj.NOTICEDATE.slice(0,10) + "</td>" +
                            "</tr>";
              $(".main-box tbody").append(rowHtml); //310번줄 공지사항 부분에 테이블에 main-box 클래스 주시고 테이블밑에 자식요소로 tbody 넣어줄것 !
              count++; 
          });
      },
      error: function(xhr, status, errorThrown) {
          console.error('AJAX error:', status, errorThrown);
      }
  });
}


$(document).ready(function() {
  // 페이지 로드 시 최저가 렌트카 목록을 가져옵니다
  fetchLowPriceCars();
  fetchCarCategory("경차");
  annList();

  $(".car-link").click(function() {
      var carType = $(this).data("tab");
      fetchCarCategory(carType);
  });
});
</script>
<%@include file ="./footer.jsp" %>