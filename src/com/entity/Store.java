package com.entity;

import java.util.ArrayList;
import java.util.Iterator;

import com.dao.StoreDao;

public class Store {
	private int id;
	private String name;
	private ArrayList<Item> items; // item has "num" attribute
	//the owner of the shop
	private int sellerId;
	private StoreDao sd;
	
	private static final String TAG="com.entity.Store:  ";


	public Store() {
		id = 0;
		name = "";
		items = new ArrayList<Item>();
		sellerId=0;
		sd=new StoreDao();
	}



	public Store(int id, String name,ArrayList<Item> items, int sellerId) {
		super();
		this.id = id;
		this.name = name;
		this.sellerId=sellerId;
		this.items = items;
		sd=new StoreDao();
	}
	
	public void createNewStore(){
		sd.addStore(this);
	}

	/**
	 * @param item
	 * @return 
	 * true:item has been add, false: item=null or items has already in the list
	 */
	public boolean addItem(Item item) {
		if(item==null) return false;
		if(hasItem(item)){
			return false;
		}else{
			items.add(item);
			sd.update(this);
			return true;
		}
		
	}
	
	private boolean hasItem(Item item){
		if(items.isEmpty()) return false;
		Iterator<Item> mIter=items.iterator();
		while(mIter.hasNext()){
			if(mIter.next().getId()==item.getId()) return true;
		}
		return false;
		
	}

	// *******setter and getter****


	
	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
		if(sd.update(this)){
			System.out.println(TAG+"salses setted and DB updated");
		}else{
			System.out.println(TAG+"DB updated Error");
		}
	}
	
	

	// setter and getter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
		if(sd.update(this)){
			System.out.println(TAG+"salses setted and DB updated");
		}else{
			System.out.println(TAG+"DB updated Error");
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
		if(sd.update(this)){
			System.out.println(TAG+"salses setted and DB updated");
		}else{
			System.out.println(TAG+"DB updated Error");
		}
	}

	public ArrayList<Item> getItems() {
		return items;
	}

	public void setItems(ArrayList<Item> items) {
		this.items = items;
		if(sd.update(this)){
			System.out.println(TAG+"salses setted and DB updated");
		}else{
			System.out.println(TAG+"DB updated Error");
		}
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
