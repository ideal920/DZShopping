package com.web.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Integer productId;
	private Category category;
	private Store store;
	private Brand brand;
	private String productName;
	private Double productOldPrice;
	private Double productNewPrice;
	private String productImg;
	private Integer productStatus;
	private String productRemark;
	private Date createDate;
	private Set orders = new HashSet(0);

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** full constructor */
	public Product(Category category, Store store, Brand brand,
			String productName, Double productOldPrice, Double productNewPrice,
			String productImg, Integer productStatus, String productRemark,
			Date createDate, Set orders) {
		this.category = category;
		this.store = store;
		this.brand = brand;
		this.productName = productName;
		this.productOldPrice = productOldPrice;
		this.productNewPrice = productNewPrice;
		this.productImg = productImg;
		this.productStatus = productStatus;
		this.productRemark = productRemark;
		this.createDate = createDate;
		this.orders = orders;
	}

	// Property accessors

	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Store getStore() {
		return this.store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public Brand getBrand() {
		return this.brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getProductOldPrice() {
		return this.productOldPrice;
	}

	public void setProductOldPrice(Double productOldPrice) {
		this.productOldPrice = productOldPrice;
	}

	public Double getProductNewPrice() {
		return this.productNewPrice;
	}

	public void setProductNewPrice(Double productNewPrice) {
		this.productNewPrice = productNewPrice;
	}

	public String getProductImg() {
		return this.productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public Integer getProductStatus() {
		return this.productStatus;
	}

	public void setProductStatus(Integer productStatus) {
		this.productStatus = productStatus;
	}

	public String getProductRemark() {
		return this.productRemark;
	}

	public void setProductRemark(String productRemark) {
		this.productRemark = productRemark;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

}