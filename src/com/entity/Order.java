package com.entity;

import com.dao.ItemDao;
import com.dao.OrderDao;
import com.dao.StoreDao;

public class Order {
	private int id;
	private int userId;
	private int itemId;
	private int shopId;
	private int amount;
	private String name;
	private String shopName;
	private double totalPrice;
	private static OrderDao odd;
	private static ItemDao itd;
	private static StoreDao std;
	private final String TAG="com.eneity.Order:  ";
	public Order() {
		odd=new OrderDao();
		itd=new ItemDao();
		std=new StoreDao();
		id = 0;
		userId = 0;
		itemId = 0;
		shopId = 0;
		amount = 0;
		name="";
		shopName="";
		totalPrice = 0;
	
	}


	public Order( int id,int userId, int itemId, int shopId, int amount) {
		odd=new OrderDao();
		itd=new ItemDao();
		std=new StoreDao();
		this.id = 0;
		this.userId = userId;
		this.itemId = itemId;
		this.shopId = shopId;
		this.amount = amount;
		name=itd.getItemById(itemId).getName();
		shopName=std.getStoreById(shopId).getName();
		calPrice();
	}
	
	public boolean createNewOrder(){
		boolean isExcuted=false;
		isExcuted=odd.addOrder(this);
		return isExcuted;
	}

	private void calPrice(){
		System.out.println(TAG+itemId);
		Item it=itd.getItemById(itemId);
		double price=it.getPrice();
		totalPrice=price*amount;
	}

	// ****setter and getter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
		odd.update(this);
	}
	
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
		odd.update(this);
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
		odd.update(this);
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		odd.update(this);
	}

	public double getTotalPrice() {
		// calculate total price
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

}
