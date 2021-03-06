package com.xwj.entity;

import java.io.Serializable;
/**
 * 用户实体类
 * @author Administrator
 *
 */
public class User  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2191696781409941829L;
	private Integer id;
	private String username;
	private String password;
	
	private Dept dept;
	private String realName;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", dept=" + dept + ", realName="
				+ realName + "]";
	}
	
	
	
}
