package com.qihn.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * 分页工具类
 * @author qihn
 *
 */
public class PageInfo {
	// 每页数量
	private int pageSize = 20;
	// 总记录数
	private long totalCount;
	// 总页数
	private long pageCount;
	// 当前页 默认 1
	private long curPage = 1;
	// 下一页
	private long nextPage;
	// 上一页
	private long prePage;
	// hibernate query 设置参数，开始查询位置
	private int firstResult;
	// 查询条件 query语句
	private String hql;

	private Log log = LogFactory.getLog(PageInfo.class);

	public PageInfo() {

	}

	public long getPageCount() {
		if(pageSize==0){
			pageSize=15;
		}
		if (this.totalCount % this.pageSize == 0) {
			pageCount = this.totalCount / this.pageSize;
		} else {
			pageCount = (this.totalCount - 1) / this.pageSize + 1;
		}
		if(pageCount<1)pageCount =1;
		return pageCount;
	}

	public long getNextPage() {
		if (nextPage > this.pageCount)
			return this.pageCount;
		else
			return nextPage;
	}

	public long getPrePage() {
		if (prePage < 1)
			return 1;
		else
			return prePage;
	}

	public int getFirstResult() {
		return new Long((this.getCurPage() - 1) * this.getPageSize()).intValue();
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setFirstResult(int firstResult) {
		this.firstResult = firstResult;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public long getCurPage() {
		return curPage;
	}

	public void setCurPage(long curPage) {
		//if(curPage<1)curPage = 1;
		this.curPage = curPage;
	}

	public Log getLog() {
		return log;
	}

	public void setLog(Log log) {
		this.log = log;
	}

	public void setPageCount(long pageCount) {
		this.pageCount = pageCount;
	}

	public void setNextPage(long nextPage) {
		this.nextPage = nextPage;
	}

	public void setPrePage(long prePage) {
		this.prePage = prePage;
	}

	public String getHql() {
		return hql;
	}

	public void setHql(String hql) {
		this.hql = hql;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "pageSize: " + pageSize + " totalCount: " + totalCount + " curPage: " + curPage + " nextPage: " + nextPage + " prePage: " + prePage;
	}

}
