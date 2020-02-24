package com.scitmasterA4.restApiTest;

public class User {

	int userno;
	String id;
	String password;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(int userno, String id, String password) {
		super();
		this.userno = userno;
		this.id = id;
		this.password = password;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [userno=" + userno + ", id=" + id + ", password=" + password + "]";
	}
	
	
}
