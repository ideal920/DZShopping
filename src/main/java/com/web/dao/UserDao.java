package com.web.dao;

import com.web.domain.User;

import java.util.List;

public interface UserDao {
	/*从数据库查询所有店名*/
	public List<User> findUserByName(String userName);
	
	/*向数据库插入数据*/
	public void addUser(User user);

	/*修改密码*/
	public void updatePassword(String userName, String newPassword);

	/*向商家付款*/
	public void updateMoney(int userId, double subtractMoney);
}
