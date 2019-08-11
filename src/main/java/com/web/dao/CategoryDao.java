package com.web.dao;

import java.util.List;

import com.web.domain.Category;

public interface CategoryDao {
	/*查询商品种类和选择热度*/
	public List<Category> findAllCategory();
	
	/*添加商品种类和选择热度*/
	public void addCategory(Category category);
	
	/*修改商品种类和热度*/
	public void updateCategory(Category category);
}
