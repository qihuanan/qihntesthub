package com.qihn.controller;

/**
 * Created by qihuanan on 2017/5/23.
 */
public abstract class BaseController {

    protected DynamicAsyncContext asyncContext;

    public DynamicAsyncContext getAsyncContext() {
        return asyncContext;
    }

    public void setAsyncContext(DynamicAsyncContext asyncContext) {
        this.asyncContext = asyncContext;
    }
}
