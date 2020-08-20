<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!
		int i = 10;
		String str = "ABCDE";
		int[] iArr = {10, 20, 30};
	%>
	
	<%
		out.println("i =" + i + "<br />");
		out.println("str =" + str + "<br />");
		out.println(Arrays.toString(iArr) + "<br />");
	%>
	
	i = <%= i %> <br />
	str = <%= str %> 
	
	<%-- jsp 주석 입니다. --%>
	<!-- html 주석 입니다. -->
</body>
</html>