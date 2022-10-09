package com.ss.biz.review;

public class ReviewVO {
	private int rpk; //pk
	private String content; // 후기내용
	private String writeday; //작성일
	private String mid; //member pk
	private int sizepk; // sizepk를 fk로 사용
	private String reviewImg; // 후기 리뷰 이미지
	
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
	public int getSizepk() {
		return sizepk;
	}
	public void setSizepk(int sizepk) {
		this.sizepk = sizepk;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	@Override
	public String toString() {
		return "ReviewVO [rpk=" + rpk + ", content=" + content + ", writeday=" + writeday + ", mid=" + mid + ", sizepk="
				+ sizepk + ", reviewImg=" + reviewImg + "]";
	}
	
}