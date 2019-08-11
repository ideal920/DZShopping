package com.web.service.impl;

import java.util.List;

import com.web.dao.StoreDao;
import com.web.domain.Store;
import com.web.service.StoreService;

public class StoreServiceImpl implements StoreService {

	private StoreDao storeDao;

	public StoreDao getStoreDao() {
		return storeDao;
	}

	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
	}

	public Boolean storeNameIsExists(String storeName) {
		List<Store> list = storeDao.findStoreByName(storeName);
		if (list.size() > 0) {
			return true;
		} else {
			return false;
		}
	}


	public void addStore(Store store) {
		storeDao.addStore(store);
	}

	public String isLogin(String storeName, String storePassword) {
		List<Store> list = storeDao.findStoreByName(storeName);
		String result = "";
		if (list == null) {
			result = "登陆异常，请联系服务商";
		} else if (list.size() > 0) {
			if (list.get(0).getStorePassword().equals(storePassword)) {
				result = "success";
			} else {
				result = "密码错误";
			}
		} else {
			result = "网店名称错误,请重新输入！";
		}
		return result;
	}

	public List<Store> findStoreByName(String storeName) {
		return storeDao.findStoreByName(storeName);
	}

	public void updateMoney(int storeId, double addMoney) {
		storeDao.updateMoney(storeId,addMoney);
	}
}
