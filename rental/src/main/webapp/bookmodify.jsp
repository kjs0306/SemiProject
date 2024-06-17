<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="adm-box">
    <div class="dash-title-box">
        <h2>예약 정보</h2>
    </div>

    <div class="adm-form-box">
        <h4 class="adm-form-title">예약 정보 수정</h4>
        <form action="" class="adm-form">
            <div class="form-frame">
                <div class="label-tag">예약 번호</div>
                <input type="text" id="" readonly>
            </div>

            <div class="form-frame">
                <div class="label-tag">예약자 성함</div>
                <input type="text" id="">
            </div>

            <div class="form-frame">
                <div class="label-tag">차량 이름</div>
                <input type="text" id="" readonly>
            </div>

            <div class="form-frame">
                <div class="label-tag">예약한 날짜</div>
                <input type="date" id="" readonly>
            </div>

            <div class="form-frame">
                <div class="label-tag">대여 시작 날짜</div>
                <input type="date" id="">
            </div>

            <div class="form-frame">
                <div class="label-tag">대여 반납 날짜</div>
                <input type="date" id="">
            </div>

            <div class="btn-frame">
                <button type="submit">등록</button>
                <button onclick="back()">취소</button>
            </div>
        </form>
    </div>
</div>