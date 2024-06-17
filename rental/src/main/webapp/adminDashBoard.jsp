<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./dashHead.jsp"%>

<script>
	let currentRequest = null;

	function loadData() {
		// 이전 요청이 있다면 취소
		if (currentRequest) {
			currentRequest.abort();
		}
	}

	function loadCheck() {
		currentRequest = new XMLHttpRequest();
		currentRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
			}
			currentRequest = null;
		};
	}

	$(document).ready(function() {

		$.ajax({
			url : "dashBoardInclude/membermng.jsp",
			type : "GET",
			success : function(data) {
				$("#content").html(data);
			},
			error : function() {
				$("#content").html("Error loading page.");
			}
		});

		$(".tab-link").click(function() {
			var tabId = $(this).attr("data-tab");
			var url = "";

			if (tabId === "tab-1") {
				url = "dashBoardInclude/membermng.jsp";
			} else if (tabId === "tab-2") {
				url = "dashBoardInclude/bookmng.jsp";
			} else if (tabId === "tab-3") {
				url = "dashBoardInclude/carmng.jsp";
			} else if (tabId === "tab-4") {
				url = "dashBoardInclude/announceboardmng.jsp";
			} else if (tabId === "tab-5") {
				url = "dashBoardInclude/eventboardmng.jsp";
			} else if (tabId === "tab-6") {
				url = "dashBoardInclude/reviewboardmng.jsp";
			} else if (tabId === "tab-7") {
				url = "dashBoardInclude/qnaboardmng.jsp";
			}

			$.ajax({
				url : url,
				type : "GET",
				success : function(data) {
					$("#content").html(data);
				},
				error : function() {
					$("#content").html("Error loading page.");
				}
			});
		});
	});
</script>

<div id="content" style="padding: 50px;"></div>

<%@include file="./dashFooter.jsp"%>