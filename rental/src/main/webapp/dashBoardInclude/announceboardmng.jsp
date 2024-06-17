<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<div class="top-content">
	<div class="dash-title-box">
		<h2>공지사항 게시판 관리</h2>
	</div>
	<div class="dash-info-box">
		<h4>게시글 조회</h4>
	</div>
	<form id="searchForm" action="" method="post">
		<div class="search-con-box form-con-box">
			<div class="form-title">검색 조건</div>
			<div class="search-box-1">
				<select name="ntcSearch" id="member-search">
					<option value="none">선택안함</option>
					<option value="noticenum">글번호</option>
					<option value="noticetitle">글제목</option>
					<option value="noticename">작성자</option>
				</select> <input type="text" name="searchValue" id="search-input">
			</div>
		</div>
		<div class="button-box">
			<button class="search-notice-btn" type="button" onclick="NtcList()">검색</button>
			<button class="reset-btn" type="reset">초기화</button>
		</div>
	</form>
</div>
<script>
	function NtcList() {

		let sendData = {
			ntcSearch : $('#member-search').val(),
			searchValue : $('#search-input').val()
		};

		$.ajax({
			url : "ntcList.no",
			type : "post",
			data : sendData,
			cache : false,
			dataType : 'json',
			success : function(data) {
				let articleList = data.articleList;
				$("#tb_1 tbody").empty();
				$.each(articleList, function(idx, obj) {
					let str = "<tr>";
					str += "<td>" + obj.NOTICENUM + "</td>";
					str += "<td>" + obj.NOTICETITLE + "</td>";
					str += "<td>" + obj.NOTICENAME + "</td>";
					str += "<td>" + obj.NOTICEVIEWS + "</td>";
					str += "<td>" + obj.NOTICEDATE + "</td>";
					str += "<td>";
					str += "<button onclick='ntcDetail(" + obj.NOTICENUM
							+ ")'>보기</button> ";
					str += "<button onclick='ntcModify("+obj.NOTICENUM+")'>수정</button> ";
					str += "<button onclick='ntcDelete(" + obj.NOTICENUM
							+ ")'>삭제</button>";
					str += "</td>";
					str += "</tr>";
					$("#tb_1 tbody").append(str);
				});
				
			},
			error : function(err) {
				alert('Error');
			}
		});
	}


 	function ntcDetail(num) {
		$.ajax({
			type : 'post',
			url : "ntcView.no",
			data : {
				"NOTICENUM" : num,
				"view" : "ok"
			},
			cache : false,
			success : function(response) {
				$("#content").html(response);
			},
			error : function(xhr, status, error) {
				console.error('요청이 실패했습니다.');
			}
		});
	}

 	function ntcModify(num) {
        $.ajax({
            type: 'post',
            url: "ntcView.no", 
            data: { "NOTICENUM": num },
            cache: false,
            success: function(response) {
                $("#content").html(response); 
            },
            error: function(xhr, status, error) {
                console.error('요청이 실패했습니다.', error);
            }
        });
    }
 	
	function ntcDelete(num) {
		var result = confirm("확인을 누르면 계속 진행됩니다. 취소를 누르면 취소됩니다.");
		if(result){
			$.ajax({
				type : 'post',
				url : "ntcDelete.no",
				data : {
					"NOTICENUM" : num
				},
				cache : false,
				success : function(response) {
					NtcList();
				},
				error : function(xhr, status, error) {
					console.error('요청이 실패했습니다.');
				}
			});
		} else {
			alert("사용자가 취소를 클릭했습니다.");
		}
		
	}


	function ntcWrite() {
	    $.ajax({
	        type: "get",
	        url: "ntcWriteForm.no",
	        cache: false,
	        async: false,
	        success: function(data) {
	            $('#content').html(data);
	        },
	        
	        error: function(xhr, status, error) {
	            alert("오류 발생 : " + error);
	        }
	        
	    });
	}
	
	 
$(function(){
	NtcList();
})
	
</script>
<div class="bottom-content">
	<div class="table-top">
		<h4 class="table-title">공지사항 게시글 리스트</h4>
		<button type="button" onclick="ntcWrite()">+ 글 등록</button>
	</div>
	<div class="content-list">
		<table id="tb_1">
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
				<!-- AJAX를 통해 동적으로 콘텐츠 추가 -->
			</tbody>
		</table>
	</div>
</div>
