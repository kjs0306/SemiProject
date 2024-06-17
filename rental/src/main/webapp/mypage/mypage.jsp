<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>


<script>

   let currentRequst = null;

   $(document).ready(function() {

      $.ajax({
         url : "./myinfo.jsp",
         type : "GET",
         success : function(data) {
            $(".mypage-content").html(data);
         },
         error : function() {
            $(".mypage-content").html("Error loading page.");
         }
      });

      $(".myinfotabs li").click(function() {
         var tabId = $(this).attr("data-tab");
         var url = "";

         if (tabId === "myinfo") {
            url = "./myinfo.jsp";
         } else if (tabId === "change-myinfo") {
            url = "./changemyinfo.jsp";
         } else if (tabId === "mybook") {
            url = "./mybook.jsp";
         } else if (tabId === "changepwd") {
            url = "./changepwd.jsp";
         }

         $.ajax({
            url : url,
            type : "GET",
            success : function(data) {
               $(".mypage-content").html(data);
            },
            error : function() {
               $(".mypage-content").html("Error loading page.");
            }
         });
      });
   });
   
   
   $(document).ready(function() {
	    var tab = new URLSearchParams(window.location.search).get('tab');
	    if(tab) {
	        $(".myinfotabs li[data-tab='" + tab + "']").click();
	    }
	});
</script>
<div id="mypage-header-bar">
   <div class="mypage-content-box inner">
      <div class="mypage-side-menu">
         <div class="mypage-box top-line">
            <div class="mypage-info-box">
               <h1 class="mypage-title">마이페이지</h1>
               <ul class="myinfotabs">
                  <li class="tab-myselect myselect" data-tab="myinfo">내 정보</li>
                  <li class="tab-myselect" data-tab="change-myinfo">내 정보 변경</li>
                  <li class="tab-myselect" data-tab="mybook">내 예약 조회</li>
                  <li class="tab-myselect" data-tab="changepwd">비밀번호 변경</li>
               </ul>
            </div>
         </div>
      </div>

              <div class="mypage-view-box">
                 <div class="mypage-content">
                 	
                 </div>
              </div>
   </div>
</div>


<%@include file="../footer.jsp"%>