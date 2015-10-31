package test;


import java.util.ArrayList;

import com.dao.ItemDao;
import com.dao.OrderDao;
import com.dao.StoreDao;
import com.dao.UserDao;
import com.entity.Item;
import com.entity.Order;
import com.entity.Store;
import com.entity.User;

public class Test {
	private static final String TAG="unitTest:  ";
	private static final String TG_SELLER="TEST_SELLER";
	
	public static void main(String[] args) {
		
		//userTest();
		//testItem();
		//storeTest();
		//orderDaoTest();
		
	}
	
	
	private static void userTest(){
		//User user=new User();
		UserDao ud=new UserDao();
		User user=ud.getUserById(14);
		user.setUserName("userTest2");
		user.setPassword("sun7261030");
		user.setAccount(7200.9);	
		user.setLocation("Nanjing");				
	}
	
	private static void itemTest(){
		//Item item=new Item();
		ItemDao itd=new ItemDao();
		Item item=itd.getItemById(6);
		item.setName("itemTest1");
		item.setNum(999);
		item.setPrice(198.2);
		//item.createNewItem();
	}
	
	private static void storeTest(){
		//Store store=new Store();
		StoreDao sd=new StoreDao();
		Store store=sd.getStoreById(14);
		store.setName("storeTest");
		ItemDao itd=new ItemDao();
		Item item=itd.getItemById(6);
		store.addItem(item);
		store.setSellerId(2);
		//store.createNewStore();
	}
	private static void orderDaoTest(){
		OrderDao orderDao=new OrderDao();
		Order order=new Order(5, 2, 1, 1, 9);
		//orderDao.addOrder(order);
		//orderDao.deleteOrderById(4);
		//ArrayList<Order> orders;
		//orders=orderDao.getOrdersByUserId(2);
		//System.out.println(TAG+orders.toString());
		
		orderDao.update(order);
	}
}
