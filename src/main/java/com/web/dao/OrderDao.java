package com.web.dao;

import com.web.domain.Order;

import java.util.List;

public interface OrderDao {
	
	/*添加订单*/
	public void addOrder(Order order);

	/*查询订单条数*/
	public int findOrderCount(String hql);

	/*查询订单信息，并分页*/
	public List<Order> findOrderByPage(String hql, int currentCount, int currentPage);

	/*修改订单状态*/
	public void updateStatus(int orderId, int status);

	/*查询网店订单*/
	public List findStoreSale(int storeId, String beginDate, String endDate);
}
