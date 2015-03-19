package com.entity;

public class User {
	private int id;
	private String password;
	private String userName;
	private int gentle;// 0 for male, 1 for female, null for undefined
	private double account; // the dollar the user have
	private Cart myCart;
	private String location;

	// TAG for Log
	// private static final String TAG = "com.entity.User";



	public User() {
		id = 0;
		password = "no_password";
		userName = "no_username";
		gentle = 2;
		account = 0;
		myCart = new Cart();	
	}

	public User(int id, String userName, String password, int gentle,
			int account) {

		this.id = id;
		this.password = password;
		this.userName = userName;
		this.gentle = gentle;
		this.account = account;
		myCart = new Cart();
	}

	public void addToCart(Item item, int num) {
		myCart.addItem(item, num);
	}

	/**
	 * @return whether enough cash for checkout
	 */
	public boolean checkout() {
		if (account >= myCart.getTotalPrices()) {
			account -= myCart.getTotalPrices();
			myCart.setItemList(null);
			myCart.setTotalPrices(0.0);
			return true;
		} else {
			return false;
		}

	}

	public boolean buyNow(Item item, int num) {
		double total = num * (item.getPrice());
		if (account >= total) {
			account -= total;
			return true;
		} else {
			return false;
		}
	}

	// ***********setter and getter*****************************
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getGentle() {
		return gentle;
	}

	public void setGentle(int gentle) {
		this.gentle = gentle;
	}

	public double getAccount() {
		return account;
	}

	public void setAccount(double account) {
		this.account = account;
	}

	public Cart getMyCart() {
		return myCart;
	}

	public void setMyCart(Cart myCart) {
		this.myCart = myCart;
	}
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	// *******test zone***********************
	/*
	 * public static void main(String[] arg) { int i = 0; Item item1 = new
	 * Item(i++, "item1", 1, 1, 1); Item item2 = new Item(i++, "item2", 3, 1,
	 * 1); Item item3 = new Item(i++, "item3", 2, 1, 50); // new User(id,
	 * userName, password, gentle, account) User myUser = new User(0,
	 * "sunjiayang", "123456", 0, 500); System.out.println("acount=" +
	 * myUser.getAccount()); // myUser.buyNow(item1, 2); //
	 * System.out.println("**** buy 1*item1 ******");
	 * System.out.println("**** check out******"); myUser.addToCart(item2, 3);
	 * myUser.addToCart(item3, 10); myUser.addToCart(item2, 3); if
	 * (myUser.checkout()) { System.out.println("acount=" +
	 * myUser.getAccount()); } else { System.out.println("not enough money"); }
	 * System.out.println(myUser.getMyCart());
	 * 
	 * }
	 */
}
