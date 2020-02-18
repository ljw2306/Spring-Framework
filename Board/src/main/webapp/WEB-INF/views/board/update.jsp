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
			<form method="post" class="form-horizontal">
				<div class="form-group">
					<label class="col-xs-2 control-label" for="bno">글 번호</label>
					<div class="col-xs-10">
						<input readonly class="form-control" id="bno" name="bno" value="${vo.bno}">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="writer">작성자</label>
					<div class="col-xs-10">
						<input class="form-control" id="writer" name="writer" value="${vo.writer}">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="title">제목</label>
					<div class="col-xs-10">
						<input class="form-control" id="title" name="title" value="${vo.title}">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="content">내용</label>
					<div class="col-xs-10">
						<textarea class="form-control" id="content" name="content">${vo.content}</textarea>
					</div>
				</div>
			</form>
			<div class="form-group">
				<div class="col-xs-offset-2 col-xs-10">
					<button class="btn btn-primary">수정</button>
					<button class="btn btn-warning">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".btn-primary").click(function(){
				$("form").attr("action", "/board/update")
				$("form").submit();
			});
			
			$(".btn-warning").click(function(){
				$("form").attr("method", "get");
				$("form").attr("action", "/board/read");
				$("form").submit();
			});
		});
	</script>


</body>
</html>