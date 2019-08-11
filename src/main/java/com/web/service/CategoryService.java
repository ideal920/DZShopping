package com.web.service;

import java.util.List;

import com.web.domain.Category;

public interface CategoryService {
	
	/*把查询结果放入list表中*/
	public List<Category> findAllCategory();
	
	/*把要添加的数据放入list表中*/
	public List<Category> addCategory(Category category);
	
	/*把要修改的数据放入list表中*/
	public List<Category> updateCategory(Category category);
}
