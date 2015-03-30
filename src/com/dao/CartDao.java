package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import com.dbHelper.DbHelper;
import com.entity.Cart;
import com.entity.Item;

public class CartDao {
	private final static String TAG = "com.dao.CartDao";

	// add delete update getById
	
	
	/**
	 * @param cart
	 * @return
	 * @throws SQLException
	 */

	public Cart getCartById(int id) throws SQLException {
		Connection con = DbHelper.getConnection();
		Cart cart = new Cart();
		String sql = "SELECT * FROM cart WHERE id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		
		
		
		// System.out.println(TAG+"rs:"+rs.toString());

		// System.out.println(TAG+"name:"+rs.getString("name"));
		HashMap<Item, Integer> itemList = new HashMap<Item, Integer>();
		while (rs.next()) {
			cart.setId(rs.getInt("id"));
			String itemId = rs.getString("itemId");
			String[] ids = itemId.split(";");
			String itemNum = rs.getString("itemNum");
			String[] nums = itemNum.split(";");

			for (int i = 0; i < ids.length; i++) {
				// get item
				int currentItemId = Integer.parseInt(ids[i]);
				ItemDao itemDao = new ItemDao();
				Item currentitem = itemDao.getItemById(currentItemId);
				// get num
				int currentItemNum = Integer.parseInt(nums[i]);
				// put to itemlist
				itemList.put(currentitem, currentItemNum);
			}

			// set itemList in cart
			cart.setItemList(itemList);
			cart.setTotalPrices(rs.getDouble("totalPrice"));
		}
		
		if(cart.getTotalPrices()!=0.0){
			return cart;
		}
		return null;
	}

	public boolean addCart(Cart cart) throws SQLException {
		//ensure input is not null
		//if(cart==null) return false;
		Connection con = DbHelper.getConnection();
		String sql = "INSERT cart VALUES(null, ?, ?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		// 设置商品id 和数量
		String itemId = "";
		String itemNum = "";
		Item currentIt;
		HashMap<Item, Integer> itemList = new HashMap<Item, Integer>();
		
		itemList = cart.getItemList();
		// 遍历itemList
		Set<Item> keys = itemList.keySet();
		// get iterator
		Iterator<Item> it = keys.iterator();
		while (it.hasNext()) {
			currentIt = it.next();
			// 写入item id into sql
			itemId = itemId + currentIt.getId() + ";";
			// write item num into sql
			itemNum = itemNum + itemList.get(currentIt) + ";";
		}
		ps.setString(1, itemId);
		ps.setString(2, itemNum);
		ps.setDouble(3, cart.getTotalPrices());

		return ps.execute();
	}

	/**
	 * @param cart
	 * @return
	 * @throws SQLException
	 */
	public boolean deleteCart(Cart cart) throws SQLException {
		int id = cart.getId();
		return this.deleteCartById(id);
	}

	/**
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean deleteCartById(int id) throws SQLException {
		Connection con = DbHelper.getConnection();
		String sql = "DELETE FROM cart WHERE id= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		return ps.execute();
	}

	/**
	 * @param cart
	 * @return
	 * @throws SQLException
	 */
	public boolean updateCart(Cart cart) throws SQLException {
		
		//ensure input is not null
		if(cart==null) return false;
		Connection con = DbHelper.getConnection();
		String sql = "UPDATE cart SET itemid=?, itemNum=?, totalPrice=?";
		PreparedStatement ps = con.prepareStatement(sql);

		// 设置商品id 和数量
		String itemId = "";
		String itemNum = "";
		Item currentIt=null;
		HashMap<Item, Integer> itemList = new HashMap<Item, Integer>();
		itemList = cart.getItemList();
		// 遍历itemList
		Set<Item> keys = itemList.keySet();
		Iterator<Item> it = keys.iterator();
		while (it.hasNext()) {
			currentIt = it.next();
			// 写入item id into sql
			itemId = itemId + currentIt.getId() + ";";
			// write item num into sql
			itemNum = itemNum + itemList.get(currentIt) + ";";
		}
		ps.setString(1, itemId);
		ps.setString(2, itemNum);
		ps.setDouble(3, cart.getTotalPrices());
		return ps.execute();
	}

	// *******test zone
	/*
	public static void main(String[] arg) {
		CartDao cd = new CartDao();
		Cart mcart = new Cart();
		mcart.setId(2);
		Item it = new Item(1, "laptop", 11, 11.2);
		Item it2 = new Item(2, "shoe", 110, 11.2);
		//mcart.addItem(it, 10);
		//mcart.addItem(it2, 10);

		try {

			// cd.addCart(mcart);
			// cd.deleteCart(mcart);
			
			 //cd.deleteCartById(17);
			 //cd.deleteCartById(18);
			//cd.updateCart(mcart);
			//cd.addCart(null);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	*/
}
