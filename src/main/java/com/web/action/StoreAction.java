package com.web.action;

import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.web.domain.Store;
import com.web.service.StoreService;

public class StoreAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Store store;
	private StoreService storeService;
	private Boolean result;
	
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	public StoreService getStoreService() {
		return storeService;
	}
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	public Boolean getResult() {
		return result;
	}
	public void setResult(Boolean result) {
		this.result = result;
	}
	
	public String isExists() {
		result= storeService.storeNameIsExists(store.getStoreName());
		return "isExistsSuccess";
	}
	
	public String add(){
		store.setStoreDate(new Date());
		store.setStoreMoney(0.0000);
		storeService.addStore(store);
		return "addSuccess";
	}
	
	public String login(){
		String result= storeService.isLogin(store.getStoreName(), store.getStorePassword());
		if (result.equals("success")) {
			Map<String, Object> map=ActionContext.getContext().getSession();
			map.put("storeName", store.getStoreName());
			return "loginSuccess";
		} else {
			addFieldError("error",result);
			return "loginError";
		}
	}
	
	public String logout() {
		Map<String, Object> map=ActionContext.getContext().getSession();
		map.remove("storeName");
		return "logoutSuccess";
	}
}
