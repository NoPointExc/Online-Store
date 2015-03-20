package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.dbHelper.DbHelper;
import com.entity.Cart;
import com.entity.User;

public class UserDao {
	private final static String TAG = "com.dao.UserDao";

	public boolean addUser(User user) throws SQLException {
		Connection con = DbHelper.getConnection();
		// ≤ª…Ëid
		String username = user.getUserName();
		String password = user.getPassword();
		double account = user.getAccount();
		String location = user.getLocation();
		int cartId = 0;
		if (user.getMyCart() != null)
			cartId = user.getMyCart().getId();

		String sql = "INSERT users VALUES (NULL,?,?,?,?,?,NULL)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, password);
		ps.setDouble(3, account);
		ps.setString(4, location);
		ps.setInt(5, cartId);
		return ps.execute();
		// ResultSet rSet = ps.executeQuery();

	}

	public boolean deleteUser(User user) throws SQLException {
		Connection con = DbHelper.getConnection();
		String sql = "DELETE FROM users where id= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, user.getId());

		return ps.execute();
	}

	public boolean deleteUserById(int id) throws SQLException {
		Connection con = DbHelper.getConnection();
		String sql = "DELETE FROM users where id= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		return ps.execute();
	}

	/**
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public User getUserById(int id) throws SQLException {
		User user = new User();
		Cart cart = new Cart();
		cart = null;
		Connection con = DbHelper.getConnection();
		String sql = "SELECT * FROM users where id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rSet = ps.executeQuery();

		while (rSet.next()) {
			user.setId(rSet.getInt("id"));
			user.setUserName(rSet.getString("username"));
			user.setPassword(rSet.getString("password"));
			user.setAccount(rSet.getDouble("account"));
			user.setLocation(rSet.getString("location"));
			int cId = rSet.getInt("cartId");
			if (cId != 0) {
			CartDao cd=new CartDao();
			Cart myCart=cd.getCartById(cId);
			user.setMyCart(myCart);
			}
			

		}

		System.out.println(TAG + "  id:" + user.getId() + "  username:"
				+ user.getUserName() + "  password" + user.getPassword()
				+ "  acount:" + user.getAccount());
		return user;
	}

	// ******test zone**********
	/*
	 * public static void main(String[] arg) { UserDao ud = new UserDao(); try {
	 * User u = ud.getUserById(5); //ud.addUser(u); //ud.deleteUser(u);
	 * ud.deleteUserById(3); } catch (SQLException e) {
	 * 
	 * e.printStackTrace(); }
	 * 
	 * 
	 * }
	 */

}
