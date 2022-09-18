package com.example.hrms.core.utilities.results.DataResults;


public class ErrorDataResults extends DataResults {

    public ErrorDataResults() {
        super(false);
    }

    public ErrorDataResults(String message) {
        super(false, message);
    }
}
