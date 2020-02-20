<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>글 자세히 보기</h1>
			
			<div class="form-group">
				<label for="title">제목</label>
				<input class="form-control" id="title" readonly value="${vo.title}">
			</div>
			
			<div class="form-group">
				<label for="writer">작성자</label>
				<input class="form-control" id="writer" readonly value="${vo.writer}">
			</div>
			
			<div class="form-group">
				<label for="content">내용</label>
				<textarea name="content" id="content"rows="5" class="form-control" readonly>${vo.content}</textarea>
			</div>
			
		</div><!-- class = row -->
		
		<div class="row">
			<form>
				<input type="hidden" name="bno" value="${vo.bno}">
				<input type="hidden" name="curPage" value="${curPage}">
			</form>
			<div class="form-group">
				<button id="reply_form" class="btn btn-info">댓글</button>
				<button class="btn btn-success">수정</button>
				<button class="btn btn-danger">삭제</button>
				<button class="btn btn-primary">목록</button>
			</div>
		</div><!-- class=row -->
		
		<div class="row">
			<div id="myCollapsible" class="collapse">
				<div class="form-group">
					<label for="replyer">작성자</label>
					<input id="replyer" name="replyer" class="form-control">
				</div>
				<div class="form-group">
					<label for="replytext">내용</label>
					<input id="replytext" name="replytext" class="form-control">
				</div>
				
				<div class="form-group">
					<button id="insertReply" class="btn btn-warning">댓글 등록</button>
					<button class="btn btn-default">댓글 취소</button>
				</div>
			</div>
		</div><!-- class=row -->
		
	</div><!-- class = container -->
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#insertReply").click(function(){
				var replyer = $("#replyer").val();
				var replytext = $("#replytext").val();
				var bno = ${vo.bno};
				$.ajax({
					type : 'post',
					url : '/replies',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTPS-Method-Override' : 'POST'
					},
					data : JSON.stringify({
						replyer : replyer,
						replytext : replytext,
						bno : bno
					}),
					dataType : 'text',
					success : function(result){
						alert("insert success");
						$("#replyer").val('');
						$("#replytext").val('');
					}
				});
			});
			
			$("#reply_form").click(function(){
				$("#myCollapsible").collapse("toggle");
			});
			
			$(".btn-primary").click(function(){
				location.assign("/board/listpage?curPage=${curPage}");
			});
			
			$(".btn-success").click(function(){
				$("form").attr("method", "get");
				$("form").attr("action", "/board/update");
				$("form").submit();
			});
		});
	</script>

</body>
</html>