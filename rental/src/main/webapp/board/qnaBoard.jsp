<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<div class="inner">
    <div id="board-main">
        <h1 class="board-title">
            예약 상담 및 문의
        </h1>
        
        <div class="board-search-box">
            <form action="" class="board-search">
                <select name="" id="">
                    <option value="">선택안함</option>
                    <option value="">제목</option>
                    <option value="">작성자</option>
                </select>

                <input type="text">

                <button type="submit">검색</button>
            </form>
        </div>
        
        <div class="board-list-box">
            <div class="board-top-btn-box">
                <button class="addwrite" href="<%=request.getContextPath()%>/board/qnaBoardWrite.jsp">글 등록</button>
            </div>
            <table class="board-box">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                        <th>작성자</th>
                        <th>조회</th>
                        <th class="admin-mode">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>1</th>
                        <th class="post-name">
                            <a href="">
                                제목
                            </a>
                        </th>
                        <th>2024-04-11</th>
                        <th>박천재</th>
                        <th>56</th>
                        <th>
                            <button class="admin-mode">답변</button>
                            <button class="admin-mode member-mode">삭제</button>
                        </th>
                    </tr>

                    <tr>
                        <th>2</th>
                        <th class="post-name">
                            <a href="">
                                제목
                            </a>
                        </th>
                        <th>2024-04-11</th>
                        <th>박천재</th>
                        <th>56</th>
                        <th>
                            <button class="admin-mode">답변</button>
                            <button class="admin-mode member-mode">삭제</button>
                        </th>
                    </tr>

                    <tr>
                        <th>3</th>
                        <th class="post-name">
                            <a href="">
                                제목
                            </a>
                        </th>
                        <th>2024-04-11</th>
                        <th>박천재</th>
                        <th>56</th>
                        <th>
                            <button class="admin-mode">답변</button>
                            <button class="admin-mode member-mode">삭제</button>
                        </th>
                    </tr>

                    <tr>
                        <th>4</th>
                        <th class="post-name">
                            <a href="">
                                제목
                            </a>
                        </th>
                        <th>2024-04-11</th>
                        <th>박천재</th>
                        <th>56</th>
                        <th>
                            <button class="admin-mode">답변</button>
                            <button class="admin-mode member-mode">삭제</button>
                        </th>
                    </tr>

                    <tr>
                        <th>5</th>
                        <th class="post-name">
                            <a href="">
                                제목
                            </a>
                        </th>
                        <th>2024-04-11</th>
                        <th>박천재</th>
                        <th>56</th>
                        <th>
                            <button class="admin-mode">답변</button>
                            <button class="admin-mode member-mode">삭제</button>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file ="../footer.jsp" %>