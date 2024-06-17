<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<div class="inner">
    <div id="board-main">
        <h1 class="board-title">
            예약 상담 및 문의
        </h1>

        <div class="board-read-box">
            <div class="board-top-info-box">
                <span class="writer"> 
                    <span class="span-point">
                        작성자
                    </span>
                    <span>
                        렌트어때
                    </span>
                </span>
                <span class="write-date">
                    <span class="span-point">
                        등록일
                    </span>
                    <span>
                        2024-04-15
                    </span>
                </span>
            </div>
            <form action="" class="board-form"> 
                <div class="form-frame board-title-box">
                    <input type="text" id="" name="" readonly>
                </div>

                <div class="form-frame board-info-box">
                    <textarea name="" id="" cols="30" rows="20" readonly></textarea>
                </div>

                <div class="btn-frame">
                    <button type="">글 목록</button>
                    <button type="" class="admin-mode">답변하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file ="../footer.jsp" %>