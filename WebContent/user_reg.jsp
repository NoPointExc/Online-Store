<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String regExpFlag=(String)session.getAttribute("regExpFlag");
	String titleBar="Hello! New User";
	session.setAttribute("regExpFlag", null);
	if(regExpFlag!=null&&regExpFlag.endsWith("notAccept")){
		titleBar="U can not sign up without accepting the protocol";
	}else if(regExpFlag!=null&&regExpFlag.endsWith("passwordError")){
		titleBar="Make sure your password is right";
	}else if(regExpFlag!=null&&regExpFlag.endsWith("usedName")){
		titleBar="Good name! But it has been used";
	}else if(regExpFlag!=null&&regExpFlag.endsWith("accountNotNum")){
		titleBar="account should be a number";
	}
	

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome! New User <%=titleBar %></title>
</head>
<body>
	<h1><%=titleBar %></h1>
	<img src="images/user.png" width="120" height="90" border="1" />
	<hr>
	<form name="regForm" action="com/servlet/RegServlet" method="post">
		<table border="0" width="800" cellspacing="0" cellpadding="0">
			<tr>
				<td class="lalel">name：</td>
				<td class="controler"><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td class="label">password：</td>
				<td class="controler"><input type="password" name="password"></td>

			</tr>
			<tr>
				<td class="label">confirm password：</td>
				<td class="controler"><input type="password" name="confirmpass"></td>

			</tr>

			<tr>
				<td class="lalel">location：</td>
				<td class="controler"><input type="text" name="location" /></td>
			</tr>


			<tr>
				<td class="lalel">account：</td>
				<td class="controler"><input type="number"  min="0" name="account" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="submit" />&nbsp;&nbsp; 
				<input type="reset" value="reset" />&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</form>
</body>
</html>