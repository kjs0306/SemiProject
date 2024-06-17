<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<div class="inner">
    <div id="board-main">
        <h1 class="board-title">
            예약 상담 및 문의
        </h1>

        <h4 class="board-top-title">예약 상담 및 문의 게시글 쓰기</h4>
        <div class="board-write-box">
            <form action="" class="board-form"> 
                <div class="form-frame board-title-box">
                    <div class="label-tag board-title-text">글 제목</div>
                    <input type="text" id="" name="" placeholder="제목 입력">
                </div>

                <div class="form-frame board-info-box">
                    <div class="label-tag board-info-text">글 내용</div>
                    <textarea name="" id="" cols="30" rows="20"></textarea>
                </div>

                <div class="btn-frame">
                    <button type="submit">수정</button>
                    <button onclick="back()">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file ="../footer.jsp" %>