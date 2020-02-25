package com.naver.dto;

import java.util.List;

public class PageTO {
	private int curPage = 1;
	private int amount;
	private int perPage = 10;
	private int totalPage;
	private int startNum;
	private int endNum;
	private int pageLine = 10;
	private int beginPageNum;
	private int stopPageNum;
	
	private List<BoardVO> list;
	
	public PageTO() {
		process();
	}
	

	public PageTO(int curPage, int amount, int perPage, int totalPage, int startNum, int endNum, int pageLine,
			int beginPageNum, int stopPageNum, List<BoardVO> list) {
		super();
		this.curPage = curPage;
		this.amount = amount;
		this.perPage = perPage;
		this.totalPage = totalPage;
		this.startNum = startNum;
		this.endNum = endNum;
		this.pageLine = pageLine;
		this.beginPageNum = beginPageNum;
		this.stopPageNum = stopPageNum;
		this.list = list;
	}

	public int getCurPage() {
		return curPage;
	}



	public void setCurPage(int curPage) {
		this.curPage = curPage;
		process();
	}



	public int getAmount() {
		return amount;
	}



	public void setAmount(int amount) {
		this.amount = amount;
		process();
	}



	public int getPerPage() {
		return perPage;
	}



	public void setPerPage(int perPage) {
		this.perPage = perPage;
		process();
	}



	public int getTotalPage() {
		return totalPage;
	}



	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}



	public int getStartNum() {
		return startNum;
	}



	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}



	public int getEndNum() {
		return endNum;
	}



	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}



	public int getPageLine() {
		return pageLine;
	}



	public void setPageLine(int pageLine) {
		this.pageLine = pageLine;
		process();
	}



	public int getBeginPageNum() {
		return beginPageNum;
	}



	public void setBeginPageNum(int beginPageNum) {
		this.beginPageNum = beginPageNum;
	}



	public int getStopPageNum() {
		return stopPageNum;
	}



	public void setStopPageNum(int stopPageNum) {
		this.stopPageNum = stopPageNum;
	}
	
	
	
	

	public List<BoardVO> getList() {
		return list;
	}


	public void setList(List<BoardVO> list) {
		this.list = list;
	}


	private void process() {
		totalPage = (amount-1)/perPage + 1;
		startNum = (curPage-1)*perPage + 1;
		endNum = startNum + (perPage-1);
		if (endNum > amount) {
			endNum = amount;
		}
		beginPageNum = ((curPage-1)/pageLine)*(pageLine + 1)+1;
		stopPageNum = beginPageNum + (pageLine - 1);
		if (stopPageNum > totalPage) {
			stopPageNum = totalPage;
		}
	}
}
