package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;






import com.dao.OrderDao;
import com.entity.Cart;
import com.entity.Item;
import com.entity.Order;
import com.entity.Store;
import com.entity.User;


/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String TAG = "com.servlet.CartServlet:  ";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			Item currItem=(Item) request.getSession().getAttribute("item");
			User currUser=(User) request.getSession().getAttribute("user");
			Store currStore=(Store) request.getSession().getAttribute("store");
			double price=currItem.getPrice();
			//System.out.println(TAG+currUser==null);
			if(currUser==null) {
				response.sendRedirect(request.getContextPath()+"/sign_in.jsp");
				return;
				}
			//ensure has log in.
			double account=currUser.getAccount();
			int left=currItem.getNum();
			String amountString=request.getParameter("amount");
			int amount=1;
			if(isPositiveInt(amountString)){
				amount=Integer.parseInt(amountString);				
			}
			if(account>price&& left>=amount){
				//deal success
				currUser.setAccount(account-price);
				currItem.setNum(left-amount);
				//make purchase record
				Order order=new Order(0, currUser.getId(), currItem.getId(), currStore.getId(), amount);
				OrderDao orderDao=new OrderDao();
				orderDao.addOrder(order);
				response.sendRedirect(request.getContextPath()+"/success.jsp");
			}else{
				//no enough money
				response.sendRedirect(request.getContextPath()+"/sorry.jsp");
			}
			
	}

	private boolean isPositiveInt(String s) {
		try {
			int num = Integer.parseInt(s);
			if (num > 0) {
				return true;
			} else {
				return false;
			}
		} catch (NumberFormatException e) {
			return false;
		}
	}

}
