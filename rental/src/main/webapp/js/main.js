function toggleSidebar() {
    const menu = document.querySelector(".menu");
    menu.classList.toggle("active");
};

$('.go_top').click(function(){
    $('html,body').animate({
        scrollTop : 0
    });
});

$(window).scroll(function(){
    var s = $(window).scrollTop();

    if(s>=700){
        $('.go_top').show();
    } else {
        $('.go_top').hide();
    }
}); 

//아코디언 클릭 이벤트 정의
$('.accordion-menu').hide();
$(".accordion-btn").click(function() {
    $(this).next(".accordion-menu").stop().slideToggle(300);
    $(this).toggleClass('on').siblings().removeClass('on');
    $(this).next(".accordion-menu").siblings(".accordion-menu").slideUp(300); // 1개씩 펼치기
});

$(window).scroll(function(){
    var s = $(window).scrollTop();
    if(s>=1){
        $('#header').css({"box-shadow": "0 4px 4px -4px black"});
    } else {
        $('#header').css({ "box-shadow": "none" });
    }
});

$(document).ready(function(){
    $('ul.cartabs li').click(function(){
        var tab_id = $(this).attr('data-tab');
        $('ul.cartabs li').removeClass('select');
        $('.car-content').removeClass('select');
        $(this).addClass('select');
        $("#"+tab_id).addClass('select');
    })
})

$(document).ready(function(){
    $('ul.maintabs li').click(function(){
        var tab_id = $(this).attr('data-tab');
        $('ul.maintabs li').removeClass('select');
        $('.main-content').removeClass('select');
        $(this).addClass('select');
        $("#"+tab_id).addClass('select');
    })
})

$(document).ready(function(){
    $('ul.myinfotabs li').click(function(){
        var tab_id = $(this).attr('data-tab');
        $('ul.myinfotabs li').removeClass('myselect');
        $('.my-content').removeClass('myselect');
        $(this).addClass('myselect');
        $("#"+tab_id).addClass('myselect');
    })	
});

function readURL(input) {
    if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
            document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('preview').src = "";
    }
}

$(function() {
    $('input[name="datefilter"]').daterangepicker({
        autoUpdateInput: false,
        locale: {
            format: 'YYYY/MM/DD',
            applyLabel: '확인',
            cancelLabel: '닫기',
            monthNames: [
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월"
            ],
        },
        minDate: moment()
    });
    $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
    });
    $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });
});


$(function() {
    $('input[name="selectdate"]').daterangepicker({

        autoUpdateInput: false,
        locale: {
            format: 'YYYY/MM/DD',
            applyLabel: '확인',
            cancelLabel: '닫기',
            monthNames: [
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월"
            ],
        },
        minDate: moment()
    });

    $('input[name="selectdate"]').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
    });

    $('input[name="selectdate"]').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });

});


// 우편번호 찾기 찾기 화면을 넣을 element
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function sample3_execDaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample3_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample3_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample3_postcode').value = data.zonecode;
            document.getElementById("sample3_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample3_detailAddress").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = size.height+'px';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}

// 다음 주소 API 함수



function calculateAge() {
    const birthdate = document.getElementById('birthdate').value;

    // 입력값이 8자리가 아니라면 함수 종료
    if (birthdate.length != 8) {
        document.getElementById('age').value = '';
        return;
    }

    // 현재 날짜 가져오기
    const today = new Date();
    const thisYear = today.getFullYear();
    const thisMonth = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
    const thisDay = today.getDate();

    // 입력값에서 년, 월, 일 분리
    const birthYear = parseInt(birthdate.substring(0, 4), 10);
    const birthMonth = parseInt(birthdate.substring(4, 6), 10);
    const birthDay = parseInt(birthdate.substring(6, 8), 10);

    // 나이 계산
    let age = thisYear - birthYear;
    if (thisMonth < birthMonth || (thisMonth === birthMonth && thisDay < birthDay)) {
        age--; // 생일이 지나지 않았다면 나이에서 1 빼기
    }

    // 결과 출력
    document.getElementById('age').value = age;
}

// 회원가입폼 나이 계산 함수


// 유효성 검사 함수
document.addEventListener('DOMContentLoaded', function() {
    // 비밀번호 및 비밀번호 확인 입력칸에 대한 blur 이벤트 리스너 추가
    const passwordInput = document.querySelector('.pwd-part input[type="password"]');
    const passwordConfirmInput = document.querySelector('.pwd-confirm-part input[type="password"]');

    if (passwordInput && passwordConfirmInput) {
        passwordInput.addEventListener('blur', function() {
            validatePasswordInput(passwordInput);
            // 비밀번호 확인 입력칸의 유효성도 함께 검사
            validatePasswordConfirmation(passwordInput, passwordConfirmInput);
        });

        passwordConfirmInput.addEventListener('blur', function() {
            validatePasswordConfirmation(passwordInput, passwordConfirmInput);
        });
    }
});

// 비밀번호 확인 검사 함수
function validatePasswordConfirmation(passwordInput, passwordConfirmInput) {
    const identifyElement = passwordConfirmInput.closest('.form-group').querySelector('.identify');
    if (passwordInput.value === passwordConfirmInput.value) {
        // 비밀번호와 비밀번호 확인 입력칸의 값이 동일하면 identify 요소를 숨깁니다.
        if (identifyElement) {
            identifyElement.style.display = 'none';
        }
    } else {
        // 값이 다르면 identify 요소를 보이게 하고 메시지를 표시합니다.
        if (identifyElement) {
            identifyElement.textContent = '* 비밀번호가 일치하지 않습니다.';
            identifyElement.style.display = 'inline';
        }
    }
}

// 개별 필드 검사 함수
function validateField(input) {
    const identifyElement = input.closest('.form-group').querySelector('.identify');
    if (input.value.trim()) {
        // 입력값이 있으면 identify 요소를 숨깁니다.
        if (identifyElement) {
            identifyElement.style.display = 'none';
        }
    } else {
        // 입력값이 없으면 identify 요소를 보이게 합니다.
        if (identifyElement) {
            identifyElement.style.display = 'inline';
        }
    }
}

// 비밀번호 조건 검사 함수
function validatePasswordInput(input) {
    const identifyElement = input.closest('.form-group').querySelector('.identify');
    if (validatePassword(input.value)) {
        // 비밀번호 조건을 만족하면 identify 요소를 숨깁니다.
        if (identifyElement) {
            identifyElement.style.display = 'none';
        }
    } else {
        // 비밀번호 조건을 만족하지 않으면 identify 요소를 보이게 합니다.
        if (identifyElement) {
            identifyElement.textContent = '* 비밀번호 조건을 만족하지 않습니다.';
            identifyElement.style.display = 'inline';
        }
    }
}

// 비밀번호 검사 로직
function validatePassword(password) {
    const regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,16}$/;
    // 이 라인을 수정하여 비밀번호 조건을 올바르게 검사합니다.
    // 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합을 감지하는 정확한 정규식으로 변경해야 합니다.
    return regex.test(password);
}

// 회원가입퐘 유효성 검사



// 비밀번호 찾기 일치 함수

    const memberPassword = document.getElementById('memberPassword');
    const member_confirm_password = document.getElementById('member_confirm_password');
    const submit_button = document.getElementById('submit_button');



    memberPassword.onkeyup = function(){
      validatePasswordSame();
   };
    member_confirm_password.onkeyup = function(){
      validatePasswordSame();
   };
   
    function validatePasswordSame(){
        // 두 입력 필드가 모두 값이 입력되었고, 그 값들이 일치할 때만 버튼을 표시
        if(memberPassword.value && member_confirm_password.value && memberPassword.value === member_confirm_password.value){
            submit_button.style.display = 'block';
        } else {
            submit_button.style.display = 'none';
        }
    }





