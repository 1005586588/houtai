package service;

import java.util.List;

import entity.Address;

public interface Address_service {

	public List<Address> select();
	
	public void insert(Address a);

	public void update(Address a);
	
	public void delete(int id);
	
	public Address getById(int id);
}
