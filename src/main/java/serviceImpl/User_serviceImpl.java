package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.User_dao;
import entity.User;
import service.User_service;

@Service
public class User_serviceImpl implements User_service{

	@Autowired
	User_dao dao;
	
	public List<User> select() {
		return dao.select();
	}
	
public void insert(User t) {
		dao.insert(t);
	}

	public void update(User t) {
		dao.update(t);
	}

	public void delete(int id) {
		dao.delete(id);
	}

	public User getById(int id) {
		return dao.getById(id);
	}



	
}
