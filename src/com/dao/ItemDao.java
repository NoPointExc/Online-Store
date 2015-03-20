package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dbHelper.DbHelper;
import com.entity.Item;


public class ItemDao {
	private final static String TAG = "com.dao.ItemDao";
	/**
	 * add a item into mySql
	 * @param item
	 * @return
	 * @throws SQLException
	 */
	public boolean addItem(Item item) throws SQLException{
		Connection con = DbHelper.getConnection();
		String sql="INSERT item VALUES(null, ?, ?, ?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, item.getName());
		ps.setInt(2, item.getNum());
		ps.setDouble(3, item.getPrice());
		return ps.execute();
	}
	
	
	/**
	 * get item by id.
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public Item getItemById(int id) throws SQLException{
		Connection con=DbHelper.getConnection();
		Item item=new Item();
		String sql="SELECT * FROM item WHERE id=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs= ps.executeQuery();
		//System.out.println(TAG+"rs:"+rs.toString());
		 
		//System.out.println(TAG+"name:"+rs.getString("name"));
		while (rs.next()){
		item.setId(rs.getInt("id"));
		item.setName(rs.getString("name"));
		item.setNum(rs.getInt("num"));
		item.setPrice(rs.getDouble("price"));
		}
		return item;
	}

	/**
	 * update num 
	 * @param id
	 * @param num
	 * @return
	 * @throws SQLException
	 */
	public boolean updateItemNumById(int id, int num) throws SQLException{
		Connection con=DbHelper.getConnection();		
		String sql="UPDATE item SET num= ? WHERE id = ?";
		PreparedStatement ps=con.prepareStatement(sql);
		if(num<0) num=0;
		ps.setInt(1, num);
		ps.setInt(2, id);
		return ps.execute();	
	}
	
	
	/**
	 * update price 
	 * @param id
	 * @param price
	 * @return
	 * @throws SQLException
	 */
	public boolean updateItemPriceById(int id, double price) throws SQLException{
		Connection con=DbHelper.getConnection();		
		String sql="UPDATE item SET price= ? WHERE id = ?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setDouble(1, price);
		ps.setInt(2, id);
		return ps.execute();	
	}
	
	//*** test zone****
	
	/*
	public static void main(String[] arg){
		ItemDao id=new ItemDao();
		//Item it=new Item(0, "laptop", 1000, 30);
		try {
			//id.addItem(it);
			//id.updateItemNumById(3, -89);
			//id.updateItemPriceById(3, 3500);
			Item it=id.getItemById(3);
			System.out.println(TAG+" id:"+it.getId()+" name:"+it.getName()+" price:"+it.getPrice());
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	**/

}
