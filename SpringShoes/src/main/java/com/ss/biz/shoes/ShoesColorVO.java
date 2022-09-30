package com.ss.biz.shoes;

public class ShoesColorVO {
	private int colorpk; //pk
	private int samplepk; // shoessample pk
	private String color; //신발 색상(필터검색)
	private String shoesImg; //신발 이미지
	
	// JAVA에서만 쓸 변수
	private int size220; //  220 ~ 280 총 7개
	private int size230;
	private int size240;
	private int size250;
	private int size260;
	private int size270;
	private int size280;
	private String filterColor; //  필터 검색 신발 색상
	private String filterBrand; // 필터 검색 신발 브랜드
	private int filterLowPrice; // 필터 검색 낮은 가격 순
	private int filterHighPrice; // 필터 검색 높은 가격 순
	
	private String searchContent; // 이름 검색에 이용

	
	public int getColorpk() {
		return colorpk;
	}
	public int getSize220() {
		return size220;
	}
	public void setSize220(int size220) {
		this.size220 = size220;
	}
	public int getSize230() {
		return size230;
	}
	public void setSize230(int size230) {
		this.size230 = size230;
	}
	public int getSize240() {
		return size240;
	}
	public void setSize240(int size240) {
		this.size240 = size240;
	}
	public int getSize250() {
		return size250;
	}
	public void setSize250(int size250) {
		this.size250 = size250;
	}
	public int getSize260() {
		return size260;
	}
	public void setSize260(int size260) {
		this.size260 = size260;
	}
	public int getSize270() {
		return size270;
	}
	public void setSize270(int size270) {
		this.size270 = size270;
	}
	public int getSize280() {
		return size280;
	}
	public void setSize280(int size280) {
		this.size280 = size280;
	}
	public String getFilterColor() {
		return filterColor;
	}
	public void setFilterColor(String filterColor) {
		this.filterColor = filterColor;
	}
	public String getFilterBrand() {
		return filterBrand;
	}
	public void setFilterBrand(String filterBrand) {
		this.filterBrand = filterBrand;
	}
	public int getFilterLowPrice() {
		return filterLowPrice;
	}
	public void setFilterLowPrice(int filterLowPrice) {
		this.filterLowPrice = filterLowPrice;
	}
	public int getFilterHighPrice() {
		return filterHighPrice;
	}
	public void setFilterHighPrice(int filterHighPrice) {
		this.filterHighPrice = filterHighPrice;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
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
				+ shoesImg + ", size220=" + size220 + ", size230=" + size230 + ", size240=" + size240 + ", size250="
				+ size250 + ", size260=" + size260 + ", size270=" + size270 + ", size280=" + size280 + ", filterColor="
				+ filterColor + ", filterBrand=" + filterBrand + ", filterLowPrice=" + filterLowPrice
				+ ", filterHighPrice=" + filterHighPrice + ", searchContent=" + searchContent + "]";
	}	
}
