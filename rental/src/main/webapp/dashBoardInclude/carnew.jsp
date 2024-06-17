<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="adm-box">
    <div class="dash-title-box">
        <h2>차량 정보 관리</h2>
    </div>

    <div class="adm-form-box">
        <h4 class="adm-form-title">등록 차량 등록</h4>
        <form class="adm-form" enctype="multipart/form-data" method="post">
            <div class="form-frame"> 
                <div class="label-tag">차량 등록 번호</div>
                <input type="text" id="CAR_NUMBER" name="CAR_NUMBER" placeholder="숫자 4자리까지만 가능" >
            </div>

            <div class="form-frame">
                <div class="label-tag">차종</div>
                <input type="text" id="CAR_TYPE" name="CAR_TYPE" placeholder="경차, 준중형, 중형, 준대형, SUV 중 기술">
            </div>

            <div class="form-frame">
                <div class="label-tag">차량 이름</div>
                <input type="text" id="CAR_NAME" name="CAR_NAME" placeholder="차량 이름 입력">
            </div>
            
            <div class="form-frame">
                <div class="label-tag">연료</div>
                <input type="text" id="CAR_FUEL" name="CAR_FUEL" placeholder="LPG, 가솔린, 경차, 디젤, 전기, 하이브리드만 기술">
            </div>

            <div class="form-frame">
                <div class="label-tag">제조사</div>
                <input type="text" id="CAR_COMPANY" name="CAR_COMPANY" placeholder="제조사 입력">
            </div>

            <div class="form-frame">
                <div class="label-tag">연식</div>
                <input type="text" id="CAR_YEAR" class="s-input s-mr" name="CAR_YEAR" placeholder="연식 4자리 숫자만 가능">
                <div class="label-tag">인승</div>
                <input type="text" id="CAR_SEATER" class="s-input" name="CAR_SEATER" placeholder="인승 입력">
            </div>

            <div class="form-frame">
                <div class="label-tag">차종보험연령</div>
                <input type="text" id="CAR_INSURANCEAGE" class="s-input s-mr" name="CAR_INSURANCEAGE" placeholder="보험연령 입력">
                <div class="label-tag">가격</div>
                <input type="text" id="CAR_PRICE" class="s-input" name="CAR_PRICE" placeholder="가격 입력">
            </div>

            <div class="form-frame img-frame">
                <div class="label-tag">차량 이미지</div>
                <input type="file" id="CAR_IMAGE" name="CAR_IMAGE" onchange="readURL(this);" multiple>
                <img id="preview"/>
            </div>

         <input type="text" id="CAR_STATUS" name="CAR_STATUS" value="예약가능" hidden>

            <div class="btn-frame">
               <button type="button" onclick="enroll_carInput()">등록</button>
             <button type="button" onclick="back()">취소</button>
            </div>
            
        </form>
    </div>
</div>

<script>

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').style.display = 'block';
                document.getElementById('preview').setAttribute('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    function enroll_carInput() {
        // 각 입력 필드의 값
        var carNumber = $('#CAR_NUMBER').val();
        var carType = $('#CAR_TYPE').val();
        var carName = $('#CAR_NAME').val();
        var carFuel = $('#CAR_FUEL').val();
        var carCompany = $('#CAR_COMPANY').val();
        var carYear = $('#CAR_YEAR').val();
        var carSeater = $('#CAR_SEATER').val();
        var carInsuranceAge = $('#CAR_INSURANCEAGE').val();
        var carPrice = $('#CAR_PRICE').val();
        var carStatus = $('#CAR_STATUS').val();
        var carImage = $('#CAR_IMAGE')[0].files;
        
        var check1 = true;
        var check2 = true;
        var check3 = true;
        var check4 = true;
        
        
        // 각 입력 필드에 대한 유효성 검사
        if (!carNumber || isNaN(carNumber) || carNumber.length > 4) {
            check1 = false;
        }
        
        var allowedTypes = ['경차', '준중형', '중형', '준대형', 'SUV'];
        if (!allowedTypes.includes(carType)) {
            check2 = false;
        }
        
        var allowedFuel = ['LPG', '가솔린', '디젤', '전기', '하이브리드'];
        if (!allowedTypes.includes(carType)) {
            check3 = false;
        }
        
        if (!carYear || isNaN(carYear) || carYear.length !== 4) {
            check4 = false;
        }
        

        if(check1 && check2 && check3 && check4){
              // FormData 객체 생성
              var formData = new FormData();
              
              // 차량 정보 데이터 추가
              formData.append('CAR_NUMBER', carNumber);
              formData.append('CAR_TYPE', carType);
              formData.append('CAR_NAME', carName);
              formData.append('CAR_FUEL', carFuel);
              formData.append('CAR_COMPANY', carCompany);
              formData.append('CAR_YEAR', carYear);
              formData.append('CAR_SEATER', carSeater);
              formData.append('CAR_INSURANCEAGE', carInsuranceAge);
              formData.append('CAR_PRICE', carPrice);
              formData.append('CAR_STATUS', carStatus);
              
              // 이미지 파일 추가
              for (var i = 0; i < carImage.length; i++) {
                  formData.append('CAR_IMAGE', carImage[i]);
              }
      
              // AJAX 요청 보내기
              $.ajax({
                   url: "carInsertForm.bo",
                   type: "POST",
                   data: formData,
                   processData: false, 
                   contentType: false, 
                   cache: false,
                   async: false,
                   success: function() {
                       back();
                   },
                   error: function() {
                       $("#content").html("페이지 로딩 중 오류가 발생했습니다.");
                   }
               });
        }else if(check1 == false){
           alert("차량 등록 번호를 4자리 숫자로 입력하세요.");
        }else if(check2 == false){
           alert("차량 종류는 경차, 준중형, 중형, 준대형, SUV 중 하나여야 합니다.");
        }else if(check3 == false){
           alert("차량 종류는 LPG, 가솔린, 디젤, 전기, 하이브리드 중 하나여야 합니다.");
        }else if(check4 == false){
           alert("연식은 4자리 숫자만 가능.");
        }
        
    }


    
    function back() {
        $.ajax({
             url:"dashBoardInclude/carmng.jsp", //전 페이지
             type: "GET",
             async : false,
             success: function(data) {
                 $("#content").html(data);
             },
             error: function() {
                 $("#content").html("Error loading page.");
             }
         });
     }
</script>
