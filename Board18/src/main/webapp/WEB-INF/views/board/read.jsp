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
		</div><!-- class = row -->
		
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
		</div><!-- class = row -->
		
		<div class="row">
			<div id="replies">
								
				<!-- <div class="panel panel-info">
					<div class="panel-heading">
						<span>rno: 1, 작성자: 홍길동</span>
						<span class="pull-right">2020-02-21 09:23</span>
					</div>
					<div data-rno="3" class="panel-body">
						<p>댓글 내용이 들어갑니다.</p>
						<button class="btn btn-link btn-update">수정</button>
						<button class="btn btn-link btn-delete">삭제</button>
					</div>
				</div> -->
			</div><!-- id = replies -->
		</div><!-- class = row -->
		
	</div><!-- class = container -->
	
	<div class="row">
		<div id = "myModal" class="modal">
			<div class="modal-dialog">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<p id="modal_rno"></p>
				</div>
				
				<div class="modal-body">
					<input class="form-control" id="modal_replytext">
				</div>
				
				<div class="modal-footer">
					<button data-dismiss="modal" id="modal_update" class="btn btn-warning btn-xs">수정</button>
					<button data-dismiss="modal" id="modal_close" class="btn btn-warning btn-xs">취소</button>
				</div>
			</div>
		</div>
	</div><!-- class = row -->
	
	<script type="text/javascript">
		var bno = ${vo.bno};
		
		$(document).ready(function(){
			$("#modal_update").click(function(){
				var rno = $("#modal_rno").text();
				var replytext = $("#modal_replytext").val();
				
				$.ajax({
					type : 'put',
					url : '/replies/',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'PUT'
					},
					data : JSON.stringify({
						rno : rno,
						replytext : replytext
					}),
					dataType : 'text',
					success : function(data) {
						alert(data);
						getList(bno);
					}
				});
			});
			
			$("#replies").on("click", ".btn-update", function(){
				$("#myModal").modal("show");
				var rno = $(this).parent().attr("data-rno");
				var replytext = $(this).prev("p").text();
				$("#modal_rno").text(rno);
				$("#modal_replytext").val(replytext);
			});
			
			$("#replies").on('click', ".btn-delete", function(){
				var rno = $(this).parent().attr("data-rno");
				$.ajax({
					type : "delete",
					url : "/replies/"+rno,
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'DELETE'
					},
					dataType : "text",
					success : function(result){
						alert(result);
						getList(bno);
					}
				});
			});
			
			$("#insertReply").click(function(){
				var replyer = $("#replyer").val();
				var replytext = $("#replytext").val();
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
						getList(bno);
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
			
			$(".btn-danger").click(function(){
				$("form").attr("method", "post");
				$("form").attr("action", "/board/delete/${vo.bno}/${curPage}");
				$("form").submit();
			});
			
			getList(bno);
		});
		
		function getList(bno) {
			$.getJSON("/replies/"+bno, function(data){
				var str = "";
				for(var i=0;i<data.length;i++) {
					var obj = data[i];
					str += '<div class="panel panel-info"><div class="panel-heading"><span>rno:' +obj.rno+', 작성자: '+obj.replyer+'</span><span class="pull-right">'+obj.updatedate+'</span></div><div data-rno="'+obj.rno+'" class="panel-body"><p>'+obj.replytext+'</p><button class="btn btn-link btn-update">수정</button><button class="btn btn-link btn-delete">삭제</button></div></div>';
				}
				$("#replies").html(str);
			});
		}
	</script>

</body>
</html>