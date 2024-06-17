<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    
    function submit() {
        alert("해당 정보가 수정되었습니다.");
    }
    
    function back() {
       
       $.ajax({
            url:"dashBoardInclude/membermng.jsp",
            type: "GET",
            success: function(data) {
                $("#content").html(data);
            },
            error: function() {
                $("#content").html("Error loading page.");
            }
        });
    }
    </script>
<div class="adm-box" style="padding: 50px;">
  <div class="dash-title-box">
      <h2>회원 정보</h2>
  </div>

  <div class="adm-form-box">
      <h4 class="adm-form-title">회원 정보 수정</h4>
      <form action="MemberUpdateAdminAction.member" method = "post"class="adm-form member-modify">


<%
int memberNo = Integer.parseInt(request.getParameter("MemberNo"));
String memberId = request.getParameter("MemberId");
String memberName = request.getParameter("MemberName");
String memberBirth = request.getParameter("MemberBirth");
String memberPhone = request.getParameter("MemberPhone");
String memberEmail = request.getParameter("MemberEmail");
String memberEmail1 = request.getParameter("MemberEmail").split("@")[0];
String memberEmail2 = request.getParameter("MemberEmail").split("@")[1];
String memberGender = request.getParameter("MemberGender");
String memberAge = request.getParameter("MemberAge");
String memberAddress = request.getParameter("MemberAddress");
String address = memberAddress.replace("우편번호:",""); //06611 주소: 서울 서초구 사평대로58길 6 상세주소: 더현대 ,(서초동)
String address3 = address.split("참고항목 :")[1]; //참고항목
String address2 = address.split("참고항목 :")[0].split("상세주소: ")[1];// 상세주소
String address1 = address.split("참고항목 :")[0].split("상세주소: ")[0].split("주소: ")[1]; // 주소
String zipCode = address.split("참고항목 :")[0].split("상세주소: ")[0].split("주소: ")[0]; // 우편번호
String memberStatus = request.getParameter("MemberStatus");
%>

          <div class="form-frame number-part">
              <div class="label-tag">회원 번호</div>
              <input type="text" id="" name="memberNo" value="<%= memberNo %>" readonly>
          </div>

          <div class="form-frame id-part">
              <div class="label-tag">아이디</div>
              <input type="text" id="" name="memberId" value="<%= memberId %>"  readonly>
          </div>

          <div style="display: none"class="form-frame pwd-part">
              <div class="label-tag">비밀번호</div>
              <input type="password" id="" readonly>
          </div>

          <div style="display: none" class="form-frame pwd-part-con">
              <div class="label-tag">비밀번호 확인</div>
              <input type="password" id="" name="memberPassword" readonly>
          </div>

          <div class="form-frame name-part">
              <div class="label-tag">이름</div>
              <input type="text" id="" name="memberName" value="<%= memberName %>"  readonly>
          </div>

          <div class="form-frame birth-part">
              <div class="label-tag">생년월일</div>
              <input type="text" id="" name="memberBirth" value="<%= memberBirth %>"  readonly>
          </div>

          <div class="form-frame tel-part">
              <div class="label-tag">핸드폰번호</div>
              <input type="text" id="" name="memberPhone" value="<%= memberPhone %>" >
          </div>

          <div class="form-frame email-part">
              <div class="label-tag">이메일</div>
              <input type="text" id="" class="first-email" name="memberEmail1"  value="<%= memberEmail1 %>" >
              <div class="at">
                  @
              </div>
              <input type="text" id="" class="second-email" placeholder="직접입력" name="memberEmail2_1" value="<%= memberEmail2 %>">
              <select name="" id="" name="memberEmail2_2" >
                  <option value="">선택안함</option>
                  <option value="">naver.com</option>
                  <option value="">daum.net</option>
                  <option value="">google.com</option>
              </select>
          </div>

          <div class="form-frame flex-part">
              <div class="gender-part" >
                  <div class="label-tag" for="">
                      성별
                  </div>
                  <div class="gender-box" >
                      <div class="mb">
                          <input type="text" name="memberGender" id="gender1" value="<%=memberGender %>" checked readonly>
                      </div>
                  </div>
              </div>
          </div>

          <div class="form-frame flex-part">
              <div class="age-part">
                  <div class="label-tag">
                      나이
                  </div>
                  
                  <div>
                      <input type="text" name="" id="age" name="memberAge" value="<%=memberAge %>" readonly>
                  </div>
              </div>
          </div>

          <div class="form-frame address-part">
              <div class="label-tag">
                  주소
              </div>
              <div>
                  <div class="mail-sort mail-gap">
                      <input type="text" id="sample3_postcode" placeholder="우편번호" name="zipCode" value="<%=zipCode %>"class="w1"  onblur="validateField(this)" onfocus="hideIdentify(this)" required>
                      <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"  class="w2">
                  </div>

                  <div class="mail-gap">
                      <input type="text" id="sample3_address" placeholder="주소" class="w3" name="memberAddress2" value="<%=address1 %>"  required>
                  </div>

                  <div class="mail-sort mail-gap">
                      <input type="text" id="sample3_detailAddress" placeholder="상세주소" class="w4" name="memberAddress3" value="<%=address2 %>"  required>
                      <input type="text" id="sample3_extraAddress" placeholder="참고항목" name="memberAddress3" class="w5" name="memberAddress4" value="<%=address3 %>" >
                  </div>
                  
                  <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                      <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                  </div>
              </div>
          </div>

          <div class="btn-frame">
              <button type="submit" onclick="submit()">등록</button>
              <button onclick="back()">취소</button>
            </div>
        </form>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>