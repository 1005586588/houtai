package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.User;
import util.SearchInfo;

@Repository
public interface User_dao {
	
	@Select("select * from user ")
	public List<User> select();
	
	@Insert("insert into user (name,parentid) values(#{name},#{parentid})")
	public void insert(User t);

	@Update("update user set name=#{name},parentid=#{parentid} where id=#{id}")
	public void update(User t);
	
	@Delete("delete from user where id=#{id}")
	public void delete(int id);
	
	@Select("select * from user where id=#{id}")
	public User getById(int id);

	
}