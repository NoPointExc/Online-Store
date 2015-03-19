package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.dbHelper.DbHelper;
import com.entity.Cart;
import com.entity.User;

public class UserDao {
	private final static String TAG = "com.dao.UserDao";

	public boolean addUser(User user) {
		return true;
	}

	public boolean deleteUser(User user) {
		return true;
	}

	public User getUserById(int id) throws SQLException {
		User user = new User();
		Cart cart=new Cart();
		cart=null;
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
			int cId=rSet.getInt("cartId");
			if(cId!=0){
				//if cart exists
				cart.setId(cId);
				//!!!!get cart By ID!!!!!!!!!!!!!
				
			}
			//System.out.println(TAG+"cartid"+cId);
			
		}

		System.out.println(TAG + "  id:" + user.getId() + "  username:"
				+ user.getUserName() + "  password" + user.getPassword()
				+ "  acount:" + user.getAccount());
		return user;
	}
	//******test zone**********
	public static void main(String[] arg) {
		UserDao ud=new UserDao();
		try {
			User u=ud.getUserById(1);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
