<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="top-content">
    <div class="dash-title-box">
        <h2>공지사항 게시판 관리</h2>
    </div>
    <div class="dash-info-box">
        <h4>게시글 조회</h4>
    </div>
    <form action="">
        <div class="search-con-box form-con-box">
            <div class="form-title">검색 조건</div>
            <div class="search-box-1">
                <label for="member-search"></label>
                <select name="" id="member-search">
                    <option value="none">선택안함</option>
                    <option value="">글번호</option>
                    <option value="">글제목</option>
                    <option value="">작성자</option>
                </select>
                <input type="text">
            </div>
        </div>
            
        <div class="button-box">
            <button class="search-btn" type="submit">검색</button>
            <button class="reset-btn" type="reset" >초기화</button>
        </div>
    </form>
</div>

<div class="bottom-content">
    <div class="table-top">
        <h4 class="table-title">공지사항 게시글 리스트</h4>
        <button type="button"> + 글 등록</button>
    </div>
    <div class="content-list">
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일자</th>
                    <th>게시글 관리</th>
                </tr>
                
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>굉장히 중요한 소식을 알려드리겠습니다.</td>
                    <td>렌트어때</td>
                    <td>2351</td>
                    <td>2024-03-20</td>
                    <td>
                        <button>보기</button>
                        <button>수정</button>
                        <button>삭제</button>
                    </td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>굉장히 중요한 소식을 알려드리겠습니다.</td>
                    <td>렌트어때</td>
                    <td>2351</td>
                    <td>2024-03-20</td>
                    <td>
                        <button>보기</button>
                        <button>수정</button>
                        <button>삭제</button>
                    </td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>굉장히 중요한 소식을 알려드리겠습니다.</td>
                    <td>렌트어때</td>
                    <td>2351</td>
                    <td>2024-03-20</td>
                    <td>
                        <button>보기</button>
                        <button>수정</button>
                        <button>삭제</button>
                    </td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>굉장히 중요한 소식을 알려드리겠습니다.</td>
                    <td>렌트어때</td>
                    <td>2351</td>
                    <td>2024-03-20</td>
                    <td>
                        <button>보기</button>
                        <button>수정</button>
                        <button>삭제</button>
                    </td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>굉장히 중요한 소식을 알려드리겠습니다.</td>
                    <td>렌트어때</td>
                    <td>2351</td>
                    <td>2024-03-20</td>
                    <td>
                        <button>보기</button>
                        <button>수정</button>
                        <button>삭제</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>