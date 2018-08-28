package service;

import java.util.List;

import entity.User;

public interface User_service {

	public List<User> select();
	
	public void insert(User t);

	public void update(User t);
	
	public void delete(int id);
	
	public User getById(int id);
}
