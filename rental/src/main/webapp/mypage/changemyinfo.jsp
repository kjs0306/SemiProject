<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
String Id = (String) session.getAttribute("memberId");
%> 
<script>

   console.log("회원정보 페이지 memberId","<%=Id%>");
   var info ={ "MemberId"  : "<%=Id%>"};
   console.log("---changemyinfo.jsp---");
   console.log(info);
   
   function getMyinfo() {

      $.ajax({
         url : "MemberGetMyinfoAction.member",
         type : "GET",
         data : info,
         success : function(data) {
            $('#memberNo').val(data.member.MemberNo);
            $('#memberId').val(data.member.MemberId);
//              $('#memberPassword1').val(data.member.MemberPassword); 
//              $('#memberPassword2').val(data.member.MemberPassword); 
            $('#memberName').val(data.member.MemberName);
            $('#memberBirth').val(data.member.MemberBirth); 
            $('#memberPhone').val(data.member.MemberPhone);
            $('#memberEmail1').val(data.member.MemberEmail.split("@")[0]);
            $('#memberEmail2').val(data.member.MemberEmail.split("@")[1]);
            $('input[name="memberGender"]').val(data.member.MemberGender);
            $('input[name="memberAge"]').val(data.member.MemberAge);
            var address = data.member.MemberAddress.replace("우편번호:","");
            var address3 = address.split("참고항목 :")[1]; 
            var address2 = address.split("참고항목 :")[0].split("상세주소: ")[1];
            var address1 = address.split("참고항목 :")[0].split("상세주소: ")[0].split("주소: ")[1]; 
            var zipCode = address.split("참고항목 :")[0].split("상세주소: ")[0].split("주소: ")[0]; 
            $('input[name="zipCode"]').val(zipCode); 
            $('input[name="memberAddress2"]').val(address1); 
            $('input[name="memberAddress3"]').val(address2); 
            $('input[name="memberAddress4"]').val(address3); 
            
         },
         error : function() {

            alert("cannot load your data. Wait for a second and retry.")
         }
      });
   };
   

   
   
   (function() {
      getMyinfo();

   })();
</script>
<div id="change-myinfo" class="my-content">
   <h1 class="mypage-tabmenu">내 정보 변경</h1>
   <div class="changemyinfo-content-box">
      <form action="MemberUpdateMyinfoAction.member" method="post" class="adm-form member-modify">
         <div class="form-frame number-part">
            <div class="label-tag">회원 번호</div>
            <input type="text" name="memberNo" id="memberNo" readonly> 
         </div>

         <div class="form-frame id-part">
            <div class="label-tag">아이디</div>
            <input type="text" name="memberId" id="memberId" readonly>
         </div>

         <div style="display: none"class="form-frame pwd-part">
            <div  class="label-tag">비밀번호</div>
            <input type="password" id="memberPassword1">
         </div>

         <div style="display: none"class="form-frame pwd-part-con">
            <div class="label-tag">비밀번호 확인</div>
            <input type="password" name="memberPassword" id="memberPassword2">
         </div>

         <div class="form-frame name-part">
            <div class="label-tag">이름</div>
            <input type="text" name="memberName" id="memberName" readonly>
         </div>

         <div class="form-frame birth-part">
            <div class="label-tag">생년월일</div>
            <input type="text" id="memberBirth" readonly>
         </div>

         <div class="form-frame tel-part">
            <div class="label-tag">핸드폰번호</div>
            <input type="text" name="memberPhone" id="memberPhone">
         </div>

         <div class="form-frame email-part">
            <div class="label-tag">이메일</div>
            <input type="text" id="memberEmail1"name="memberEmail1" class="first-email">
            <div class="at">@</div>
            <input type="text" class="second-email" name="memberEmail2" id="memberEmail2" placeholder="직접입력">
            <select name="" id="">
               <option value="">선택안함</option>
               <option value="">naver.com</option>
               <option value="">daum.net</option>
               <option value="">google.com</option>
            </select>
         </div>

         <div class="form-frame flex-part">
            <div class="gender-part">
               <div class="label-tag" for="">성별</div>
               <div class="gender-box">
                  <div class="mb">
                     <input type="text" name="memberGender" id="gender1" value="" checked
                        readonly>
                  </div>
               </div>
            </div>
         </div>

         <div class="form-frame flex-part">
            <div class="age-part">
               <div class="label-tag">나이</div>

               <div>
                  <input type="text" name="memberAge" id="age" readonly>
               </div>
            </div>
         </div>

         <div class="form-frame address-part">
            <div class="label-tag">주소</div>
            <div>
               <div class="mail-sort mail-gap">
                  <input type="text" id="sample3_postcode" name="zipCode" placeholder="우편번호"
                     class="w1" onblur="validateField(this)"
                     onfocus="hideIdentify(this)" required> <input
                     type="button" onclick="sample3_execDaumPostcode()"
                     value="우편번호 찾기" class="w2">
               </div>

               <div class="mail-gap">
                  <input type="text" id="sample3_address" name="memberAddress2" placeholder="주소"
                     class="w3" required>
               </div>

               <div class="mail-sort mail-gap">
                  <input type="text" id="sample3_detailAddress" name="memberAddress3" placeholder="상세주소"
                     class="w4" required> <input type="text"
                     id="sample3_extraAddress" name="memberAddress4" placeholder="참고항목" class="w5">
               </div>

               <div id="wrap"
                  style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
                  <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                     id="btnFoldWrap"
                     style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
                     onclick="foldDaumPostcode()" alt="접기 버튼">
               </div>
            </div>
         </div>

         <div class="btn-frame">
            <button type="submit" >수정</button>
            <button onclick="back()">취소</button>
         </div>
      </form>
   </div>
</div>
<script>
$("form.member-modify").submit(function(e) {
   const pass = $('#memberPassword1').val();
   const passConfirm = $('#memberPassword2').val();
   
   console.log("pass",pass);
   console.log("pasConfirm",passConfirm);
    // 중복 확인이 완료되지 않았다면 폼 제출을 방지
    if (pass === passConfirm) {
       alert("회원정보를 변경하겠습니다.");
    }else{
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        e.preventDefault(); // 폼 제출 방지
        return false;
       
    }
});
</script>