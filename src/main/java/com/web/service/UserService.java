package com.web.service;

import com.web.domain.User;

import java.util.List;

public interface UserService {
	/*查询输入的店名是否存在*/
	public Boolean userNameIsExists(String userName);
	
	/*将具体信息插入数据库*/
	public void addUser(User user);
	
	/*用户登陆验证*/
	public String isLogin(String userName, String userPassword);
	
	/*查询登陆的店名*/
	public List<User> findUserByName(String userName);

	/*修改密码*/
	public String updatePassword(String userName, String oldPassword, String newPassword, String confirmPassword);

	/*向商家付款*/
	public void updateMoney(int userId, double subtractMoney);
	
}
