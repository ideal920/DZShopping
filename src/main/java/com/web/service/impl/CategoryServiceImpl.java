package com.web.service.impl;

import java.util.List;

import com.web.dao.CategoryDao;
import com.web.domain.Category;
import com.web.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	private CategoryDao categoryDao;
	
	public CategoryDao getCategoryDao() {
		return categoryDao;
	}
	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	
	
	public List<Category> findAllCategory() {
		return categoryDao.findAllCategory();
	}
	
	public List<Category> addCategory(Category category) {

		categoryDao.addCategory(category);
		return categoryDao.findAllCategory();
	}
	
	public List<Category> updateCategory(Category category) {

		categoryDao.updateCategory(category);
		return categoryDao.findAllCategory();
	}
	

}
