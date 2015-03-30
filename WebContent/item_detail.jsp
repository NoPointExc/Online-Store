<%@page import="com.dao.ItemDao"%>
<%@page import="com.entity.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ItemDao itemDao=new ItemDao();
	//System.out.println("@@@itemid=="+request.getParameter("item_id"));
	//int  requestId=1;
	int  requestId=Integer.parseInt(request.getParameter("item_id"))   ;
	Item item=itemDao.getItemById(requestId);	
	session.setAttribute("item", item);
 %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Item ID:<%=requestId %>  </title>
</head>
<body>
<img src="images/item.png" width="120" height="90" border="1" />
<h1>store name: <%=item.getName() %> </h1>
<br/>
number : <%=item.getNum() %>
<br/>
price : <%=item.getPrice() %>
<br/>
item ID: <%=item.getId() %>
<br/>
<hr>
	<form name="regForm" action="com/servlet/CartServlet" method="post">
		<table border="0" width="800" cellspacing="0" cellpadding="0">
			<tr>
				<td class="lalel">amount：</td>
				<td class="controler"><input type="number" min="0" name="amount" value="0" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="buy now!" />&nbsp;&nbsp; 
				<input type="reset" value="reset" />&nbsp;&nbsp;				
				</td>
			</tr>
		</table>
	</form>
</body>
</html>