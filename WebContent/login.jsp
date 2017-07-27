<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<jsp:include page="bootstrap.jsp"></jsp:include>
    <!-- Custom CSS -->
    <link href="css/heroic-features.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Navigation.jsp"></jsp:include>
<form action = "Validate" method="post">
Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="username"><br/>
	Password:&nbsp;<input type="password" name="password"><br/>
	<input type="hidden" name="action" value="login">
	<input type="submit" value="Submit">
	<a href="signUp.jsp">Sign up</a>
	
	${message}
	
</form>
</body>
</html>