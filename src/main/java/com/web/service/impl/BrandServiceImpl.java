package com.web.service.impl;

import java.util.List;

import com.web.dao.BrandDao;
import com.web.domain.Brand;
import com.web.service.BrandService;

public class BrandServiceImpl implements BrandService {

	private BrandDao brandDao;
	
	public BrandDao getBrandDao() {
		return brandDao;
	}
	public void setBrandDao(BrandDao brandDao) {
		this.brandDao = brandDao;
	}
	
	
	public List<Brand> findAllBrand() {
		return brandDao.findAllBrand();
	}
	
	public List<Brand> addBrand(Brand brand) {

		brandDao.addBrand(brand);
		return brandDao.findAllBrand();
	}
	
	public List<Brand> updateBrand(Brand brand) {

		brandDao.updateBrand(brand);
		return brandDao.findAllBrand();
	}
	

}
