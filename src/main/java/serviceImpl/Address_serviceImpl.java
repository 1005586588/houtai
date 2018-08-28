package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Address_dao;
import entity.Address;
import service.Address_service;

@Service
public class Address_serviceImpl implements Address_service{

	@Autowired
	Address_dao dao;
	
	public List<Address> select() {
		return dao.select();
	}
	
public void insert(Address t) {
		dao.insert(t);
	}

	public void update(Address t) {
		dao.update(t);
	}

	public void delete(int id) {
		dao.delete(id);
	}

	public Address getById(int id) {
		return dao.getById(id);
	}



	
}
