package com.entity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;




/**
 * Copyright (c) [2015] [@author sun jiayang a13813258259@163.com]
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
public class Cart {

	private int id;
	private double totalPrices;
	// Item and the number added in the cart
	private HashMap<Item, Integer> itemList;

	// TAG for Log
	// private static final String TAG = "com.entity.Cart";

	public Cart() {
		this.id = 0;
		this.totalPrices = 0.0;
		itemList = new HashMap<Item, Integer>();
	}

	/**
	 * update the total price
	 */
	private void updateTotalPrice() {
		double sum = 0;
		Set<Item> keys = itemList.keySet();
		// get iterator
		Iterator<Item> it = keys.iterator();
		while (it.hasNext()) {
			Item crIt = it.next();
			int crNum = itemList.get(crIt);
			sum =sum+ (crIt.getPrice()) * crNum;
		}
		this.setTotalPrices(sum);
	}

	/**
	 * add item to the itemList
	 * 
	 * @param item
	 * @return
	 */
	public boolean addItem(Item item, int num) {
		// if contain item, adding number of the item, else adding to the
		// itemList
		if (itemList.containsKey(item)) {
			itemList.put(item, itemList.get(item) + num);
		} else {
			itemList.put(item, num);
		}
		// update totalPrice
		this.updateTotalPrice();

		return true;

	}

	/**
	 * delete item from the itemList
	 * 
	 * @param item
	 * @return
	 */
	public boolean deleteItem(Item item, int num) {
		// if contain item, delete and return true. else return false.
		if (itemList.containsKey(item)) {
			int left = itemList.get(item) - num;
			if (left < 0) {
				itemList.put(item, 0);
				itemList.remove(item);
			} else {
				itemList.put(item, left);
			}
			// update totalPrice
			this.updateTotalPrice();

			return true;
		} else {
			// update totalPrice
			this.updateTotalPrice();
			return false;
		}

	}

	public boolean remove(Item item) {
		itemList.remove(item);
		// update totalPrice
		this.updateTotalPrice();
		return true;
	}

	@Override
	public String toString() {
		return "Cart id=" + id + ", totalPrices=" + totalPrices + ", item="
				+ itemList + "]";
	}

	// ********seter and getter********
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getTotalPrices() {
		return totalPrices;
	}

	public void setTotalPrices(double totalPrices) {
		this.totalPrices = totalPrices;
	}

	public HashMap<Item, Integer> getItemList() {
		return itemList;
	}

	public void setItemList(HashMap<Item, Integer> itemList) {
		this.itemList = itemList;
	}

	// ********** test zone*******************

	/*
	 * public static void main(String[] arg){ int i=0; //new Item(id, name, num,
	 * license, price) Item item1=new Item(i++, "item1", 1, 20.3); Item
	 * item2=new Item(i++, "item2", 3,  22.2); Item item3=new Item(i++,
	 * "item3", 2,  12.3); Cart myCart=new Cart(); myCart.addItem(item1, 2);
	 * myCart.addItem(item2, 1); myCart.addItem(item3, 5);
	 * System.out.println("***add****"); System.out.println(myCart.toString());
	 * myCart.deleteItem(item1, 2);
	 * System.out.println("***delete 2 * item 1****");
	 * System.out.println(myCart.toString());
	 * System.out.println("***delete 1 * item 1****");
	 * System.out.println(myCart.toString());
	 * System.out.println("***remove * item 1****");
	 * System.out.println(myCart.toString()); }
	 */

}
