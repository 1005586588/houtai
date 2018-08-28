package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Address;

@Repository
public interface Address_dao {
	

	@Select("select * from Address ")
	public List<Address> select();
	
	@Insert("insert into Address (name,parentid) values(#{name},#{parentid})")
	public void insert(Address a);

	@Update("update Address set name=#{name},parentid=#{parentid} where id=#{id}")
	public void update(Address a);
	
	@Delete("delete from Address where id=#{id}")
	public void delete(int id);
	
	@Select("select * from Address where id=#{id}")
	public Address getById(int id);

	
}