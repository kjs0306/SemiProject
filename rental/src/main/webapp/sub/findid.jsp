<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script>
function btn(){
   let findId = {
       "name" : document.frm.name.value,
       "email" : document.frm.email.value,
    };

    $.ajax({
       url : "findid.member",
       type : "post",
       data : findId,
       cache : false,   
       async : false,
       success : function(data) {
         let id = data.id;
          if(id != null){
           $("#myid").empty();
           $("#login").empty();
         document.getElementById("myid").innerHTML = "<input type='text' value= '아이디: "+id+"'>";
         document.getElementById("login").innerHTML = "<button type='button' onclick='btn2()'>로그인 하기</button>";
          }else{
           $("#myid").empty();
           $("#login").empty();
           alert("회원정보를 찾을 수 없습니다.");
           location.href="findid.jsp";
          }
       },
       error : function() {
          alert('error');
       }
    });
}
function btn2(){
   location.href="loginhome.jsp";
}
</script>
<div id="find-id">
    <div class="find-box">
        <h2 class="find-title">렌트어때 아이디 찾기</h2>
        <form name="frm" class="find-form">
            <div class="form-group name-part">
                <div>
                    <input type="text" name="name" placeholder="이름 입력" required>
                </div>
            </div>

            <div class="form-group email-part">

                <div class="email-box">
                    <input type="text" name="email" placeholder="이메일 입력" required>
                </div>
            </div>

            <div class="form-group">
                <button type="button" onclick="btn()">찾기</button>
            </div>
              <div class="myid" id="myid">
        
           </div><br>
           <div class="form-group" id="login">
           
           </div>
           </form>
    </div>
</div>
<%@include file ="../footer.jsp" %>
