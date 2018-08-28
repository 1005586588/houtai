package serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Orders_status_dao;
import entity.Orders_status;
import service.Orders_status_service;

@Service
public class Orders_status_serviceImpl implements Orders_status_service{

	@Autowired
	Orders_status_dao dao;

	public void insert(Orders_status o) {
		dao.insert(o);
	}

}
