package com.ss.biz.shoes;

public class ShoesSizeVO {
	private int sizepk;	// pk
	private int colorpk; // shoescoloer pk
	private int size; // 신발 사이즈
	private int cnt; //신발재고
	
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
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "ShoesSizeVO [sizepk=" + sizepk + ", colorpk=" + colorpk + ", size=" + size + ", cnt=" + cnt + "]";
	}
	
	
}
