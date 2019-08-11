package com.web.service;

import com.web.domain.Product;
import com.web.util.PageBean;

public interface ProductService {
	//添加商品
	public void addProduct(Product product);
	
	//查询商品，分页数
	public PageBean<Product> findProductByPage(String productName, int currentCount, int currentPage);
	
	//查询商品Id
	public Product findProductById(int productId);
	
	//修改商品
	public void updateProduct(Product product);

	//最新商品
	public PageBean<Product> findProductByDate(int currentCount, int currentPage);

	//差价最大商品
	public PageBean<Product> findProductByPrice(int currentCount, int currentPage);

	//热度高商品
	public PageBean<Product> findProductByHot(int currentCount, int currentPage);

	//查询该类商品
	public PageBean<Product> findProductByCategory(int categoryId, int currentCount, int currentPage);

	//查询该品牌商品
	public PageBean<Product> findProductByBrand(int brandId, int currentCount, int currentPage);

	//改动相关产品重复问题
	public PageBean<Product> findProductByXG(int productId, int categoryId, int currentCount, int currentPage);

	//搜索数据
	public PageBean<Product> findProductByLikeName(String productName, int currentCount, int currentPage);

	/*购买商品*/
	public String buyProduct(Product product);
}
