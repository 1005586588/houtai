package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Orders_dao;
import entity.Orders;
import service.Orders_service;
import util.SearchInfo;

@Service
public class Orders_serviceImpl implements Orders_service{

	@Autowired
	Orders_dao dao;

	public List<Orders> select(SearchInfo info) {
		return dao.select(info);
	}

	public void delete(int id) {
		dao.delete(id);
		
	}

	public Orders getById(int id) {
		return dao.getById(id);
	}

	public void updatestatus(Orders o) {
		dao.updatestatus(o);
	}
	


	
}
