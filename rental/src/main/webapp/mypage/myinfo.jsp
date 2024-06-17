<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 String memberId = (String) session.getAttribute("memberId");
%>
<script>

	var info ={ "MemberId"  : "<%=memberId %>"};
function getMyinfo() {
	
	$.ajax({
        url: "MemberGetMyinfoAction.member",
        type: "GET",
        data: info,
        success: function(data) {
        	 $('#MemberNo').val(data.member.MemberNo); 
        	 $('#MemberId').val(data.member.MemberId); 
        	 $('#MemberName').val(data.member.MemberName); 
        	 $('#MemberBirth').val(data.member.MemberBirth); 
        	 $('#MemberPhone').val(data.member.MemberPhone); 
        	 $('#MemberEmail').val(data.member.MemberEmail); 
        	 $('input[name="MemberGender"]').val(data.member.MemberGender); 
        	 $('input[name="MemberAge"]').val(data.member.MemberAge); 
        	 $('#MemberAdress').val(data.member.MemberAddress); 
        	
        },
        error: function() {

        alert("cannot load your data. Wait for a second and retry.")
        }
    });
};

(function(){
	getMyinfo();
				
})();




function MemberDelete(event){
    event.preventDefault();
    if(window.confirm('정말 탈퇴 하시겠습니까?')){
        alert('탈퇴가 성공 했습니다.');
        window.location.href = "MemberOutAction.member";
    } else {
        alert('탈퇴를 취소하셨습니다.');
    }
}
</script>   
<div id="myinfo" class="my-content myselect">
    <h1 class="mypage-tabmenu">내 정보</h1>
    <div class="myinfo-content-box">
        <form action="" class="adm-form member-modify">
            <div class="form-frame number-part">
                <div class="label-tag">회원 번호</div>
                <input type="text" id="MemberNo" readonly>
            </div>

            <div class="form-frame id-part">
                <div class="label-tag">아이디</div>
                <input type="text" id="MemberId" readonly>
            </div>

            <div class="form-frame name-part">
                <div class="label-tag">이름</div>
                <input type="text" id="MemberName" readonly>
            </div>

            <div class="form-frame birth-part">
                <div class="label-tag">생년월일</div>
                <input type="text" id="MemberBirth" readonly>
            </div>

            <div class="form-frame tel-part">
                <div class="label-tag">핸드폰번호</div>
                <input type="text" id="MemberPhone" readonly>
            </div>

            <div class="form-frame email-part">
                <div class="label-tag">이메일</div>
                <input type="text" id="MemberEmail" class="first-email" readonly>
            </div>

            <div class="form-frame flex-part">
                <div class="gender-part" >
                    <div class="label-tag" for="">
                        성별
                    </div>
                    <div class="gender-box">
                        <input type="text" name="MemberGender" id="gender1" value="" checked readonly>
                    </div>
                </div>
            </div>

            <div class="form-frame flex-part">
                <div class="age-part">
                    <div class="label-tag">
                        나이
                    </div>
                    
                    <div>
                        <input type="text" name="MemberAge" id="age" readonly>
                    </div>
                </div>
            </div>

            <div class="form-frame address-part">
                <div class="label-tag">
                    주소
                </div>
                <div>
                    <input type="text" id="MemberAdress" class="w1"  required>
                </div>   
            </div>
        </form>
    </div>
    <a href="#" class="account-delete" onclick="MemberDelete(event)">회원 탈퇴 ></a>
<!--     <a href="MemberOutAction.member" class="account-delete"> 회원 탈퇴 ></a> -->
</div>