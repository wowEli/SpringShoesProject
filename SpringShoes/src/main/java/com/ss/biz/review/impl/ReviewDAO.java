package com.ss.biz.review.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ss.biz.review.ReviewVO;

@Repository("ReviewDAO")
public class ReviewDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_insert="INSERT INTO REVIEW VALUES(?,?,?,?,?)";
	final String sql_update="UPDATE REVIEW SET CONTENT=? WHERE RPK=?"; //++이미지? 
	final String sql_delete="DELETE REVIEW WHERE RPK=?"; 
	final String sql_selectOne="SELECT * FROM REVIEW WHERE RPK=?"; 
	final String sql_selectAll="SELECT * FROM REVIEW WHERE COLORPK=?";
	final String sql_selectAll_M="SELECT * FROM REVIEW WHERE MID=?";
	
	public boolean insertReview(ReviewVO vo) {
		jdbcTemplate.update(sql_insert, vo.getRpk(), vo.getContent(), vo.getWriteday(), vo.getMid(), vo.getColorpk());
		return false;
	}

	public boolean updateReview(ReviewVO vo) {
		jdbcTemplate.update(sql_update, vo.getContent(), vo.getRpk());
		return false;
	}

	public boolean deleteReview(ReviewVO vo) {
		jdbcTemplate.update(sql_delete, vo.getRpk());
		return false;
	}

	public ReviewVO selectOneReview(ReviewVO vo) {
		Object[] args= {vo.getMid(), vo.getColorpk()};
		return (ReviewVO) jdbcTemplate.query(sql_selectOne, args, new ReviewRowMapper());
	}

	public List<ReviewVO> selectAllReview(ReviewVO vo) {
		Object[] args= {vo.getColorpk()};
		return jdbcTemplate.query(sql_selectAll, args, new ReviewRowMapper());
	}

	public List<ReviewVO> selectAllReviewM(ReviewVO vo) {
		Object[] args= {vo.getMid()};
		return jdbcTemplate.query(sql_selectAll_M, args, new ReviewRowMapper());
	}
}

class ReviewRowMapper implements RowMapper<ReviewVO> {

	@Override
	public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {

		ReviewVO data=new ReviewVO();
		data.setRpk(rs.getInt("RPK"));
		data.setContent(rs.getString("CONTENT"));
		data.setWriteday(rs.getString("WRITEDAY"));
		data.setMid(rs.getString("MID"));
		data.setColorpk(rs.getString("COLORPK"));
		return data;
	}
}	
