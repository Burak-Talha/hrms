package com.example.hrms.core.utilities.results;

import java.util.List;

public class DataResult<T> extends Result {

	private T data;
	private List<T> dataList;

	public DataResult(List<T> dataList, boolean success) {
		super(success);
		this.dataList = dataList;
	}

	public DataResult(T data, boolean success, String message) {
		super(success, message);
		this.data = data;
	}
	
	public DataResult(T data, boolean success) {
		super(success);
		this.data = data;
	}
	
	public T getData() {
		return this.data;
	}

	
	
	

}
