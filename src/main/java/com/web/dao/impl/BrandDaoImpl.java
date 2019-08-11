package com.web.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.web.dao.BrandDao;
import com.web.domain.Brand;

public class BrandDaoImpl extends HibernateDaoSupport implements BrandDao {

	
	public List<Brand> findAllBrand() {
		 @SuppressWarnings("unchecked")
		List<Brand> list=(List<Brand>)this.getHibernateTemplate().find("from Brand");
		return list;
	}

	@Override
	public void addBrand(Brand brand) {

		this.getHibernateTemplate().save(brand);
	}

	@Override
	public void updateBrand(Brand brand) {

		this.getHibernateTemplate().update(brand);
	}

}
