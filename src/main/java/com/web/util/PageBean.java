package com.web.util;

import java.util.ArrayList;
import java.util.List;

	public class PageBean<T> {

	    //当前页
	    private int currentPage;
	    //总页数
	    private int totalPage;
	    //当前数量
	    private int currentCount;
	    //总数量
	    private int totalCount;
	   
	    private List<T> productList = new ArrayList<T>();

	    public int getCurrentPage() {
			return currentPage;
		}
		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}
		public int getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}
		public int getCurrentCount() {
			return currentCount;
		}
		public void setCurrentCount(int currentCount) {
			this.currentCount = currentCount;
		}
		public int getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
		public List<T> getProductList() {
	        return productList;
	    }
	    public void setProductList(List<T> productList) {
	        this.productList = productList;
	    }

	    @Override
	    public String toString() {
	        return "PageBean [currentPage=" + currentPage + ", currentCount=" + currentCount + ", totalCount=" + totalCount
	                + ", totalPage=" + totalPage + ", productList=" + productList + "]";
	    }

	}

