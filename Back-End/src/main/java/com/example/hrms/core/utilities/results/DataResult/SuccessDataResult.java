package com.example.hrms.core.utilities.results.DataResult;

public class SuccessDataResult<T> extends DataResult {

	public SuccessDataResult(T dataList) {
		super(dataList,true);
	}

	public SuccessDataResult(T dataList, String message) {
		super(dataList,true, message);
	}

}
