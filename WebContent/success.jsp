<%@page import="com.entity.User"%>
<%@page import="com.entity.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	User user=(User)session.getAttribute("user");
	Item item=(Item)session.getAttribute("item");
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Success</title>
</head>
<body>
<h1>Success by <%=item.getName() %>   and <%=user.getAccount() %> left in your account</h1>
</body>
</html>