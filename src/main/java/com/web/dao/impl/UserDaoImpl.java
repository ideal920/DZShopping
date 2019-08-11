package com.web.dao.impl;

import com.web.dao.UserDao;
import com.web.domain.User;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	
	@SuppressWarnings("unchecked")
	public List<User> findUserByName(String userName) {
		String hql="from User as u where u.userName=:userName";
		List<User> list=(List<User>)this.getHibernateTemplate().findByNamedParam(hql, "userName", userName);
		return list;
	}

	/*添加会员*/
	public void addUser(User user) {
		this.getHibernateTemplate().save(user);
	}

	/*修改密码*/
	public void updatePassword(String userName, String newPassword) {
		//根据用户名获取要修改的用户对象
		List<User> list=findUserByName(userName);
		//从集合中获取第一个User对象
		User user=list.get(0);
		//将新密码设置到user
		user.setUserPassword(newPassword);
		//保存user对象
		this.getHibernateTemplate().save(user);
	}

	/*向商家付款*/
	public void updateMoney(int userId, double subtractMoney) {
		User user=this.getHibernateTemplate().get(User.class,userId);
		user.setUserMoney(user.getUserMoney()-subtractMoney);
		this.getHibernateTemplate().save(user);
	}
}
