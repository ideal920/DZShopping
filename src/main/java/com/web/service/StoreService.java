package com.web.service;

import java.util.List;

import com.web.domain.Store;

public interface StoreService {
	/*查询输入的店名是否存在*/
	public Boolean storeNameIsExists(String storeName);
	
	/*将具体信息插入数据库*/
	public void addStore(Store store);
	
	/*用户登陆验证*/
	public String isLogin(String storeName, String storePassword);
	
	/*查询登陆的店名*/
	public List<Store> findStoreByName(String storeName);

	/*收款*/
	public void updateMoney(int storeId, double addMoney);
}
