<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<div class="inner">
    <div id="board-main">
        <h1 class="board-title">
            이용후기
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

                <span class="review-point">
                    <span class="span-point y-point">
                        ★★★★★
                    </span>
                </span>
            </div>
            <form action="" class="board-form"> 

                <div class="form-frame board-info-box">
                    <textarea name="" id="" cols="30" rows="10" readonly></textarea>
                </div>

                <div class="btn-frame">
                    <button type="" >이용후기 목록</button>
                    <button type="" class="admin-mode member-mode">삭제</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file ="../footer.jsp" %>