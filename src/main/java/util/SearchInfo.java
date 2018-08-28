package util;

public class SearchInfo {
	int max=10;
	Integer pageno=1;
	

	public SearchInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SearchInfo(String where,boolean canpage) {
		this.where=where;
		setCanPage(canpage);
	}
	
	
	
	
	
	
	public Integer getPageno() {
		return pageno;
	}public Integer getNext() {
		return pageno+1;
	}public Integer getPrev() {
		return pageno>1?pageno-1:1;
	}
	public void setPageno(Integer pageno) {
		
		if(pageno==null||pageno<1)pageno=1;
		
		this.pageno = pageno;
		limit = " limit " + (pageno - 1) * max + "," + max;
	}
	
	public void setCanPage(boolean iscan) {
		if(!iscan) limit="";
	}

	String where="";
	String limit=" limit " + (pageno - 1) * max + "," + max;

	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	
}
