package com.web.service.impl;

import com.opensymphony.xwork2.ActionContext;
import com.web.dao.OrderDao;
import com.web.domain.Order;
import com.web.domain.Store;
import com.web.domain.User;
import com.web.service.OrderService;
import com.web.service.StoreService;
import com.web.service.UserService;
import com.web.util.PageBean;

import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService {

	private OrderDao orderDao;
	private StoreService storeService;
	private UserService userService;

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public StoreService getStoreService() {
		return storeService;
	}

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	//添加订单
	public void addOrder(Order order) {
		orderDao.addOrder(order);
	}

	/*根据日期，查询所有网店订单，并分页*/
	public PageBean<Order> findStoreOrderByPage(String orderDate, int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		Map<String,Object> session= ActionContext.getContext().getSession();
		String storeName=(String)session.get("storeName");
		Store store= storeService.findStoreByName(storeName).get(0);

		String beginTime=orderDate+" 00:00:00";
		String endTime=orderDate+" 23:59:59";

		hqlCount="select count(p) from Order as p where p.orderDate>='"+beginTime
				+"' and p.orderDate<='"+endTime
				+"' and p.storeId="+store.getStoreId();
		hqlList="select p.orderId,p.product.productName,p.orderMoney,p.user.userRealName,"
				+"p.user.userPhone,p.user.userAddress,p.orderDate,p.orderStatus "
				+" from Order as p where p.orderDate>='"+beginTime
				+"' and p.orderDate<='"+endTime
				+"' and p.storeId="+store.getStoreId()
				+" order by p.orderId";
		PageBean<Order> pageBean=new PageBean<Order>();

		int totalCount= orderDao.findOrderCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Order> list= orderDao.findOrderByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);//设置总页数

		return pageBean;
	}

	/*修改订单状态*/
	public void updateStatus(int orderId, int status) {
		orderDao.updateStatus(orderId, status);
	}

	/*根据日期，查询所有网店订单，并分页*/
	public PageBean<Order> findUserOrderByPage(String orderDate, int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		Map<String,Object> session= ActionContext.getContext().getSession();
		String userName=(String)session.get("userName");
		User user= userService.findUserByName(userName).get(0);

		String beginTime=orderDate+" 00:00:00";
		String endTime=orderDate+" 23:59:59";

		hqlCount="select count(p) from Order as p where p.orderDate>='"+beginTime
				+"' and p.orderDate<='"+endTime
				+"' and p.user.userId="+user.getUserId();
		hqlList="select p.orderId,p.product.productName,p.orderMoney,p.orderDate,p.orderStatus "
				+" from Order as p where p.orderDate>='"+beginTime
				+"' and p.orderDate<='"+endTime
				+"' and p.user.userId="+user.getUserId()
				+" order by p.orderId";
		PageBean<Order> pageBean=new PageBean<Order>();

		int totalCount= orderDao.findOrderCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Order> list= orderDao.findOrderByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);//设置总页数

		return pageBean;
	}

	/*根据时间段统计单品销售情况*/
	public PageBean<Order> findProductSaleByPage(String beginDate, String endDate, int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		Map<String,Object> session= ActionContext.getContext().getSession();
		String storeName=(String)session.get("storeName");
		Store store= storeService.findStoreByName(storeName).get(0);

		String beginTime=beginDate+" 00:00:00";
		String endTime=endDate+" 23:59:59";

		hqlCount="select count(distinct p.product.productId) from Order as p where p.orderDate>='"+beginTime
				+"' and p.orderDate<='"+endTime
				+"' and p.storeId="+store.getStoreId();
		hqlList="select p.product.productName,p.product.productOldPrice,p.product.productNewPrice,"
				+"count(p),sum(orderMoney) "
				+" from Order as p where p.orderDate>='"+beginTime
				+"' and p.orderDate<='"+endTime
				+"' and p.storeId="+store.getStoreId()
				+" group by p.product.productId,p.product.productName,p.product.productOldPrice,p.product.productNewPrice " +
				"order by sum(p.orderMoney) desc,p.product.productId";
		PageBean<Order> pageBean=new PageBean<Order>();

		int totalCount= orderDao.findOrderCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Order> list= orderDao.findOrderByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);//设置总页数

		return pageBean;
	}

	/*查询网店订单*/
	public List findStoreSale(String beginDate, String endDate) {
		Map<String,Object> session=ActionContext.getContext().getSession();
		String storeName=(String)session.get("storeName");
		Store store= storeService.findStoreByName(storeName).get(0);

		List list= orderDao.findStoreSale(store.getStoreId(),beginDate,endDate);
		return list;
	}
}


