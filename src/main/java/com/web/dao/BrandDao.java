package com.web.dao;

import java.util.List;

import com.web.domain.Brand;

public interface BrandDao {
	/*查询商品种类和选择热度*/
	public List<Brand> findAllBrand();
	
	/*添加商品种类和选择热度*/
	public void addBrand(Brand brand);
	
	/*修改商品种类和热度*/
	public void updateBrand(Brand brand);
}
