package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Type;
import util.SearchInfo;

@Repository
public interface Type_dao {
	
	@Select("select type.*,t.name parent_name from type left join type t on type.parentid=t.id ${where} ${limit} ")
	public List<Type> select(SearchInfo info);
	
	@Select("select * from type ")
	public List<Type> select2();
	
	@Insert("insert into type (name,parentid) values(#{name},#{parentid})")
	public void insert(Type t);

	@Update("update type set name=#{name} where id=#{id}")
	public void update(Type t);
	
	@Delete("delete from type where id=#{id}")
	public void delete(int id);
	
	@Select("select * from type where id=#{id}")
	public Type getById(int id);

	
}