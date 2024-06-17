<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<script>

let resultData; // 받아온 데이터

function checkMember(){
	
	let search = {
			"memberId" : document.frm.memberId.value,
			"memberEmail":document.frm.memberEmail.value
	};
	
	$.ajax({
		url : "../FindMemberAction.member",
		type : "post",
		data : search,
		cache : false,	
		async : false,
		success : function(data) {
			resultData = data;
			let result = data.result;
			if(result){
				showElement();
			}else{
				alert("회원정보를 찾을 수 없습니다.");
				location.href="findpwd.jsp";
			}

			
		},
		error : function() {
			alert('error');
		}
	});
	
}

    function showElement() {
        document.getElementById('resetPass').removeAttribute('style'); // or 'inline', 'inline-block', etc.
    }
 
    function resetPass(){
    	
    	let search = {
    			"memberId" : resultData.memberId,
    			"memberEmail":resultData.memberEmail,
    			"memberPassword":document.frm2.member_confirm_password.value
    	};
    	
    	console.log("resetPass search",search); 
    	
    	$.ajax({
    		url : "../MemberResetPassAction.member",
    		type : "post",
    		data : search,
    		cache : false,	
    		async : false,
    		success : function(data) {
    			console.log("resetPass data", data);
				if(data.result == true){ 
					alert("비밀번호 변경에 성공했습니다.")
					location.href="loginhome.jsp";
				}else{
					alert("비밀번호 변경에 실패했습니다.")
					location.href="findpwd.jsp";
				}
				
    			
    		},
    		error : function() {
    			alert('error');
    		}
    	});
    	
    }
    
</script>

<div id="find-pwd">
    <div class="find-box">
        <h2 class="find-title">렌트어때 비밀번호 찾기</h2>
        <form name="frm" class="find-form">
            <div class="form-group id-part">
                <div>
                    <input type="text" name="memberId" id="memberId" placeholder="아이디 입력" required>
                </div>
            </div>

            <div class="form-group email-part">

                <div class="email-box">
                    <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일 입력" required>
                </div>
            </div>

            <div class="form-group">
                <button type="button" onclick="checkMember()">확인</button>
            </div>
        </form>

        <form name="frm2" id="resetPass" action="../MemberResetPassAction.member" class="mypwd-form" style="display: none;">
            <div class="mypwd vispwd">
                <div class="form-group pwd-part">   
                    <div>
                        <input type="password" name="memberPassword" id="memberPassword" placeholder="변경할 비밀번호 입력" required>
                    </div>
                </div>
        
                <div class="form-group pwd-part">
                    <div>
                        <input type="password" name="member_confirm_password" id="member_confirm_password" placeholder="비밀번호 확인" required>
                    </div>
                </div>
        
                <div class="form-group">
                    <button type="button" id="submit_button" style="display: none;" onclick="resetPass()">비밀번호 변경하기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%@include file ="../footer.jsp" %>