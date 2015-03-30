<%@page import="com.dao.StoreDao"%>
<%@page import="com.entity.Store" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Item"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	StoreDao storeDao=new StoreDao();
	Item curItem=null;	
	int requestId=Integer.parseInt(request.getParameter("store_id"));
	Store store=storeDao.getStoreById(requestId);
	
 %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Store ID: <%=requestId %></title>
</head>
<body>
<img src="images/shop.png" width="120" height="90" border="1" />
<h1>store name: <%=store.getName() %> </h1>
	<%
	ArrayList<Item> itemList=store.getItems();
	//itemsList 为空
	Iterator<Item> it = itemList.iterator();
	while(it.hasNext()) {
 		curItem = it.next();
 	//for(int i=0;i<5;i++){
		
	 %>
	 <!-- 循环开始 -->
	 
				<div>
						<dl>
							<dt>
								<a
									href="item_detail.jsp?item_id=<%=curItem.getId() %>&action=openItem">
									<img src="images/item.png" width="120" height="90" border="1" />
								</a>
							</dt>
							<dd class="dd_name">
								name: <%=curItem.getName()%>
								</dd>
							<dd class="dd_price">
								price:<%=curItem.getPrice()%>
							</dd>
							<dd class="dd_number">
								number:<%=curItem.getNum()%>
								</dd>
						</dl>
					</div>
	 
	 <!-- 循环结束 -->
	 <%
	 }
	  %>
</body>
</html>