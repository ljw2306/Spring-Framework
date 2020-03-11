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
			<form action="/user/loginPost" method="post">
				<div class="form-group">
					<label for="id">아이디</label>
					<input id="id" name="id" class="form-control">
				</div>
				
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input id="pw" name="pw" type="password" class="form-control">
				</div>
				
				<div class="form-group">
					<input value="로그인" type="submit" class="form-control btn btn-info">
				</div>
				
			</form>
		</div>
		
		
	</div>


</body>
</html>