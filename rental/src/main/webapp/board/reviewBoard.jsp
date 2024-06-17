<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../header.jsp" %>
<div class="inner">
    <div id="board-main">
        <h1 class="board-title">
            이용 후기
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
                <button class="admin-mode addwrite" href="<%=request.getContextPath()%>/board/reviewBoardWrite.jsp">글 등록</button>
            </div>
            <table class="board-box">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>내용</th>
                        <th>등록일</th>
                        <th>작성자</th>
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
                        <th>렌트어때</th>
                        <th>
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
                        <th>렌트어때</th>
                        <th>
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
                        <th>렌트어때</th>
                        <th>
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
                        <th>렌트어때</th>
                        <th>
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
                        <th>렌트어때</th>
                        <th>
                            <button class="admin-mode member-mode">삭제</button>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file ="../footer.jsp" %>