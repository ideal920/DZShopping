package com.web.action;

import java.util.List;

import com.web.domain.Category;
import com.web.service.CategoryService;

public class CategoryAction {
	private CategoryService categoryServiceInter;
	private List<Category> list;
	private Category category;

	public CategoryService getCategoryServiceInter() {
		return categoryServiceInter;
	}
	public void setCategoryServiceInter(CategoryService categoryServiceInter) {
		this.categoryServiceInter = categoryServiceInter;
	}
	public List<Category> getList() {
		return list;
	}
	public void setList(List<Category> list) {
		this.list = list;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	
	public String findAll(){
		list= categoryServiceInter.findAllCategory();
		return "findAllSuccess"; 
	}
	public String add() {
		list= categoryServiceInter.addCategory(category);
		return "addSuccess";
	}
	public String update() {
		list= categoryServiceInter.updateCategory(category);
		return "updateSuccess";
	}
	
}
