<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="student" class="com.javalec.ex7.Student" scope="page" ></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty name="student" property="name" value="unchae" />
	<jsp:setProperty name="student" property="age" value="27" />
	<jsp:setProperty name="student" property="grade" value="3" />
	<jsp:setProperty name="student" property="studentNum" value="1701115" />
	
	
	이름: <jsp:getProperty property="name" name="student"/> <br />
	나이: <jsp:getProperty property="age" name="student"/> <br />
	학년: <jsp:getProperty property="grade" name="student"/> <br />
	번호: <jsp:getProperty property="studentNum" name="student"/>
	
</body>
</html>