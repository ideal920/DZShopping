package com.web.service;

import java.util.List;

import com.web.domain.Brand;

public interface BrandService {
	
	/*把查询结果放入list表中*/
	public List<Brand> findAllBrand();
	
	/*把要添加的数据放入list表中*/
	public List<Brand> addBrand(Brand brand);
	
	/*把要修改的数据放入list表中*/
	public List<Brand> updateBrand(Brand brand);
}
