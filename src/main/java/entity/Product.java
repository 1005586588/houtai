package entity;

public class Product {
	public static String[] productstatus = { "可用", "不可用" };

	int id;
	int type_id;
	int salecount;
	int collectcount;
	int priority;
	int status;
	double price;
	double nowprice;
	String fullname;
	String activity;
	String tip;
	String sale;
	String info;
	String pics;
	String comments;
	String tname;
	int parentid;
	String parent_name;
	String name ;
	
	public String[] getPiclist() {
		if(pics.length()<5)return new String[0];
		return pics.split(",");
	}
	public String getPic() {
		if(pics.length()<5)return null;
		String [] pic=pics.split(",");
		
		if(pic.length>0)
		return pic[0];
		else return null;
	}
	
	
	
	
	
	
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProa() {
		return productstatus[status];
	}
	
	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public int getSalecount() {
		return salecount;
	}

	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}

	public int getCollectcount() {
		return collectcount;
	}

	public void setCollectcount(int collectcount) {
		this.collectcount = collectcount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getNowprice() {
		return nowprice;
	}

	public void setNowprice(double nowprice) {
		this.nowprice = nowprice;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getSale() {
		return sale;
	}

	public void setSale(String sale) {
		this.sale = sale;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info.replace("\"", "\'");
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

}
