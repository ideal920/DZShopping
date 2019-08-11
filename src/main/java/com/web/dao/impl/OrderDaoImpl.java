package com.web.dao.impl;

import com.web.dao.OrderDao;
import com.web.domain.Order;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

	/*添加订单*/
	public void addOrder(Order order) {
		this.getHibernateTemplate().save(order);
	}

	/*查询订单条数*/
	public int findOrderCount(String hql) {
		int count=Integer.parseInt(this.getHibernateTemplate().find(hql).get(0).toString());
		return count;
	}

	/*查询订单信息，并分页*/
	public List<Order> findOrderByPage(String hql, int currentCount, int currentPage) {
		SessionFactory sessionFactory=this.getHibernateTemplate().getSessionFactory();
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery(hql);
		query.setFirstResult((currentPage-1)*currentCount);
		query.setMaxResults(currentCount);
		List<Order> list=query.list();
		return list;
	}

	/*修改订单状态*/
	public void updateStatus(int orderId,int status) {
		/*根据orderId获取订单对象*/
		Order order=this.getHibernateTemplate().get(Order.class,orderId);
		/*修改订单对象的状态*/
		order.setOrderStatus(status);
		/*保存至数据库*/
		this.getHibernateTemplate().save(order);
	}

	/*查询网店订单*/
	public List findStoreSale(int storeId, String beginDate, String endDate) {
		String beginTime=beginDate+" 00:00:00";
		String endTime=endDate+" 23:59:59";
		String hql="select day(p.orderDate),sum(p.orderMoney) from Order as p where p.orderDate>='"+beginTime
				+"' and p.orderDate<='"+endTime+"' and p.storeId="+storeId
				+" group by day(p.orderDate) order by day(p.orderDate)";
		List list=this.getHibernateTemplate().find(hql);
		return list;
	}
}
