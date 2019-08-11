package com.web.dao;

import java.util.List;

import com.web.domain.Product;

public interface ProductDao {
	//添加商品
	public void addProduct(Product product);
	
	//查询商品列表
	public int findProductCount(String hql);
	
	//查询商品，分页数
	public List<Product> findProductByPage(String hql, int currentCount, int currentPage);
	
	//查询商品id
	public Product findProductById(int productId);
	
	//修改商品
	public void updateProduct(Product product);
}
