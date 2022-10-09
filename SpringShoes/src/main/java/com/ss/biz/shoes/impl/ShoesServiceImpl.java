package com.ss.biz.shoes.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.biz.shoes.ShoesColorVO;
import com.ss.biz.shoes.ShoesSampleVO;
import com.ss.biz.shoes.ShoesService;
import com.ss.biz.shoes.ShoesVO;

@Service("shoesService")
public class ShoesServiceImpl implements ShoesService{

	@Autowired 
	private ShoesDAO shoesDAO;

	@Override
	public void updateShoes(ShoesVO vo, int size) {
		shoesDAO.updateShoes(vo, size);
	}

	@Override
	public ShoesVO selectOneShoes(ShoesVO vo) {
		return shoesDAO.selectOneShoes(vo);
	}

	@Override
	public List<ShoesVO> selectAllShoes(ShoesVO vo) {
		return shoesDAO.selectAllShoes(vo);
	}
	
	@Override
	public List<ShoesVO> filterSearch(ShoesVO vo) {
		return shoesDAO.filterSearch(vo);
	}
	
	@Override
	public List<ShoesVO> selectShoes_Color(ShoesVO vo) {
		return shoesDAO.selectShoes_Color(vo);
	}

	@Override
	public List<ShoesVO> selectShoes_Size(ShoesVO vo) {
		return shoesDAO.selectShoes_Size(vo);
	} 
	


}
