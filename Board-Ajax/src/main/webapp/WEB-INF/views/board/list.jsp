<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- jsp:include는  -->
<jsp:include page="/WEB-INF/views/common/common_include.jsp"/>
<html>
<head>
	<title>Home</title>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('#register').on('click',function(){
			location.href="/board/register";
		})
		
		/* var no = $('#no').val();
		$('#getPost').on('click',function(){
			location.href="/board"+no;
		}) */
		
	})
	</script>
</head>




<body class="sb-nav-fixed">
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">Board</h1>

		<div class="card mb-4">
			<div class="card-header">
				<button type="button" class="fas fa-edit" id="register">글작성</button>
			</div>
			<div class="card-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
								
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${board.no }</td>
						<!-- a 태그로 전달하면 무조건 GET 방식으로 전송 -->
						<%-- <td><a href="/board?no=${board.no}">${board.title }</a></td> --%>
						<td><a href="/board/${board.no}">${board.title }</a></td>
						<td>${board.writer }</td>
						<td>${board.date }</td>
						<td>${board.readCount }</td>
					</tr>
					
				</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</main>
</body>
</html>
