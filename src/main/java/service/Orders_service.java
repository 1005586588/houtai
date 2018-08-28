package service;

import java.util.List;

import entity.Orders;
import util.SearchInfo;

public interface Orders_service {
	
	public List<Orders> select(SearchInfo info);
	
	public void delete(int id);
	
	public Orders getById(int id);
	
	public void updatestatus(Orders o);
}
