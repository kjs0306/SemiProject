<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<div class="inner">
    <div id="board-main">
    <div class="board-inner">
        <h1 class="board-title">
            이벤트
        </h1>

        <h4 class="board-top-title">이벤트 게시글 쓰기</h4>
        <div class="board-write-box">
            <form action="" class="board-form"> 
                <div class="form-frame board-title-box">
                    <div class="label-tag board-title-text">글 제목</div>
                    <input type="text" id="" name="" placeholder="제목 입력">
                </div>

                <div class="form-frame board-info-box">
                    <div class="label-tag board-info-text">글 내용</div>
                    <textarea name="" id="" cols="30" rows="30" placeholder="내용 입력"></textarea>
                </div>

                <div class="form-frame img-frame">
                    <div class="label-tag">썸네일 수정</div>
                    <input type="file" id="" name="" onchange="readURL(this);">
                    <div>
                        <img id="preview">
                    </div>
                </div>

                <div class="btn-frame">
                    <button type="submit">수정</button>
                    <button onclick="back()">취소</button>
                </div>
            </form>
        </div>
        </div>
    </div>
</div>
<%@include file ="../footer.jsp" %>