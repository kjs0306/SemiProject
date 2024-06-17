<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<div class="joinform-box">
    <h1 class="joinform-title">렌트어때 회원가입</h1>
    <form action="../memberJoin.member" class="joinform" method="post" name="frm">
        <div class="form-group id-part">
            <div class="label-tag">
                아이디 <span class="identify">* 아이디를 입력해주세요</span>
            </div>
            <div class="sort">
                <input type="text" name="memberId" placeholder="아이디를 입력해주세요" onblur="validateField(this)" onfocus="hideIdentify(this)" required
                minlength="8" maxlength="20" pattern="[a-z0-9_\-]+" >
                <button type="button" id="checkIdBtn">중복 확인</button>
            </div>
                <span id="idCheck" style="color:red;"></span>
        </div>

        <div class="form-group pwd-part">
            <div id="password" class="label-tag">
                비밀번호 <span class="identify">* 비밀번호를 입력해주세요</span>
            </div>
            <div>
                <input type="password" name="memberPassword" placeholder="(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)" required
                minlength="10" maxlength="16" pattern="[a-zA-Z0-9_\-~!@#$%^&*]+">
            </div>
        </div>

        <div class="form-group pwd-confirm-part">
            <div id="password_confirm" class="label-tag">
                비밀번호 확인 <span class="identify">* 비밀번호를 입력해주세요</span>
            </div>
            <div>
                <input type="password" placeholder="비밀번호와 같이 입력해주세요" required>
            </div>
        </div>

        <div class="form-group name-part">
            <div class="label-tag">
                이름 <span class="identify">* 이름을 입력해주세요</span>
            </div>
            <div>
                <input type="text" name="memberName"  placeholder="이름을 입력해주세요" onblur="validateField(this)" onfocus="hideIdentify(this)" required>
            </div>
        </div>

        <div class="form-group idnum-part">
            <div class="label-tag">
                생년월일 <span class="identify">* 생년월일을 입력해주세요</span>
            </div>
            <div>
                <input type="text" name="memberBirth" id="birthdate" placeholder="-없이 입력하세요" oninput="calculateAge()" onblur="validateField(this)" onfocus="hideIdentify(this)" required
                minlength="8" maxlength="8" pattern = [0-9]+>
            </div>
        </div>

        <div class="form-group tel-part">
            <div class="label-tag">
                휴대전화 <span class="identify">* 전화번호를 입력해주세요</span>
            </div>
            <div>
                <input type="text" name="memberPhone" placeholder="-없이 입력하세요" onblur="validateField(this)" onfocus="hideIdentify(this)" required.
               minlength="10" maxlength="11" pattern = [0-9]+>
            </div>
        </div>

        <div class="form-group email-part">
            <div class="label-tag">
                이메일 <span class="identify">* 이메일을 입력해주세요</span>
            </div>

            <div class="email-box">
                <input type="text" name="memberEmail_1" placeholder="이메일을 입력해주세요" onblur="validateField(this)" onfocus="hideIdentify(this)" required
                pattern ="[a-zA-Z0-9_\-~!@#$%^&*]+">
                <div class="at">
                    @
                </div>
                <input type="text" name="memberEmail_2" pattern="[a-zA-Z]+\.[a-zA-Z]{2,}">
                <select name="" id="">
                    <option value="">직접입력</option>
                    <option value="">naver.com</option>
                    <option value="">daum.net</option>
                    <option value="">google.com</option>
                </select>
            </div>
        </div>

        <div class="form-group flex-part">
            <div class="gender-part" >
                <div class="label-tag">
                    성별
                </div>
                <div class="gender-box">
                    <div class="mb">
                        <input type="radio" name="memberGender" id="gender1" value="M" checked>
                        <label for="gender1">남자</label>
                    </div>
                    
                    <div class="gb">
                        <input type="radio" name="memberGender" id="gender2" value="F">
                        <label for="gender2">여자</label>
                    </div>
                </div>
            </div>
            
            <div class="age-part">
                <div class="label-tag">
                    나이
                </div>
                
                <div>
                    <input type="text" name="memberAge" id="age" readonly>
                </div>
            </div>
        </div>

        <div class="form-group address-part">
            <div class="label-tag">
                주소 <span class="identify">* 주소를 입력해주세요</span>
            </div>
            <div>
                <div class="mail-sort mail-gap">
                    <input type="text" id="sample3_postcode" placeholder="우편번호" name="memberAddress_1" class="w1" onblur="validateField(this)" onfocus="hideIdentify(this)" required>
                    <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" class="w2">
                </div>

                <div class="mail-gap">
                    <input type="text" id="sample3_address" placeholder="주소" name = "memberAddress_2" class="w3" required>
                </div>

                <div class="mail-sort mail-gap">
                    <input type="text" id="sample3_detailAddress" placeholder="상세주소" name = "memberAddress_3" class="w4" required>
                    <input type="text" id="sample3_extraAddress" placeholder="참고항목" name = "memberAddress_4" class="w5">
                </div>
                
                <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                </div>
            </div>
                
        </div>

        <div class="form-group">
            <button type="submit" class="submit-btn">회원가입</button>
        </div>
    </form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>

<script>
$(function() {
    // 중복 확인이 완료되었는지 추적하는 변수
    var idCheckDone = false;

    $("#checkIdBtn").click(function() {
        let idval = {"id" : document.frm.memberId.value};
        $.ajax({
            url : "loginsameCheck",
            type : "get",
            data : idval,
            contentType: 'application/x-www-form-urlencoded; charset=utf-8',
            success : function(data) {
                $("#idCheck").empty();
                $("#idCheck").append(data.map.str);
                // 중복 확인이 성공적으로 완료되었음을 표시
                idCheckDone = true;
            },
            error : function() {
                alert('error');
            }
        });
    });

    // 폼 제출 이벤트에 대한 핸들러
    $("form.joinform").submit(function(e) {
        // 중복 확인이 완료되지 않았다면 폼 제출을 방지
        if (!idCheckDone) {
            alert("아이디 중복 확인이 필요합니다.");
            e.preventDefault(); // 폼 제출 방지
            return false;
        }
        // 중복 확인이 완료되었다면, 폼 정상 제출
    });
});
</script>
<%@include file ="../footer.jsp" %>