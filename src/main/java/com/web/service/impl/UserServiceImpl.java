package com.web.service.impl;

import com.web.dao.UserDao;
import com.web.domain.User;
import com.web.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public Boolean userNameIsExists(String userName) {
		List<User> list= userDao.findUserByName(userName);
		if(list.size()>0) {
			return true;
		}else {
			return false;
		}
	}
	
	
	public void addUser(User user) {
		userDao.addUser(user);
	}	
	public String isLogin(String userName, String userPassword) {
		List<User> list= userDao.findUserByName(userName);
		String result="";
		if (list==null) {
			result="登陆异常，请联系服务商";
		} else if(list.size()>0){
			if(list.get(0).getUserPassword().equals(userPassword)){
				result="success";
			} else {
				result="密码错误,请重新输入!";
			}
		} else {
			result="会员名错误,请重新输入！";
		}
		return result;
	}
	
	public List<User> findUserByName(String userName) {
		return userDao.findUserByName(userName);
	}

	/*修改密码*/
	public String updatePassword(String userName, String oldPassword, String newPassword, String confirmPassword) {
		List<User> list= userDao.findUserByName(userName);
		String result="";

		if (list.get(0).getUserPassword().equals(oldPassword)){
			if(newPassword.equals(confirmPassword)){
				userDao.updatePassword(userName,newPassword);
				result="密码修改成功!";
			}else{
				result="密码不一致,请重新输入!";
			}
		}else{
			result="原密码错误!";
		}
		return result;
	}

	/*向商家付款*/
	public void updateMoney(int userId, double subtractMoney) {
		userDao.updateMoney(userId,subtractMoney);
	}
}
