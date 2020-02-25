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
  
  <style type="text/css">
  	.fileDrop{
  		width: 100%;
  		height: 200px;
  		border: 1px dotted red;
  	}
  </style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="fileDrop"></div>
			<div class="uploadedList"></div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			$(".fileDrop").on("dragenter dragover", function(event){
				event.preventDefault();
			});
			
			$(".fileDrop").on("drop", function(event){
				event.preventDefault();
				
				var files = event.originalEvent.dataTransfer.files;
				var file = files[0];
				
				var formData = new FormData();
				formData.append("file", file);
				$.ajax({
					type : "post",
					url : "/uploadajax",
					data : formData,
					dataType : "text",
					processData : false,
					contentType : false,
					success : function(data) {
						console.log(data);
					}
				});
			});
		});
	</script>
	
	
</body>
</html>