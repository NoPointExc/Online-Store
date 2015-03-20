package com.entity;

import java.util.ArrayList;

public class Store {
	private int id;
	private String name;
	private ArrayList<Item> items; // item has "num" attribute
	//the owner of the shop
	private int sellerId;
	private double sales;
	




	public Store() {
		id = 0;
		name = "no_name";
		items = new ArrayList<Item>();
		sellerId=0;

	}



	public Store(int id, String name, int sellerId) {
		super();
		this.id = id;
		this.name = name;
		this.sellerId=sellerId;
		items = new ArrayList<Item>();

	}

	public boolean addItem(Item item) {
		int pos = items.indexOf(item);
		if (pos != -1) {
			// item has already in the list
			Item it = items.get(pos);
			it.setNum(it.getNum() + item.getNum());
			return true;
		}
		// item not in the list
		items.add(item);
		return true;
	}
	
	

	// *******setter and getter****

	public double getSales() {
		return sales;
	}



	public void setSales(double sales) {
		this.sales = sales;
	}

	
	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	
	

	// setter and getter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<Item> getItems() {
		return items;
	}

	public void setItems(ArrayList<Item> items) {
		this.items = items;
	}

	// *****test zone***********
	
	/*
	public static void main(String[] arg) {
		int i = 0;
		// new Item(id, name, num, license, price);
		Item shoe = new Item(i++, "shoe", 5, 2, 600);
		Item cloth = new Item(i++, "cloth", 10, 1, 800);
		Item pans = new Item(i++, "pans", 100, 1, 800);

		// new Store(id, name, seller);
		Store myStore = new Store(1, "ClStore", new Seller());
		myStore.addItem(shoe);
		System.out.println("items=" + myStore.getItems());
		myStore.addItem(shoe);
		myStore.addItem(shoe);
		myStore.addItem(cloth);
		myStore.addItem(pans);
		System.out.println("items=" + myStore.getItems());

	}
	*/

}
