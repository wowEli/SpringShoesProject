package com.ss.biz.shoes.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ss.biz.shoes.ShoesColorVO;
import com.ss.biz.shoes.ShoesSampleVO;
import com.ss.biz.shoes.ShoesSizeVO;
import com.ss.biz.shoes.ShoesVO;

@Repository("shoesDAO")
public class ShoesDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//insert 모음
	final String sql_insertSampleShoes="INSERT INTO SHOESSAMPLE(SHOESNAME,PRICE,BRAND) VALUES(?,?,?)";
	final String sql_insertColorShoes="INSERT INTO SHOESCOLOR(SAMPLEPK,COLOR,SHOESIMG) VALUES(?,?,?)";
	final String sql_insertSizeShoes="INSERT INTO SHOESSIZE(COLORPK,SIZE,CNT) VALUES(?,?,10)";
	
	//selectAll 모음
	final String sql_selectAllColorShoes="SELECT * FROM SHOESCOLOR";
	
	//update 모음
	final String sql_updateSizeShoes="UPDATE SHOESSIZE SET CNT=CNT-1 WHERE COLORPK=? AND SIZE=?";
	
	//필터검색용 sql
	String sql_FilterSearch="SELECT SC.*,SS.BRAND,S.CONT FROM SHOESCOLOR SC LEFT JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK\r\n"
			+ "LEFT JOIN SHOESSIZE S ON SC.COLORPK = S.COLORPK WHERE COLOR LIKE'%%' AND BRAND LIKE'%%' AND SIZE=220 OR SIZE=230";
	
	
	//SampleShoes 크롤링할때 INSERT 메서드
	public void insertSampleShoes(ShoesSampleVO vo) {
		System.out.println(vo);
		System.out.println(jdbcTemplate);
		jdbcTemplate.update(sql_insertSampleShoes,vo.getShoesName(),vo.getPrice(),vo.getBrand());
	}
	
	//ColorShoes 크롤링할때 INSERT 메서드
	public void insertColorShoes(ShoesColorVO vo) {
		jdbcTemplate.update(sql_insertColorShoes,vo.getSamplepk(),vo.getColor(),vo.getShoesImg());
	}
	//SizeShoes 테이블에 INSERT 메서드
	public void insertSizeShoes(ShoesSizeVO vo) {
		jdbcTemplate.update(sql_insertSizeShoes,vo.getColorpk(),vo.getSize());
	}
	//사용자가 구매시 SizeShoes 재고를 -1 UPDATE
	public void updateShoes(ShoesVO vo,int size) {
		jdbcTemplate.update(sql_updateSizeShoes,vo.getColorpk(),size);
	}
	//SizeShoes를 INSERT할때 필요한 메서드
	public List<ShoesColorVO> selectAllShoesColor(ShoesColorVO vo){
		return jdbcTemplate.query(sql_selectAllColorShoes, new ShoesColorRowMapper());
	}
	
	//필터검색 메서드
	public List<ShoesVO> filterSearch(ShoesVO vo,int[] size){
		for(int i=0; i<size.length; i++) {
			if(i==0) {
				sql_FilterSearch=sql_FilterSearch+" (SIZE="+size[i];
			}
			else {
				sql_FilterSearch=sql_FilterSearch+" OR SIZE="+size[i];
			}
			sql_FilterSearch=sql_FilterSearch+")";
		}
		
		return jdbcTemplate.query(sql_FilterSearch, new ShoesRowMapper());
	}
	
}

//shoesColor Select 메서드 활용 RowMapper
class ShoesColorRowMapper implements RowMapper<ShoesColorVO> {

	@Override
	public ShoesColorVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//		private int colorpk; //pk
//		private int samplepk; // shoessample pk
//		private String color; //신발 색상(필터검색)
//		private String shoesimg; //신발 이미지
		ShoesColorVO data = new ShoesColorVO();
		data.setColorpk(rs.getInt("COLORPK"));
		data.setSamplepk(rs.getInt("SAMPLEPK"));
		data.setColor(rs.getString("COLOR"));
		data.setShoesImg(rs.getString("SHOESIMG"));
		return data;

	}

}

class ShoesRowMapper implements RowMapper<ShoesVO>{

	@Override
	public ShoesVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ShoesVO data = new ShoesVO();
		data.setColorpk(rs.getInt("COLORPK"));
		data.setBrand(rs.getString("BRAND"));
		data.setPrice(rs.getInt("PRICE"));
		data.setShoesColor(rs.getString("COLOR"));
		data.setShoesImg(rs.getString("SHOESIMG"));
		data.setShoesName(rs.getString("SHOESNAME"));
		
		return data;
	}
	
}