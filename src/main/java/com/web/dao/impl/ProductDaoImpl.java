package com.web.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.web.dao.ProductDao;
import com.web.domain.Product;

@SuppressWarnings("deprecation")
public class ProductDaoImpl extends HibernateDaoSupport implements ProductDao {

	public void addProduct(Product product) {

		this.getHibernateTemplate().save(product);
	}

	
	public int findProductCount(String hql) {

		int count=Integer.parseInt(this.getHibernateTemplate().find(hql).get(0).toString());
		return count;
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Product> findProductByPage(String hql, int currentCount, int currentPage) {

		SessionFactory sessionFactory=this.getHibernateTemplate().getSessionFactory();
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery(hql);
		query.setFirstResult((currentPage-1)*currentCount);
		query.setMaxResults(currentCount);
		List<Product> list=query.list();
		return list;
	}

	
	public Product findProductById(int productId) {

		return this.getHibernateTemplate().get(Product.class, productId);
	}

	
	public void updateProduct(Product product) {

		this.getHibernateTemplate().update(product);
	}
}
