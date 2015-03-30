<%@page import="java.sql.SQLException"%>
<%@page import="com.entity.Store"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.StoreDao"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.Iterator"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	User regUser= (User) session.getAttribute("user");
	String regInfo="Sign In";
	if(regUser!=null){
		regInfo="Sign In by: "+regUser.getUserName();
	}

%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Mall</title>
</head>
<body>

	<div id=title_bar>

		<h1>Online Mall Demo</h1>
		<h2>By Sun Jiayang</h2>
		<h2></h2>
		<a href="sign_in.jsp" ><%=regInfo %></a> <br />
		<a href="user_reg.jsp" >Sign Up!</a> <br>

	</div>


	<center>
		<table width="750" height="60" cellpadding="0" cellspacing="0"
			border="0">
			<tr>
				<td>
					<%
						StoreDao storeDao = new StoreDao();
						Store curStore ;
						ArrayList<Store> list = storeDao.getStores();
						Iterator<Store> it = list.iterator();
						while (it.hasNext()) {
							curStore = it.next();
							//System.out.println(curStore.getName());
					%> <!-- 店铺循环开始 -->


					<div>
						<dl>
							<dt>
								<a
									href="shop_detail.jsp?store_id=<%=curStore.getId()%>&action=openStore">
									<img src="images/shop.png" width="120" height="90" border="1" />
								</a>
							</dt>
							<dd class="dd_name">
								store name:
								<%=curStore.getName()%></dd>
							<dd class="dd_owner">
								owner id:
								<%=curStore.getSellerId()%></dd>
						</dl>
					</div> <!-- 店铺循环结束 --> 
					<% }%>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>