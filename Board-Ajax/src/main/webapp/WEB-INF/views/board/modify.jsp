<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/common/common_include.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">




$(document).ready(function(){
	
	const no = $("#no").val();
	
	
	$('#btn_list').on('click',function(){
	
		 location.href="/board"; 
		/* $(location).attr('href','board/') */
		
	});

	
	
	$('#btn_delete').on('click',function(){
		
		
		console.log("삭제버튼 클릭");
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			deletePost(no);	
		}
		
	});

	

	
	function deletePost(no){
			
			
			$.ajax({
				type:'delete', //타입
				url : '/board/'+no, //요청할 서버 url
				async : true, 
				dataType : 'JSON',
				contentType:"application/json",
				data : JSON.stringify({
					"no" :no
				}),
				success : function(){
					alert("게시글이 삭제되었습니다.")
					location.href="/board"
				},
				error : function(){
					alert("게시글 삭제에 실패했습니다.")
				}
				
			});
			
		};
});
	
</script>
</head>
<body class="sb-nav-fixed">
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">Board</h1>
		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="mb-3 mt-3">
						<label for="no" class="form-label">게시글 번호</label> <input type="text"
							class="form-control" id="no" name="no" value="${board.no}" disabled>
					</div>
					<div class="mb-3">
						<label for="title" class="form-label">title</label> <input
							type="text" class="form-control" id="title" name="title"
							value="${board.title}" disabled>
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">content</label>
						<textarea class="form-control" id="content" name="content"
							disabled>${board.content}</textarea>
					</div>
					<%-- <div class="mb-3">
						<label for="Date" class="form-label">Date</label> <input
							type="text" class="form-control" id="Date" name="Date"
							value="${board.Date}" disabled>
					</div> --%>
					<div class="mb-3">
						<label for="writer" class="form-label">writer</label> <input
							type="text" class="form-control" id="writer" name="writer"
							value="${board.writer}" disabled>
					</div>
				</form>
				<button id="btn_list" type="button" class="btn btn-outline-primary">돌아가기</button>
				<button id="btn_register" type="button" class="btn btn-outline-primary">글 수정</button>	
				<button id="btn_delete" type="button" class="btn btn-outline-primary">글 삭제</button>
			</div>
		</div>
	</div>
	</main>
	
</body>
</html>