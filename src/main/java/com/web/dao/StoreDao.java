package com.web.dao;

import java.util.List;

import com.web.domain.Store;

public interface StoreDao {
	/*从数据库查询所有店名*/
	public List<Store> findStoreByName(String storeName);
	
	/*向数据库插入数据*/
	public void addStore(Store store);

	/*收款*/
	public void updateMoney(int storeId, double addMoney);
}
