<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String regExpFlag=(String)session.getAttribute("passwordError");
	session.setAttribute("passwordError", null);
	String titleBar="";
	if(regExpFlag!=null&&regExpFlag.endsWith("empty")){
		titleBar="Empty Password";
	}else if(regExpFlag!=null&&regExpFlag.endsWith("wrong")){
		titleBar="Wrong passowrd";
	}
	

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign In</title>
</head>
<body>
<h1>Sign In <%=titleBar %></h1>

	<div id="container">
		<div class="logo">
			<a href="#"><img src="images/user.png" width="120" height="90" border="1"/> </a>
		</div>
		<div id="box">
			<form action="com/servlet/LoginServlet?action=sign_in" method="post">
				<p class="main">
					<label>User Name: </label> <input name="username" value="" /> <label>Password:
					</label> <input type="password" name="password" value="">
				</p>
				<p class="space">
					<input type="submit" value="log in" class="login"
						style="cursor: pointer;" />
				</p>
			</form>
		</div>
	</div>
</body>
</html>