package com.ss.biz.review;

public class ReviewVO {
	private int rpk; //pk
	private String content; // 후기내용
	private String writeday; //작성일
	private String mid; //member pk
	private String colorpk; //shoescolor pk
	
	public int getRpk() {
		return rpk;
	}
	public void setRpk(int rpk) {
		this.rpk = rpk;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getColorpk() {
		return colorpk;
	}
	public void setColorpk(String colorpk) {
		this.colorpk = colorpk;
	}
	@Override
	public String toString() {
		return "ReviewVO [rpk=" + rpk + ", content=" + content + ", writeday=" + writeday + ", mid=" + mid
				+ ", colorpk=" + colorpk + "]";
	}
	
	
}
