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
			$(".uploadedList").on("click", "small", function(event) {
				var that = $(this);
				$.ajax({
					type : 'post',
					url : '/deletefile',
					data : {
						filename : $(this).attr("data-src")
					},
					dataType : 'text',
					success : function(data) {
						that.parent("p").parent("div").remove();
					}
				});
			});
			
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
						var str = "<div class='up_thumb'>";
						
						if (checkImg(data)) {
							str += "<a target='_blank' href='display?filename="+getImageName(data)+"'><img src='display?filename="+data+"'></a>"
						}else {
							str += "<a href='display?filename="+data+"'><img alt='일반파일 썸네일' src='/resources/img/gt.png'></a>";
						}
						
						str += "<p>"+getOriginalName(data)+" <small data-src='"+data+"''>X</small>"+"</p>";
						str += "</div>";
						$(".uploadedList").append(str);
					}
				});
			});
			alert(checkImg("a.png"));
		});
		
		function checkImg(filename) {
			
			/* var pattern = /jpg|jpeg|png|gif/i; ignore의 약자
			return filename.match(pattern) */
			
			
			var type = filename.substring(filename.lastIndexOf(".")+1);
			type = type.toLowerCase();
			if (type == "png" || type =="jpeg" || type == "jpg" || type == "gif") {
				return true;
			}else{
				return false;
			}
		}
		

		function getOriginalName(filename) {
			var idx="";
			
			if (checkImg(filename)) {
				idx = filename.indexOf("_", 14)+1;
			}else {
				idx = filename.indexOf("_")+1;
			}
			filename = filename.substring(idx);
			return filename;
		}
		
		function getImageName(filename) {
			var prefix = filename.substring(0, 12);
			var suffix = filename.substring(14);
			console.log(prefix);
			console.log(suffix);
			return prefix + suffix;
		}
	</script>
	
	
</body>
</html>