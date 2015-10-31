package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dbHelper.DbHelper;
import com.entity.Order;

public class OrderDao {

	/**
	 * add a order into database. Return whether true if added success.
	 * 
	 * @param order
	 * @return
	 */
	public boolean addOrder(Order order) {
		Connection con = DbHelper.getConnection();
		String SQL_ADD = "INSERT orders VALUES (NULL, ?, ?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(SQL_ADD);
			ps.setInt(1, order.getUserId());
			ps.setInt(2, order.getShopId());
			ps.setInt(3, order.getItemId());
			ps.setInt(4, order.getAmount());
			ps.setString(5, order.getName());
			ps.setString(6, order.getShopName());
			ps.setDouble(7, order.getTotalPrice());
			return ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	/**
	 * delete a order from DB by id. Return true if delete success.
	 * 
	 * @param id
	 * @return
	 */
	public boolean deleteOrderById(int id) {
		Connection con = DbHelper.getConnection();
		String SQL_DEL = "DELETE FROM orders WHERE id=?";
		try {
			PreparedStatement ps = con.prepareStatement(SQL_DEL);
			ps.setInt(1, id);
			return ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	/**
	 * get all the order in the format of ArrayList<Order>. Return null if
	 * exception caught.
	 * 
	 * @param uId
	 * @return
	 */
	public ArrayList<Order> getOrdersByUserId(int uId) {
		try {
			Connection con = DbHelper.getConnection();
			String SQL_SEL = "SELECT * FROM orders WHERE user_id=?";
			ArrayList<Order> orders = new ArrayList<Order>();

			PreparedStatement ps = con.prepareStatement(SQL_SEL);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
			// travel through the rs for every Order
			while (rs.next()) {
				Order order = new Order(rs.getInt("id"), rs.getInt("user_id"),
						rs.getInt("item_id"), rs.getInt("shop_id"),
						rs.getInt("amount"));
				orders.add(order);
			}

			return orders;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	public boolean update(Order order) {
		if (order == null)
			return false;
		try {
			Connection con = DbHelper.getConnection();
			String SQL_UPD = "UPDATE orders SET user_id=?, shop_id=?, item_id=?, amount=? WHERE id=?";
			PreparedStatement ps = con.prepareStatement(SQL_UPD);
			int id, user_id, shop_id, item_id, amount;
			id = order.getId();
			user_id = order.getUserId();
			shop_id = order.getShopId();
			item_id = order.getItemId();
			amount = order.getAmount();
			ps.setInt(1, user_id);
			ps.setInt(2, shop_id);
			ps.setInt(3, item_id);
			ps.setInt(4, amount);
			ps.setInt(5, id);
			return ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

}
