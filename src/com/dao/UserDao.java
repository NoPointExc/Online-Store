package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dbHelper.DbHelper;
import com.entity.User;

public class UserDao {
	private final static String TAG = "com.dao.UserDao";

	public boolean addUser(User user)  {
		try {
		Connection con = DbHelper.getConnection();
		// ≤ª…Ëid
		String username = user.getUserName();
		String password = user.getPassword();
		double account = user.getAccount();
		String location = user.getLocation();
		/*
		int cartId = 0;
		if (user.getMyCart() != null)
			cartId = user.getMyCart().getId();
		*/
		String sql = "INSERT users VALUES (NULL,?,?,?,?)";
		PreparedStatement ps;
		ps = con.prepareStatement(sql);	
		ps.setString(1, username);
		ps.setString(2, password);
		ps.setDouble(3, account);
		ps.setString(4, location);
		//ps.setInt(5, cartId);
		return ps.execute();
		// ResultSet rSet = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
			
		}

	}

	public boolean deleteUser(User user) {
		try{
		Connection con = DbHelper.getConnection();
		String sql = "DELETE FROM users where id= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, user.getId());

		return ps.execute();
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteUserById(int id)  {
		try{
		Connection con = DbHelper.getConnection();
		String sql = "DELETE FROM users where id= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		return ps.execute();
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public User getUserById(int id){
		try{
		User user = new User();
		//Cart cart = new Cart();
		//cart = null;
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
			/*
			int cId = rSet.getInt("cartId");
			if (cId != 0) {
				CartDao cd = new CartDao();
				Cart myCart = cd.getCartById(cId);
				user.setMyCart(myCart);
			}
			*/

		}

		System.out.println(TAG + "  id:" + user.getId() + "  username:"
				+ user.getUserName() + "  password" + user.getPassword()
				+ "  acount:" + user.getAccount());
		return user;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public User getUserByUserName(String name) {
		try{
		User user = new User();
		//Cart cart = new Cart();
		//cart = null;
		Connection con = DbHelper.getConnection();
		String sql = "SELECT * FROM users where username =?";
		PreparedStatement ps;
		
			ps = con.prepareStatement(sql);
	
		ps.setString(1, name);
		ResultSet rSet = ps.executeQuery();

		while (rSet.next()) {
			user.setId(rSet.getInt("id"));
			user.setUserName(rSet.getString("username"));
			user.setPassword(rSet.getString("password"));
			user.setAccount(rSet.getDouble("account"));
			user.setLocation(rSet.getString("location"));
			/*
			int cId = rSet.getInt("cartId");
			if (cId != 0) {
				CartDao cd = new CartDao();
				Cart myCart = cd.getCartById(cId);
				user.setMyCart(myCart);
			}
			*/

		}


		return user;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}

	
	
	/**
	 * @param username
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public boolean checkPassword(String username, String password) {
		try{
		Connection con = DbHelper.getConnection();
		String sql = "SELECT * FROM users where username =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			if (password.equals(rs.getString("password"))) {
				return true;
				}

			}
		
		return false;
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	
	
	public boolean update(User user) {
		// ensure input is not null
		if (user == null)
			return false;
		try {
			Connection con = DbHelper.getConnection();
			String sql = "UPDATE users SET username=?, password=?, account=?, location=? WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			// set id, username, password....
			int id = user.getId();
			String username = user.getUserName();
			String password = user.getPassword();
			double account = user.getAccount();
			String location = user.getLocation();
			ps.setInt(5, id);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setDouble(3, account);
			ps.setString(4, location);

			return ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	// ******test zone**********
/*
	public static void main(String[] arg) {
		UserDao ud = new UserDao();
		try {
			// User u = ud.getUserById(5); // ud.addUser(u); //ud.deleteUser(u);
			// ud.deleteUserById(3);
			boolean rs = ud.checkPassword("root", "sun721030");
			System.out.println(TAG + rs);
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
**/
}
