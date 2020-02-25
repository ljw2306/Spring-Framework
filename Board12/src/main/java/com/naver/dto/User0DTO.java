package com.naver.dto;

import java.io.Serializable;

public class User0DTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private int point;
	
	public User0DTO() {
		// TODO Auto-generated constructor stub
	}

	public User0DTO(String id, int point) {
		super();
		this.id = id;
		this.point = point;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
}
