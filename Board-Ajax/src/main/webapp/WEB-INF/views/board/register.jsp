<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/common/common_include.jsp"/>
<head>


<script type="text/javascript">




$(document).ready(function(){
	
	
	$('#btn_list').on('click',function(){
	
		 location.href="/board"; 
		/* $(location).attr('href','board/') */
		
	});

	
	
	$('#btn_register').on('click',function(){
		
		
		console.log("등록 버튼 클릭");
		registerPost();
	});

	
	

	
	function registerPost(){
			
				var title = $("input[name='title']").val();
				var content = $('#content').val();
				var writer = $('#writer').val();

		
		
			
			$.ajax({
				type:'post', //타입
				url : '/board/register', //요청할 서버 url
				async : true, 
				dataType : 'JSON',
				contentType:"application/json",
				data : JSON.stringify({
					"title" :title,
					"content" : content,
					"writer" : writer
					/* "imageFile" : imageFile */
				}),
				success : function(){
					alert("게시글이 등록되었습니다.")
					location.href="/board"
				},
				error : function(){
					alert("게시글 등록에 실패하였습니다.")
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
				<form >
					<div class="mb-3 mt-3">
						<label for="title" class="form-label">title</label> 
						<input type="text" class="form-control" id="title" name="title">
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">content</label>
						<textarea class="form-control" id="content" name="content"></textarea>
					</div>
					<div class="mb-3">
						<label for="writer" class="form-label">writer</label> 
						<input type="text" class="form-control" id="writer" name="writer">
					</div>
				</form>
				
				<button id="btn_list" type="button" class="btn btn-outline-primary">돌아가기</button>
				<button id="btn_register" type="button" class="btn btn-outline-primary">글 등록</button>	
				
							
				
				
			</div>
		</div>
	</div>
	</main>
</body>

</html>