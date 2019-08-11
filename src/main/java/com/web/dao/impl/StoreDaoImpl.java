package com.web.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.web.dao.StoreDao;
import com.web.domain.Store;

public class StoreDaoImpl extends HibernateDaoSupport implements StoreDao {

	
	public List<Store> findStoreByName(String storeName) {	
		String hql="from Store as s where s.storeName=:storeName";
		@SuppressWarnings("unchecked")
		List<Store> list=(List<Store>) this.getHibernateTemplate().findByNamedParam(hql, "storeName", storeName);
		return list;
	}

	public void addStore(Store store) {
		this.getHibernateTemplate().save(store);
	}

	/*收款*/
	public void updateMoney(int storeId, double addMoney) {
		Store store=getHibernateTemplate().get(Store.class,storeId);
		store.setStoreMoney(store.getStoreMoney()+addMoney);
		this.getHibernateTemplate().save(store);
	}
}
