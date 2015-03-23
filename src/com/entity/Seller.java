package com.entity;

import java.util.ArrayList;

public class Seller extends User {
	//the sales from all the stores
	private double sales;
	private ArrayList<Store> stores;
	public Seller(){
		super();
		sales=0;
		stores=new ArrayList<Store>();
	}
	
	public Seller( ArrayList<Store> stores) {
		super();
		sales = 0;
		this.stores = stores;
	}
	
	public boolean openStore(Store store){
		stores.add(store);
		return true;
	}
	
	/**
	 * @return sales from all the stores
	 */
	private double calSales(){
		double sales=0;
		for(int i=0;i<stores.size();i++){
			sales+=stores.get(i).getSales();
		}
		return sales;
	}
	//*****setter and getter

	public double getSales() {
		sales=this.calSales();
		return sales;
	}

	public void setSales(double sales) {
		this.sales = sales;
	}

	public ArrayList<Store> getStores() {
		return stores;
	}

	public void setStores(ArrayList<Store> stores) {
		this.stores = stores;
	}
	
	
	
}
