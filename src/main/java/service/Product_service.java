package service;

import java.util.List;

import entity.Product;
import entity.Type;
import util.SearchInfo;

public interface Product_service {
	
	public List<Product> select(SearchInfo info);
	
	public void insert(Product p);

	public void update(Product p);
	
	public void updatestatus(Product p);
	
	public void delete(int id);
	
	public Product getById(int id);
	
	
	
	
}
