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

	// insert 모음
	final String sql_insertSampleShoes = "INSERT INTO SHOESSAMPLE(SHOESNAME,PRICE,BRAND) VALUES(?,?,?)";
	final String sql_insertColorShoes = "INSERT INTO SHOESCOLOR(SAMPLEPK,COLOR,SHOESIMG) VALUES(?,?,?)";
	final String sql_insertSizeShoes = "INSERT INTO SHOESSIZE(COLORPK,SIZE,CNT) VALUES(?,?,10)";

	// ==========*selectAll 모음===========
	//shoesColorVO에 저장할 selectAll 크롤링 전용!!!!
	final String sql_selectAllColorShoes = "SELECT * FROM SHOESCOLOR";

	//★ShoesVO에 저장할 selectAll
	final String sql_selectAllShoes = "SELECT SC.COLORPK,SC.COLOR,SC.SHOESIMG,SS.SHOESNAME,SS.PRICE,SS.BRAND FROM SHOESCOLOR SC INNER JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK WHERE SHOESNAME LIKE CONCAT ('%',?,'%') OR BRAND LIKE CONCAT ('%',?,'%')";
		
		
	// ==========*selectOne 모음==========
	//★shoesVO에 저장할 selectOne
	final String sql_selectOneShoes = "SELECT SC.COLORPK,SC.COLOR,SC.SHOESIMG,SS.SHOESNAME,SS.PRICE,SS.BRAND FROM SHOESCOLOR SC INNER JOIN SHOESSAMPLE SS ON SC.SAMPLEPK = SS.SAMPLEPK WHERE COLORPK=?";
	

	// =============update 모음==========
	//★shoesSize update
	final String sql_updateSizeShoes = "UPDATE SHOESSIZE SET CNT=CNT-1 WHERE COLORPK=? AND SIZE=?";

	// ★필터검색용 sql
//	String sql_FilterSearch = "SELECT SC.COLORPK,COLOR,SHOESIMG,SHOESNAME,PRICE,BRAND,SIZE,CNT FROM SHOESCOLOR SC INNER JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK "
//			+ "INNER JOIN SHOESSIZE S ON SC.COLORPK = S.COLORPK WHERE COLOR LIKE CONCAT('%',?,'%') AND BRAND LIKE CONCAT('%',?,'%') AND (PRICE>=? AND PRICE<=?) AND";

	String sql_FilterSearch = "SELECT SC.COLORPK,COLOR,SHOESIMG,SHOESNAME,PRICE,BRAND,SIZE,CNT FROM SHOESCOLOR SC INNER JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK INNER JOIN SHOESSIZE S ON SC.COLORPK = S.COLORPK WHERE COLOR LIKE CONCAT('%',?,'%') AND BRAND LIKE CONCAT('%',?,'%') AND (PRICE>=? AND PRICE<=?) AND";
	
	// SampleShoes 크롤링할때 INSERT 메서드
	public void insertSampleShoes(ShoesSampleVO vo) {
		jdbcTemplate.update(sql_insertSampleShoes, vo.getShoesName(), vo.getPrice(), vo.getBrand());
	}

	// ColorShoes 크롤링할때 INSERT 메서드
	public void insertColorShoes(ShoesColorVO vo) {
		jdbcTemplate.update(sql_insertColorShoes, vo.getSamplepk(), vo.getColor(), vo.getShoesImg());
	}

	// SizeShoes 테이블에 INSERT 메서드
	public void insertSizeShoes(ShoesSizeVO vo) {
		jdbcTemplate.update(sql_insertSizeShoes, vo.getColorpk(), vo.getSize());
	}
	
	// shoesColor selectAll
		public List<ShoesColorVO> selectAllShoesColor(ShoesColorVO vo) {
			return jdbcTemplate.query(sql_selectAllColorShoes, new ShoesColorRowMapper());
		}
		
	//===============================================================================================
		
	// 사용자가 구매시 SizeShoes 재고를 -1 UPDATE
	public void updateShoes(ShoesVO vo, int size) {
		jdbcTemplate.update(sql_updateSizeShoes, vo.getColorpk(), size);
	}


	public ShoesVO selectOneShoes(ShoesVO vo) {
		Object[] args = {vo.getColorpk()};
		return jdbcTemplate.queryForObject(sql_selectOneShoes, args, new ShoesRowMapper() );
	}

	// 신발 전체조회 + 검색로직
	public List<ShoesVO> selectAllShoes(ShoesVO vo) {
		// 브랜드나 신발이름에 동일한것이 있다면
		System.out.println("DAO 검색로직"+vo.getSearchContent());
		Object[] args = {vo.getSearchContent(), vo.getSearchContent()};
		System.out.println("args0값"+args[0].toString());
		System.out.println("args1값"+args[1].toString());
		return jdbcTemplate.query(sql_selectAllShoes, args, new ShoesRowMapper());
	}
	
	
	
	// 필터검색 메서드
	public List<ShoesVO> filterSearch(ShoesVO vo, Integer[] size) {
		Object[] args = {vo.getFilterColor(),vo.getFilterBrand(),vo.getFilterLowPrice(),vo.getFilterHighPrice()};
		
		// int배열 size로그 몇개들어갔나
		System.out.println("size.length="+size.length);
		for(int i = 0; i < size.length; i++) {
			System.out.println(size[i]);
		}
		
//		 초기 sql 공백 초기화작업 (안하면 게속 SIZE 조건이 중첩되어 저장되어있음)
		String sql = sql_FilterSearch;
		
		for (int i = 0; i < size.length; i++) {
			System.out.println("SIZE 조건을 만드는 for문 들어옴");
			if (i == 0) {
				System.out.println("i == 0 들어옴");
				sql += " (SIZE=" + size[i];
				
//				System.out.println("i == 0 이여서 만들어진 sql문 "+sql);
			} else {
				System.out.println("i == 0 이 아니여서 들어옴");
				sql += " OR SIZE=" + size[i];
//				System.out.println("i == 0 이 아니여서 만들어진 sql문 "+sql);
			}
		}
		sql += ")";
		
		System.out.println("사용된 필터 sql문"+sql);
		
		System.out.println("args 내용 로그");
		for(int i = 0; i < args.length; i++) {
			System.out.println(args[i].toString());
		}
		
		return jdbcTemplate.query(sql, args, new ShoesRowMapper());
	}
	
	
//	for(int i=0; i<datas.size(); i++) {
//		for(int j=i+1; j<datas.size(); j++) {
//			if(datas.get(i).getColorPk()==datas.get(i).getColorPk()) {
//				datas.remove(j);
//			}
//		}
//	}

}

//shoesColor Select 메서드 활용 RowMapper
class ShoesColorRowMapper implements RowMapper<ShoesColorVO> {

	@Override
	public ShoesColorVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ShoesColorVO data = new ShoesColorVO();
		data.setColorpk(rs.getInt("COLORPK"));
		data.setSamplepk(rs.getInt("SAMPLEPK"));
		data.setColor(rs.getString("COLOR"));
		data.setShoesImg(rs.getString("SHOESIMG"));
		return data;

	}

}

class ShoesRowMapper implements RowMapper<ShoesVO> {

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