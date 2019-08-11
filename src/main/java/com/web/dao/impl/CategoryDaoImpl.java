package com.web.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.web.dao.CategoryDao;
import com.web.domain.Category;

public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao {

	
	public List<Category> findAllCategory() {
		String hql="select c.categoryId,c.categoryName,c.categoryHot from Category as c";
		 @SuppressWarnings("unchecked")
		List<Category> list=(List<Category>)this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public void addCategory(Category category) {

		this.getHibernateTemplate().save(category);
	}

	@Override
	public void updateCategory(Category category) {

		this.getHibernateTemplate().update(category);
	}

}
