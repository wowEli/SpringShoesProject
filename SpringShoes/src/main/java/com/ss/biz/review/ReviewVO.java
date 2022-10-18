package com.ss.biz.review;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private int rpk; // pk
	private String content; // 후기내용
	private String writeday; // 작성일
	private String mid; // member pk
	private int sizepk; // sizepk를 fk로 사용 
	private int colorpk;	//새로 추가
	private MultipartFile uploadFile; // 리뷰 이미지 경로
	private String reviewImg; // 리뷰 이미지

	// 조인문에서 쓸 변수
	private int size;
	private String shoesName;

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

	public int getColorpk() {
		return colorpk;
	}

	public void setColorpk(int colorpk) {
		this.colorpk = colorpk;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getReviewImg() {
		return reviewImg;
	}

	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getShoesName() {
		return shoesName;
	}

	public void setShoesName(String shoesName) {
		this.shoesName = shoesName;
	}

	@Override
	public String toString() {
		return "ReviewVO [rpk=" + rpk + ", content=" + content + ", writeday=" + writeday + ", mid=" + mid + ", sizepk="
				+ sizepk + ", colorpk=" + colorpk + ", uploadFile=" + uploadFile + ", reviewImg=" + reviewImg
				+ ", size=" + size + ", shoesName=" + shoesName + "]";
	}

}