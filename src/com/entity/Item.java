package com.entity;


import com.dao.ItemDao;



public class Item {
	private int id;
	private String name;
	//the number of this item
	private int num;
	//license=0, not allow to sell, 1 allow to sell
	//private int license;
	
	private double price;
	private ItemDao itd;
	
	//TAG for Log
	private static final String TAG="com.entity.Item:  ";

	public Item(){
		this.id=-1;
		this.name="";
		this.num=0;
		this.price=0;
		itd=new ItemDao();
	}
	
	public Item(int id, String name, int num, double price){
		this.id=id;
		this.name=name;
		this.num=num;
		this.price=price;
		itd=new ItemDao();
	}
	
	public boolean createNewItem(){
		boolean isExcuted=false;
		isExcuted=itd.addItem(this);
		return isExcuted;	
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return id + ";" + name + ";" + num
				+ ";" ;
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
		if(itd.update(this)){
			System.out.println(TAG+"num setted and DB updated");
		}else{
			System.out.println(TAG+"DB updated Error");
		}
	}
	public int getNum() {
		return num;
	
	}
	public void setNum(int num) {
		this.num = num;
		if(itd.update(this)){
			System.out.println(TAG+"num setted and DB updated");
		}else{
			System.out.println(TAG+"DB updated Error");
		}
	}

	public double getPrice() {
		return price;
		
	}
	public void setPrice(double price) {
		this.price = price;
		if(itd.update(this)){
			System.out.println(TAG+"num setted and DB updated");
		}else{
			System.out.println(TAG+"DB updated Error");
		}
	}
	
	
}
