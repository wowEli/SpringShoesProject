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

	// ========== 필터검색 메서드 시작 =========
	String sql_FilterSearch = "SELECT SC.COLORPK,COLOR,SHOESIMG,SHOESNAME,PRICE,BRAND,SIZE,CNT "
			+ "FROM SHOESCOLOR SC "
			+ "INNER JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK "
			+ "INNER JOIN SHOESSIZE S ON SC.COLORPK = S.COLORPK "
			+ "WHERE COLOR LIKE CONCAT('%',?,'%') AND "
			+ "BRAND LIKE CONCAT('%',?,'%') AND "
			+ "(PRICE>=? AND PRICE<=?) AND";

	// 필터검색 메서드
	public List<ShoesVO> filterSearch(ShoesVO vo) {
		Object[] args = {vo.getFilterColor(),vo.getFilterBrand(),vo.getFilterLowPrice(),vo.getFilterHighPrice(),vo.getPage()};

		int[] size = vo.getFilterSize();

		// int배열 size로그 몇개들어갔나
		//			System.out.println("size.length="+size.length);
		//			for(int i = 0; i < size.length; i++) {
		//				System.out.println(size[i]);
		//			}

		// 초기 sql 공백 초기화작업 (안하면 게속 SIZE 조건이 중첩되어 저장되어있음)
		String sql = sql_FilterSearch;

		// size추가 만큼 sql문 생성
		for (int i = 0; i < size.length; i++) {
			//				System.out.println("SIZE 조건을 만드는 for문 들어옴");
			if (i == 0) {
				//					System.out.println("i == 0 들어옴");
				sql += " (SIZE=" + size[i];
			} else {
				//					System.out.println("i == 0 이 아니여서 들어옴");
				sql += " OR SIZE=" + size[i];
			}
		}
		sql += ") LIMIT ?, 9";

		//			System.out.println("사용된 필터 sql문"+sql);
		//			System.out.println("args 내용 로그");

		for(int i = 0; i < args.length; i++) {
			System.out.println(args[i].toString());
		}
		return jdbcTemplate.query(sql, args, new ShoesRowMapper2());
	}

	// Size를 같이 담아줄 RowMapper
	class ShoesRowMapper2 implements RowMapper<ShoesVO> {

		@Override
		public ShoesVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ShoesVO data = new ShoesVO();
			data.setColorpk(rs.getInt("COLORPK"));
			data.setBrand(rs.getString("BRAND"));
			data.setPrice(rs.getInt("PRICE"));
			data.setShoesColor(rs.getString("COLOR"));
			data.setShoesImg(rs.getString("SHOESIMG"));
			data.setShoesName(rs.getString("SHOESNAME"));
			data.setShoesSize(rs.getInt("SIZE"));
			data.setShoesCnt(rs.getInt("CNT"));

			return data;
		}

	}
	// ========== 필터검색 메서드 종료 =========

	
	// ========== 필터검색 카운트 시작 =========
	String sql_FilterSearchCount = "SELECT COUNT(*) AS PAGESIZE "
			+ "FROM SHOESCOLOR SC "
			+ "INNER JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK "
			+ "INNER JOIN SHOESSIZE S ON SC.COLORPK = S.COLORPK "
			+ "WHERE COLOR LIKE CONCAT('%',?,'%') AND "
			+ "BRAND LIKE CONCAT('%',?,'%') AND "
			+ "(PRICE>=? AND PRICE<=?) AND";
	public int filterSearchPageSize(ShoesVO vo) {
		Object[] args = {vo.getFilterColor(),vo.getFilterBrand(),vo.getFilterLowPrice(),vo.getFilterHighPrice()};

		int[] size = vo.getFilterSize();

		// int배열 size로그 몇개들어갔나
					System.out.println("size.length="+size.length);
					for(int i = 0; i < size.length; i++) {
						System.out.println(size[i]);
					}

		// 초기 sql 공백 초기화작업 (안하면 게속 SIZE 조건이 중첩되어 저장되어있음)
		String sql = sql_FilterSearchCount;

		// size추가 만큼 sql문 생성
		for (int i = 0; i < size.length; i++) {
			//				System.out.println("SIZE 조건을 만드는 for문 들어옴");
			if (i == 0) {
				//					System.out.println("i == 0 들어옴");
				sql += " (SIZE=" + size[i];
			} else {
				//					System.out.println("i == 0 이 아니여서 들어옴");
				sql += " OR SIZE=" + size[i];
			}
		}
		sql += ")";

					System.out.println("사용된 필터 sql문"+sql);
					System.out.println("args 내용 로그");

//		for(int i = 0; i < args.length; i++) {
//			System.out.println(args[i].toString());
//		}
		return jdbcTemplate.queryForObject(sql, args, Integer.class);
	}
	// ========== 필터검색 카운트 종료 =========


	// =========== 신발전체조회 + 일반검색 메서드 시작 ===========
	final String sql_selectAllShoes = "SELECT SC.COLORPK,SC.COLOR,SC.SHOESIMG,SS.SHOESNAME,SS.PRICE,SS.BRAND "
			+ "FROM SHOESCOLOR SC "
			+ "INNER JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK "
			+ "WHERE SHOESNAME LIKE CONCAT ('%',?,'%') OR BRAND LIKE CONCAT ('%',?,'%') LIMIT ?, 9";


	// 신발 전체조회 + 검색로직(신발명이나 브랜드명 검색)
	public List<ShoesVO> selectAllShoes(ShoesVO vo) {
		Object[] args = {vo.getSearchContent(), vo.getSearchContent(),vo.getPage()};
		return jdbcTemplate.query(sql_selectAllShoes, args, new ShoesRowMapper());
	}

	// 일반 검색용 Size칼럼없이 사용하는 RowMapper
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
			data.setShoesCnt(-1);

			return data;
		}
	}
	// =========== 신발전체조회 + 일반검색 메서드 종료 ===========


	// =========== 신발 전체조회 COUNT 결과값 메서드 =============
	final String sql_selectAllShoesCount = "SELECT COUNT(*) AS PAGESIZE "
			+ "FROM SHOESCOLOR SC "
			+ "INNER JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK "
			+ "WHERE SHOESNAME LIKE CONCAT ('%',?,'%') OR BRAND LIKE CONCAT ('%',?,'%')";


	// 신발 전체조회 + 검색로직(신발명이나 브랜드명 검색)
	public int selectAllShoesPageSize(ShoesVO vo) {
		Object[] args = {vo.getSearchContent(), vo.getSearchContent()};
		return jdbcTemplate.queryForObject(sql_selectAllShoesCount, args,Integer.class);
		// integer.class 를 사용하면 count 값을 int로 리턴 받을 수 있음
		// rowmapper를 사용하지 않아도 됨으로 출력할 데이터개수를 담았던 변수를 하나 줄일 수 있음
	}
	// =========== 신발 전체조회 COUNT 결과값 메서드 종료 =============



	// ========== 장바구니 메서드 시작 =========
	final String sql_selectOneShoes_Bucket = "SELECT SS.SIZEPK, SS.SIZE, SC.SHOESIMG, SSP.SHOESNAME, SSP.PRICE "
			+ "FROM SHOESSIZE SS "
			+ "INNER JOIN SHOESCOLOR SC ON SS.COLORPK = SC.COLORPK "
			+ "INNER JOIN SHOESSAMPLE SSP ON SC.SAMPLEPK = SSP.SAMPLEPK "
			+ "WHERE SS.SIZEPK = ?";

	public ShoesVO selectOneShoesBucket(ShoesSizeVO vo) { // 장바구니에서 쓸 selectOne
		Object[] args = {vo.getSizepk()};
		try {
			return jdbcTemplate.queryForObject(sql_selectOneShoes_Bucket, args, new ShoesRowMapperBucket());
		}catch(Exception e){
			return null;
		}
	}

	class ShoesRowMapperBucket implements RowMapper<ShoesVO>{
		@Override
		public ShoesVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ShoesVO data = new ShoesVO();
			data.setSizepk(rs.getInt("SIZEPK"));
			data.setShoesSize(rs.getInt("SIZE"));
			data.setShoesImg(rs.getString("SHOESIMG"));
			data.setShoesName(rs.getString("SHOESNAME"));
			data.setPrice(rs.getInt("PRICE"));

			return data;
		}
	}
	// ========== 장바구니 메서드 종료 =========


	// ========== 신발 상세 페이지 메서드 시작 =========	
	// 신발상세 페이지를 들어가기 위해서 필요한 3가지 ( 신발하나의 정보, 신발과 같은이름의 다른색상 신발이미지들, 신발하나정보의 사이즈와 갯수들 )

	//신발 하나의 정보
	final String sql_selectOneShoes = "SELECT SC.COLORPK,SC.COLOR,SC.SHOESIMG,SS.SHOESNAME,SS.PRICE,SS.BRAND "
			+ "FROM SHOESCOLOR SC "
			+ "INNER JOIN SHOESSAMPLE SS ON SC.SAMPLEPK = SS.SAMPLEPK "
			+ "WHERE COLORPK=?";

	//신발 하나의 정보의 동일한 신발의 여러 색상이미지들 + COLORPK값 
	final String sql_selectOneShoes_Color = "SELECT COLORPK, SHOESIMG FROM SHOESCOLOR SC "
			+ "INNER JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK "
			+ "WHERE SHOESNAME = ?";

	//신발 하나의 정보의 동일한 신발의 여러 SIZE들과 해당 CNT들 + SIZEPK값 
	final String sql_selectOneShoes_Size ="SELECT SIZEPK, SIZE, CNT FROM SHOESCOLOR SC "
			+ "INNER JOIN SHOESSAMPLE SS ON SS.SAMPLEPK = SC.SAMPLEPK "
			+ "INNER JOIN SHOESSIZE S ON S.COLORPK = SC.COLORPK "
			+ "WHERE SC.COLORPK = ?;";

	public ShoesVO selectOneShoes(ShoesVO vo) {
		Object[] args = {vo.getColorpk()};
		return jdbcTemplate.queryForObject(sql_selectOneShoes, args, new ShoesRowMapper() );
	}

	// 신발 상세페이지 = 신발정보의 이름과 동일한 모든 다른색상의 신발정보를 담아줌
	public List<ShoesVO> selectShoes_Color(ShoesVO vo) {
		Object[] args = {vo.getShoesName()};
		return jdbcTemplate.query(sql_selectOneShoes_Color, args, new ShoesRowMapperColor());
	}

	// selectOne한 신발정보의 다른 색의 정보들을 담아줌
	class ShoesRowMapperColor implements RowMapper<ShoesVO> {

		@Override
		public ShoesVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ShoesVO data = new ShoesVO();
			data.setColorpk(rs.getInt("COLORPK"));
			data.setShoesImg(rs.getString("SHOESIMG"));

			return data;
		}

	}

	// 신발 상세페이지 = 신발정보의 동일한 다른 Size + Cnt 신발정보를 담아줌
	public List<ShoesSizeVO> selectShoes_Size(ShoesVO vo) {
		Object[] args = {vo.getColorpk()};
		return jdbcTemplate.query(sql_selectOneShoes_Size, args, new ShoesRowMapperSize());
	}

	// selectOne한 신발정보의 다른 사이즈 + 갯수 정보들을 담아줌
	class ShoesRowMapperSize implements RowMapper<ShoesSizeVO> {

		@Override
		public ShoesSizeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ShoesSizeVO data = new ShoesSizeVO();
			data.setSizepk(rs.getInt("SIZEPK"));
			data.setSize(rs.getInt("SIZE"));
			data.setCnt(rs.getInt("CNT"));

			return data;
		}

	}
	// ========== 신발 상세 페이지 메서드 종료 =========


	// ============= update 신발 재고 -1 메서드 시작 ==========
	final String sql_updateSizeShoes = "UPDATE SHOESSIZE SET CNT=CNT-1 WHERE SIZEPK = ?";

	public void updateShoes(ShoesSizeVO vo) {
		jdbcTemplate.update(sql_updateSizeShoes, vo.getSizepk());
	}
	// ============= update 신발 재고 -1 메서드 종료 ==========


	//=========== 크롤링 메서드 시작 ===========
	// insert 모음
	final String sql_insertSampleShoes = "INSERT INTO SHOESSAMPLE(SHOESNAME,PRICE,BRAND) VALUES(?,?,?)";
	final String sql_insertColorShoes = "INSERT INTO SHOESCOLOR(SAMPLEPK,COLOR,SHOESIMG) VALUES(?,?,?)";
	final String sql_insertSizeShoes = "INSERT INTO SHOESSIZE(COLORPK,SIZE,CNT) VALUES(?,?,10)";

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

	//shoesColorVO에 저장할 selectAll 크롤링 전용!!!!
	final String sql_selectAllColorShoes = "SELECT * FROM SHOESCOLOR";

	// shoesColor selectAll
	public List<ShoesColorVO> selectAllShoesColor(ShoesColorVO vo) {
		return jdbcTemplate.query(sql_selectAllColorShoes, new ShoesColorRowMapper());
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
	// =========== 크롤링 메서드 종료 ===========

}

