package com.ss.biz.review.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ss.biz.review.ReviewVO;

@Repository("ReviewDAO")
public class ReviewDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_insert="INSERT INTO REVIEW(CONTENT,WRITEDAY,MID,COLORPK) VALUES(?,?,?,?)";
	final String sql_update="UPDATE REVIEW SET CONTENT=? WHERE RPK=?"; //++이미지? 
	final String sql_delete="DELETE REVIEW WHERE RPK=?"; // 삭제
	final String sql_selectOne="SELECT * FROM REVIEW WHERE RPK=?"; // 수정할 때 사용
	final String sql_selectOne_M_S="SELECT * FROM REVIEW WHERE MID=? AND SIZEPK=?"; // 1회 후기 기능을 위한 sql문
	final String sql_selectAll="SELECT * FROM REVIEW WHERE SIZEPK=?"; // 조인 필요 colorpk가 같은 것들을 출력해줘야됨
	final String sql_selectAll_M="SELECT * FROM REVIEW WHERE MID=? ORDER BY RPK DESC"; // 자신의 후기 목록 출력
	
	public void insertReview(ReviewVO vo) {
		jdbcTemplate.update(sql_insert, vo.getContent(), vo.getWriteday(), vo.getMid(), vo.getSizepk());
	}

	public void updateReview(ReviewVO vo) {
		jdbcTemplate.update(sql_update, vo.getContent(), vo.getRpk());
	}

	public void deleteReview(ReviewVO vo) {
		jdbcTemplate.update(sql_delete, vo.getRpk());
	}

	public ReviewVO selectOneReview(ReviewVO vo) {
		Object[] args= {vo.getMid(), vo.getSizepk()};
		try {
			return jdbcTemplate.queryForObject(sql_selectOne, args, new ReviewRowMapper()); // query를 쓰고 형변환한 이유는?
			}
			catch(EmptyResultDataAccessException e) {
				return null;
			}
	}

	public ReviewVO selectOneReviewMS(ReviewVO vo) { // 1회 후기 작성에 필요한 SelectOne
		Object[] args= {vo.getMid() , vo.getSizepk()};
		try {
			return jdbcTemplate.queryForObject(sql_selectOne_M_S, args, new ReviewRowMapper());
		}
		catch(EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public List<ReviewVO> selectAllReview(ReviewVO vo) {
		Object[] args= {vo.getSizepk()};
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
		data.setSizepk(rs.getInt("SIZEPK"));
		data.setReviewImg(rs.getString("REVIEWIMG"));
		
		return data;
	}
}	
