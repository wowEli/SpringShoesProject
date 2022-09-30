package com.ss.biz.shoes;

public class ShoesColorVO {
	private int colorpk; //pk
	private int samplepk; // shoessample pk
	private String color; //신발 색상(필터검색)
	private String shoesImg; //신발 이미지
	
//	 JAVA에서만 쓸 변수
//	private int size220;   220 ~280 총 7개
//	private int size230;
//	private int size240;
//	private int size250;
//	private int size260;
//	private int size270;
//	private int size280;
//	private String filterColor; //  필터 검색 신발 색상
//	private String filterBrand; // 필터 검색 신발 브랜드
//	private int filterLowPrice; // 필터 검색 낮은 가격 순
//	private int filterHighPrice; // 필터 검색 높은 가격 순
	
//	private String searchContent; // 이름 검색에 이용

	public int getColorpk() {
		return colorpk;
	}

	public void setColorpk(int colorpk) {
		this.colorpk = colorpk;
	}

	public int getSamplepk() {
		return samplepk;
	}

	public void setSamplepk(int samplepk) {
		this.samplepk = samplepk;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getShoesImg() {
		return shoesImg;
	}

	public void setShoesImg(String shoesImg) {
		this.shoesImg = shoesImg;
	}

	@Override
	public String toString() {
		return "ShoesColorVO [colorpk=" + colorpk + ", samplepk=" + samplepk + ", color=" + color + ", shoesImg="
				+ shoesImg + "]";
	}

	



	

}
