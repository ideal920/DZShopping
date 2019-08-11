package com.web.service;

import com.web.domain.Order;
import com.web.util.PageBean;

import java.util.List;

public interface OrderService {

	/*添加订单*/
	public void addOrder(Order order);

	/*根据日期，查询所有网店订单，并分页*/
	public PageBean<Order> findStoreOrderByPage(String orderDate, int currentCount, int currentPage);

	/*修改订单状态*/
	public void updateStatus(int orderId, int status);

	/*根据日期，查询所有会员订单，并分页*/
	public PageBean<Order> findUserOrderByPage(String orderDate, int currentCount, int currentPage);

	/*根据时间段统计单品销售情况*/
	public PageBean<Order> findProductSaleByPage(String beginDate, String endDate, int currentCount, int currentPage);

	/*查询网店订单*/
	public List findStoreSale(String beginDate, String endDate);
}
