<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.naver.dto.BoardVO"%>
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
  <script src="/resources/js/board.js" type="text/javascript"></script>
  
  <style>
  	.uploadedList {
  		list-style: none;
  	}
  	
  	.uploadedList li {
  		margin-top: 20px;
  	}
  	
  	.fileDrop {
  		width : 100%;
  		height : 200px;
  		border : 1px solid green;
  		background-color : lightgray;
  	}
  
  </style>
</head>
<body>
	<div class="container">
		<div class="row">
		<h2>게시글 수정</h2>
			<form method="post" class="form-horizontal">
				<input type="hidden" name="curPage" value="${curPage}">
				
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
			</form><!-- class = form-horizontal -->
			
			<div class="form-group">
				<label>추가할 파일을 드랍하세요.</label>
				<div class="fileDrop"></div>
			</div>
			
			<div class="form-group">
				<label>업로드한 파일 목록</label>
				<ul class="uploadedList clearfix">
					<%
						BoardVO vo = (BoardVO)request.getAttribute("vo");
						String[] arr = vo.getFilename();
						ObjectMapper mapper = new ObjectMapper();
						String filenames = mapper.writeValueAsString(arr);
						pageContext.setAttribute("filenames", filenames);
					%>
				</ul>
			
			</div>
			
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
			
			var arr = ${filenames};
			for(var i=0;i<arr.length;i++) {
				var filename = arr[i];
				iconAppend(filename, true);
			}
			
			$(".fileDrop").on("dragenter dragover", function(event){
				event.preventDefault();
			});
			
			$(".fileDrop").on("drop", function(event){
				event.preventDefault();
				
				var arr = event.originalEvent.dataTransfer.files;
				var file = arr[0];
				
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type: 'post',
					url: '/uploadajax',
					data : formData,
					processData : false,
					contentType : false,
					success : function(data) {
						iconAppend(data, true);
						
					}
				});
			});
			
			$(".uploadedList").on("click", ".delbtn", function(event){
				event.preventDefault();
				
				var that = $(this);
				var filename = that.attr("href");
				
				var go = confirm("경고 : 수정 버튼과 상관없이 파일이 삭제됩니다.\n삭제하시겠습니까?");
				
				if(go) {
					$.ajax({
						type : 'post',
						url : '/board/deletefile/${vo.bno}',
						data : {
							filename : filename
						},
						dataType : 'text',
						success : function(data) {
							that.parent("div").parent("li").remove();
						}
					});
				}
				
			});
			
			
			$(".uploadedList").on()
			
			
			$(".btn-primary").click(function(){
				$("form").attr("action", "/board/update")
				
				var msg = "";
				
				$(".delbtn").each(function(index){
					var filename = $(this).attr("href");
					msg += "<input name='filename["+index+"]' value='"+filename+"' type='hidden'>"
				});
				
				$("form").append(msg);
				
				$("form").submit();
			});
			
			$(".btn-warning").click(function(){
				$("form").attr("method", "get");
				$("form").attr("action", "/board/read/${vo.bno}");
				$("form").submit();
			});
			
			
			
			
		});
	</script>


</body>
</html>