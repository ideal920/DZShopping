package com.web.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Store entity. @author MyEclipse Persistence Tools
 */

public class Store implements java.io.Serializable {

	// Fields

	private Integer storeId;
	private String storeName;
	private String storePassword;
	private String storePhone;
	private String storeEmail;
	private String storeCard;
	private String storeRemark;
	private Date storeDate;
	private Double storeMoney;
	private Set products = new HashSet(0);

	// Constructors

	/** default constructor */
	public Store() {
	}

	/** full constructor */
	public Store(String storeName, String storePassword, String storePhone,
			String storeEmail, String storeCard, String storeRemark,
			Date storeDate, Double storeMoney, Set products) {
		this.storeName = storeName;
		this.storePassword = storePassword;
		this.storePhone = storePhone;
		this.storeEmail = storeEmail;
		this.storeCard = storeCard;
		this.storeRemark = storeRemark;
		this.storeDate = storeDate;
		this.storeMoney = storeMoney;
		this.products = products;
	}

	// Property accessors

	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public String getStoreName() {
		return this.storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStorePassword() {
		return this.storePassword;
	}

	public void setStorePassword(String storePassword) {
		this.storePassword = storePassword;
	}

	public String getStorePhone() {
		return this.storePhone;
	}

	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	public String getStoreEmail() {
		return this.storeEmail;
	}

	public void setStoreEmail(String storeEmail) {
		this.storeEmail = storeEmail;
	}

	public String getStoreCard() {
		return this.storeCard;
	}

	public void setStoreCard(String storeCard) {
		this.storeCard = storeCard;
	}

	public String getStoreRemark() {
		return this.storeRemark;
	}

	public void setStoreRemark(String storeRemark) {
		this.storeRemark = storeRemark;
	}

	public Date getStoreDate() {
		return this.storeDate;
	}

	public void setStoreDate(Date storeDate) {
		this.storeDate = storeDate;
	}

	public Double getStoreMoney() {
		return this.storeMoney;
	}

	public void setStoreMoney(Double storeMoney) {
		this.storeMoney = storeMoney;
	}

	public Set getProducts() {
		return this.products;
	}

	public void setProducts(Set products) {
		this.products = products;
	}

}