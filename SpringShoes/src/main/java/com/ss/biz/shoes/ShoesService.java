package com.ss.biz.shoes;

import java.util.List;

public interface ShoesService {
	public void updateShoes(ShoesSizeVO vo);
	public ShoesVO selectOneShoes(ShoesVO vo);
	public List<ShoesVO> selectShoes_Color(ShoesVO vo);
	public List<ShoesSizeVO> selectShoes_Size(ShoesVO vo);
	public List<ShoesVO> selectAllShoes(ShoesVO vo);
	public List<ShoesVO> filterSearch(ShoesVO vo);
	public ShoesVO selectOneShoesBucket(ShoesSizeVO vo);
	
}
