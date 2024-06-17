<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="board-box">
   <div class="dash-title-box">
       <h2>공지사항 게시판 관리</h2>
   </div>

   <h4 class="board-top-title">공지사항 게시글 수정</h4>
   <div class="board-form-box">
       <form action="" class="board-form">
           <div class="form-frame board-title-box">
               <div class="label-tag board-title-text">글 제목</div>
               <input type="text" id="" name="" placeholder="제목 입력">
           </div>

           <div class="form-frame board-info-box">
               <div class="label-tag board-info-text">글 내용</div>
               <textarea name="" id="" cols="30" rows="20"></textarea>
           </div>

           <div class="form-frame img-frame">
               <div class="label-tag">이미지 등록</div>
               <input type="file" id="" name="" onchange="readURL(this);">
               <img id="preview">
           </div>

           <div class="btn-frame">
               <button type="submit">수정</button>
               <button onclick="back()">취소</button>
            </div>
        </form>
    </div>
</div>