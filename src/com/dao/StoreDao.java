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
	private static final String TAG="com.dao.StoreDao";
	/**add a store into mysql
	 * @param store
	 * @return
	 * @throws SQLException
	 */
	public boolean addStore(Store store) throws SQLException {
		Connection con = DbHelper.getConnection();
		String sql="INSERT store VALUES(null, ?, ?, ?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, store.getName());
		ArrayList<Item> items;
		items=store.getItems();
		ps.setString(2, this.listToString(items));
		ps.setInt(3, store.getSellerId());
		return ps.execute();
	}
	
	/**formate list<Item> into the String of id
	 * @param items
	 * @return
	 */
	private String listToString(ArrayList<Item> items){
		String tmp="";
		Iterator<Item> iterator= items.iterator();
		while (iterator.hasNext()) {
			Item it=iterator.next();
			tmp=tmp+it.getId()+";";
		}
		return tmp;
	}
	
	/**
	 * @param s
	 * @return
	 * @throws SQLException
	 */
	private ArrayList<Item> stringToList(String s) throws SQLException{
		ArrayList<Item> items=new ArrayList<Item>();
		String[] ids = s.split(";");

		for (int i = 0; i < ids.length; i++) {
			// get item
			int currentItemId = Integer.parseInt(ids[i].trim());
			System.out.println(TAG+" "+ids[i].toString());
			ItemDao itemDao = new ItemDao();
			Item currentitem = itemDao.getItemById(currentItemId);
			// put to itemlist
			items.add(currentitem);
		}
		return items;
	}

	/**Delete A store 
	 * @param store
	 * @return
	 * @throws SQLException
	 */
	public boolean deleteStore(Store store) throws SQLException {
		return deleteStoreById(store.getId());
	}

	/**Delete A store by id
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean deleteStoreById(int id) throws SQLException {
		Connection con = DbHelper.getConnection();
		String sql = "DELETE FROM store where id= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		
		return ps.execute();
		
	}

	public Store getStoreById(int id) throws SQLException {
		Store store=new Store();
		Connection con = DbHelper.getConnection();
		String sql = "SELECT * FROM store WHERE id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rSet = ps.executeQuery();
		while(rSet!=null & rSet.next()){
		store.setId(id);
		//System.out.println(TAG+rSet.getString("name"));
		store.setName(rSet.getString("name"));
		store.setSellerId(rSet.getInt("sellerId"));
		//set items
		store.setItems(this.stringToList(rSet.getString("itemList")));
		}
		return store;
	}
	
	/**update store 
	 * @param store
	 * @return
	 * @throws SQLException
	 */
	public boolean updateStore(Store store) throws SQLException{
		Connection con = DbHelper.getConnection();
		String sql = "UPDATE store SET  name=?, itemList=?, sellerId=? WHERE id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		//set id
		ps.setInt(4, store.getId());
		//set name
		ps.setString(1, store.getName());
		//set sellerId
		ps.setInt(3, store.getSellerId());		
		Iterator<Item> it = store.getItems().iterator();
		String currentIt="";
		while (it.hasNext()) {
			currentIt=currentIt+it.next().getId()+";";
		}
		ps.setString(2, currentIt);
		return ps.execute();
	
		
	}
	
	//test zone
	
	/*
	public static void main(String[] arg){
		StoreDao sd=new StoreDao();
		Store store=new Store(1, "root", 1);
		Item it = new Item(1, "laptop", 11, 11.2);
		Item it2 = new Item(2, "shoe", 110, 11.2);
		ArrayList<Item> items=new ArrayList<Item>();
		items.add(it);
		items.add(it2);
		store.setItems(items);
		try {
			//sd.addStore(store);
			//sd.deleteStore(store);
			//store=sd.getStoreById(1);
			//sd.addStore(store);
			sd.updateStore(store);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	**/
	
}
