package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.OrderDao;
import com.dao.UserDao;
import com.entity.Order;
import com.entity.User;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//user
		User user;
		//get info from request
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmpass = request.getParameter("confirmpass");
		String accountString = request.getParameter("account");
		String location = request.getParameter("location");
		double account=0;
		if(!isDouble(accountString)){
			request.getSession().setAttribute("regExpFlag", "accountNotNum");
			response.sendRedirect(request.getContextPath()+ "/user_reg.jsp");
			return;
		}else{
			account=Double.parseDouble(accountString);
		}
		
		//create user
		user=new User();
		user.setUserName(username);
		if(password.equals(confirmpass)){
			user.setPassword(password);
		}else{
			request.getSession().setAttribute("regExpFlag", "passwordError");
			response.sendRedirect(request.getContextPath()+ "/user_reg.jsp");
			return;
		}
		user.setAccount(account);
		user.setLocation(location);
		//save in DB
		user.CreateNewUser();
		request.getSession().setAttribute("user", user);
		//save orders into session
		OrderDao orderDao=new OrderDao();
		ArrayList<Order> orders=orderDao.getOrdersByUserId(user.getId());
		request.getSession().setAttribute("orders", orders);
		response.sendRedirect(request.getContextPath()
				+ "/index.jsp");
	}

	private boolean isDouble(String s) {
		try {
			Double.parseDouble(s);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

}
