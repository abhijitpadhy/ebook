package com.DAO;

import com.entity.User;

public interface UserDAO {

	
	public boolean userRegistre(User us);
	
	public User getLogin(String em, String pwd);
	
	public boolean checkPassword(int id, String ps);
	
	public boolean updateProfile(User us);
	
	public boolean checkUser(String em);
}
