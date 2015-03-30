package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.dbHelper.DbHelper;
import com.entity.Item;
import com.entity.Store;

public class StoreDao {
	// add delete getStoreByID update
	private static final String TAG = "com.dao.StoreDao:  ";

	/**
	 * get All Stores
	 * 
	 * @return
	 * @throws SQLException
	 */

	public ArrayList<Store> getStores() {
		ArrayList<Store> storeList = new ArrayList<Store>();
		Connection con = DbHelper.getConnection();
		ResultSet rs = null;
		String sql = "SELECT id FROM store";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Store store = getStoreById(rs.getInt("id"));
				storeList.add(store);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}

		return storeList;
	}

	public boolean addStore(Store store) {
		try {
			Connection con = DbHelper.getConnection();
			String sql = "INSERT store VALUES(null, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, store.getName());
			ArrayList<Item> items;
			items = store.getItems();
			ps.setString(2, this.listToString(items));
			ps.setInt(3, store.getSellerId());
			return ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * formate list<Item> into the String of id
	 * 
	 * @param items
	 * @return
	 */
	private String listToString(ArrayList<Item> items) {
		String tmp = "";
		Iterator<Item> iterator = items.iterator();
		while (iterator.hasNext()) {
			Item it = iterator.next();
			tmp = tmp + it.getId() + ";";
		}
		return tmp;
	}

	/**
	 * input a string of item ids
	 * 
	 * @param s
	 * @return items
	 * @throws SQLException
	 */
	private ArrayList<Item> stringToList(String s) {

		ArrayList<Item> items = new ArrayList<Item>();
		String[] ids = s.split(";");

		for (int i = 0; i < ids.length && !ids.equals(""); i++) {

			// get item
			System.out.println(ids[i]);
			int currentItemId = Integer.parseInt(ids[i].trim());
			System.out.println(TAG + " " + ids[i].toString());
			ItemDao itemDao = new ItemDao();
			Item currentitem = itemDao.getItemById(currentItemId);
			// put to itemlist
			items.add(currentitem);
		}
		return items;

	}

	/**
	 * Delete A store
	 * 
	 * @param store
	 * @return
	 * @throws SQLException
	 */
	public boolean deleteStore(Store store) {
		try {
			return deleteStoreById(store.getId());
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * Delete A store by id
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean deleteStoreById(int id) throws SQLException {
		try {
			Connection con = DbHelper.getConnection();
			String sql = "DELETE FROM store where id= ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			return ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	/**
	 * @param id
	 * @return
	 */
	public Store getStoreById(int id) {
		Store store = null;
		Connection con = DbHelper.getConnection();
		String sql = "SELECT * FROM store WHERE id =?";
		ResultSet rs = null;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);

			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs != null & rs.next()) {
				String name = rs.getString("name");
				int sellerId = rs.getInt("sellerId");
				ArrayList<Item> items = this.stringToList(rs
						.getString("itemList"));
				store = new Store(id, name, items, sellerId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return store;
	}

	/**
	 * update store
	 * 
	 * @param store
	 * @return
	 * @throws SQLException
	 */
	public boolean update(Store store) {
		try {
			Connection con = DbHelper.getConnection();
			String sql = "UPDATE store SET  name=?, itemList=?, sellerId=? WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			// set id
			ps.setInt(4, store.getId());
			// set name
			ps.setString(1, store.getName());
			// set sellerId
			ps.setInt(3, store.getSellerId());
			String items = listToString(store.getItems());
			ps.setString(2, items);
			return ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	// test zone
	/*
	 * public static void main(String[] arg) { StoreDao sd = new StoreDao();
	 * //Store store = new Store(1, "root", 1); //Item it = new Item(1,
	 * "laptop", 11, 11.2); //Item it2 = new Item(2, "shoe", 110, 11.2);
	 * //ArrayList<Item> items = new ArrayList<Item>(); //items.add(it);
	 * //items.add(it2); //store.setItems(items); // sd.addStore(store);
	 * //sd.deleteStore(store); // store=sd.getStoreById(1);
	 * //sd.addStore(store); // sd.updateStore(store); StoreDao storeDao = new
	 * StoreDao(); Store Store curStore = new Store();
	 * curStore=sd.getStoreById(1); ArrayList<Item> items=new ArrayList<Item>();
	 * items=curStore.getItems(); Iterator<Item> it= items.iterator();
	 * while(it.hasNext()){ System.out.println(it.next().getName());
	 * 
	 * }
	 * 
	 * 
	 * }
	 */

}
