package com.entity;



public class Item {
	private int id;
	private String name;
	//the number of this item
	private int num;
	//license=0, not allow to sell, 1 allow to sell
	private int license;
	
	private double price;
	
	//TAG for Log
	//private static final String TAG="com.entity.Item";

	public Item(){
		this.id=-1;
		this.name="";
		this.num=0;
		this.license=0;
		this.price=0;
		
	}
	
	public Item(int id, String name, int num,int license, double price){
		this.id=id;
		this.name=name;
		this.num=num;
		this.license=license;
		this.price=price;
		
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return id + ";" + name + ";" + num
				+ ";" + license;
	}
	
	//geter and setter
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getLicense() {
		return license;
	}
	public void setLicense(int license) {
		this.license = license;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
}
