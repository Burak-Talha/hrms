package com.example.hrms.core.utilities.results;

import com.example.hrms.entities.concretes.Employee;

import java.util.List;

public class SuccessDataResult<T> extends DataResult<T> {

	public SuccessDataResult(List<T> data, boolean success) {
		super(data,true);
	}

	public SuccessDataResult(T data, boolean success) {
		super(data,true);
	}

	public SuccessDataResult(T data, boolean success, String message) {
		super(data,true, message);
	}

	public SuccessDataResult() {
		super((List<T>) null, true);
	}

}
