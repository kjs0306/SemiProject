<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>

$(function(){
   $("#btn").hide();
});

function check(){
   var chk= document.frm.repassword.value.trim();
    var chk_2=document.frm.repasswordchk.value.trim();
   var cnt = chk.length;
   
   if(chk == ""){
      $("#check").empty();
        $("#btn").hide();
        $("#check").append("비밀번호를 입력해 주세요.");
   }else if(cnt < 10){
      $("#check").empty();
        $("#btn").hide();
        $("#check").append("비밀번호를 10~20자 이내로 입력해주세요");
      
   }else if(cnt >= 10){
      $("#check").empty();
        $("#btn").hide();
        $("#check").append("사용 가능한 비밀번호 입니다.");
      if(chk == chk_2){
      $("#check").empty();
      $("#recheck").empty();
        $("#btn").show();
        $("#check").append("사용 가능한 비밀번호 입니다.");
        $("#recheck").append("비밀번호가 일치합니다.");
      }
        if(chk != chk_2){
      $("#check").empty();
      $("#recheck").empty();
        $("#btn").hide();
        $("#check").append("사용 가능한 비밀번호 입니다.");
        $("#recheck").append("비밀번호가 일치하지 않습니다.");
        }
   }
}

function recheck(){
   
   var chk_3=document.frm.repassword.value.trim();
    var chk_4=document.frm.repasswordchk.value.trim();
    var cnt_2 = chk_3.length;
    var cnt_3 = chk_4.length;

   if(chk_4 == ""){
    $("#recheck").empty();
    $("#btn").hide();
   $("#recheck").append("비밀번호를 입력해 주세요");
   }
   
   else if(chk_3 == chk_4){
    $("#recheck").empty();
    $("#btn").hide();
   $("#recheck").append("비밀번호가 일치합니다.");
         if(cnt_2 >= 10 && cnt_3 >= 10){
         $("#recheck").empty();
       $("#btn").show();
      $("#recheck").append("비밀번호가 일치합니다.");
      }   
   }else if(chk_3 != chk_4){
    $("#recheck").empty();
    $("#btn").hide();
   $("#recheck").append("비밀번호가 일치하지 않습니다.");
   }
}

</script>
<div id="changepwd" class="my-content">
    <h1 class="mypage-tabmenu">비밀번호 변경</h1>
    <div class="change-content-box">
        <form  name="frm" action="repassword.member" method="post" class="adm-form changepwd">
            <div class="form-frame now-pwd">
                <input type="password" name="password" id="password" placeholder="현재 비밀번호" required>
            </div>

            <div class="form-frame now-pwd">
                <input type="password" name="repassword" id="repassword" onchange="check()" minlength="10" maxlength="20" required placeholder="변경 할 비밀번호">
            </div>

            <div class="form-frame now-pwd">
                <input type="password" name="repasswordchk" id="repasswordchk" onchange="recheck()" minlength="10" maxlength="20" required placeholder="변경 할 비밀번호 확인">
            </div>

            <div class="form-frame now-pwd">
                <button type="submit">비밀번호 변경 확인</button>
            </div>
        </form>
    </div>
</div>
<script>
$("form.changepwd").submit(function(e) {
   const pass = $('#repassword').val();
   const passConfirm = $('#repasswordchk').val();
   
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