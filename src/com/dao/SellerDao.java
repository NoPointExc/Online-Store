package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.jsp.tagext.Tag;

import com.dbHelper.DbHelper;
import com.entity.Cart;
import com.entity.Item;
import com.entity.Seller;
import com.entity.Store;
import com.entity.User;

public class SellerDao extends UserDao {
	private final static String TAG = "com.dao.SellerDao";

	// add a seller
	public boolean addSeller(Seller seller) throws SQLException {
		Connection con = DbHelper.getConnection();
		// not to set id, id is autoincreament
		String username = seller.getUserName();
		String password = seller.getPassword();
		double account = seller.getAccount();
		String location = seller.getLocation();
		int cartId = 0;
		if (seller.getMyCart() != null)
			cartId = seller.getMyCart().getId();
		ArrayList<Store> stores = seller.getStores();
		String storeId = "";
		for (int i = 0; i < stores.size(); i++) {
			storeId = storeId + stores.get(i).getId() + ";";
		}
		String sql = "INSERT users VALUES (NULL,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, password);
		ps.setDouble(3, account);
		ps.setString(4, location);
		ps.setInt(5, cartId);
		ps.setString(6, storeId);
		return ps.execute();
		// ResultSet rSet = ps.executeQuery();

	}
	
	public Seller getSellerById(int id) throws SQLException {
		Seller seller = new Seller();
		Cart cart = new Cart();
		ArrayList<Store> stores=null;
		Connection con = DbHelper.getConnection();
		String sql = "SELECT * FROM users where id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rSet = ps.executeQuery();

		while (rSet.next()) {
			seller.setId(rSet.getInt("id"));
			seller.setUserName(rSet.getString("username"));
			seller.setPassword(rSet.getString("password"));
			seller.setAccount(rSet.getDouble("account"));
			seller.setLocation(rSet.getString("location"));
			//seller.setSales(rSet.getDouble("sales"));
			int cId = rSet.getInt("cartId");
			if (cId != 0) {
				CartDao cd= new CartDao();
				cart=cd.getCartById(cId);					
			}
			// System.out.println(TAG+"cartid"+cId);
			seller.setMyCart(cart);
			seller.setStores(stores);
			
			
		}

		return seller;
	}
	
	//****test zone******** partly tested
	/*
	public static void main(String[] arg){
		SellerDao sDao=new SellerDao();
		Seller mSeller=new Seller();
		mSeller.setUserName("first Seller");
		mSeller.setAccount(23.2);
		mSeller.setLocation("New York");
		mSeller.setPassword("sdf");
		//mSeller.setSales(20);
		Cart myCart=new Cart();
		myCart.setId(3);
		Item shoe=new Item(1, "shoe", 1,  20.3);
		Item cloth=new Item(2, "cloth", 3,  22.2);
		myCart.addItem(shoe, 2);
		myCart.addItem(cloth, 1);
		mSeller.setMyCart(myCart);

		// new Store(id, name, seller);
		Store myStore = new Store(1, "ClStore", new Seller());
		myStore.addItem(shoe);
		myStore.addItem(shoe);
		myStore.addItem(shoe);
		myStore.addItem(cloth);
		ArrayList<Store> stores=new ArrayList<Store>();
		stores.add(myStore);
		mSeller.setStores(stores);
		
		
		try {
			//sDao.addSeller(mSeller);
			
			Seller s=sDao.getSellerById(7);
			System.out.println(TAG+"id:"+s.getId()+" name:"+s.getUserName());
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
	}
	**/
}
