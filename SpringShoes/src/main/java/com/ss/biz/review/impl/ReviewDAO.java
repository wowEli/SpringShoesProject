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
   
   final String sql_insert="INSERT INTO REVIEW(CONTENT,MID,SIZEPK,REVIEWIMG,COLORPK) VALUES(?,?,?,?,?)";
   final String sql_update="UPDATE REVIEW SET CONTENT=? , REVIEWIMG=? WHERE RPK=?"; //++이미지? 
   final String sql_delete="DELETE FROM REVIEW WHERE RPK=?"; // 삭제
   final String sql_selectOne="SELECT * FROM REVIEW WHERE RPK=?"; // 수정할 때 사용
   final String sql_selectOne_M_S="SELECT * FROM REVIEW WHERE MID=? AND SIZEPK=?"; // 1회 후기 기능을 위한 sql문
   final String sql_selectAll="SELECT * FROM REVIEW WHERE COLORPK=?"; // 조인 필요 colorpk가 같은 것들을 출력해줘야됨
   final String sql_selectAll_M="SELECT R.RPK, R.CONTENT, R.WRITEDAY, R.MID, R.SIZEPK, R.REVIEWIMG, SS.SIZE, SC.COLORPK, SSP.SHOESNAME FROM REVIEW R "
         + "INNER JOIN SHOESSIZE SS ON R.SIZEPK = SS.SIZEPK "
         + "INNER JOIN SHOESCOLOR SC ON SS.COLORPK = SC.COLORPK "
         + "INNER JOIN SHOESSAMPLE SSP ON SC.SAMPLEPK = SSP.SAMPLEPK "
         + "WHERE R.MID=? ORDER BY RPK DESC"; // 자신의 후기 목록 출력
   

   
   public void insertReview(ReviewVO vo) {
      jdbcTemplate.update(sql_insert, vo.getContent(), vo.getMid(), vo.getSizepk(), vo.getReviewImg(),vo.getColorpk());
   }

   public void updateReview(ReviewVO vo) {
      jdbcTemplate.update(sql_update, vo.getContent(),vo.getReviewImg(), vo.getRpk());
   }

   public void deleteReview(ReviewVO vo) {
      System.out.println("리뷰삭제로그: "+vo);
      jdbcTemplate.update(sql_delete, vo.getRpk());
   }

   public ReviewVO selectOneReview(ReviewVO vo) {
      Object[] args= {vo.getRpk()};
      try {
    	  
         return jdbcTemplate.queryForObject(sql_selectOne, args, new ReviewRowMapper1()); // query를 쓰고 형변환한 이유는?
         
         }
         catch(EmptyResultDataAccessException e) {
            return null;
         }
   }

   public ReviewVO selectOneReviewMS(ReviewVO vo) { // 1회 후기 작성에 필요한 SelectOne
      Object[] args= {vo.getMid() , vo.getSizepk()};
      try {
         return jdbcTemplate.queryForObject(sql_selectOne_M_S, args, new ReviewRowMapper1());
      }
      catch(EmptyResultDataAccessException e) {
         return null;
      }
   }
   
   public List<ReviewVO> selectAllReview(ReviewVO vo) {
      Object[] args= {vo.getColorpk()};
      return jdbcTemplate.query(sql_selectAll, args, new ReviewRowMapper1());
   }

   public List<ReviewVO> selectAllReviewM(ReviewVO vo) {
      Object[] args= {vo.getMid()};
      return jdbcTemplate.query(sql_selectAll_M, args, new ReviewRowMapper2());
   }
   
}

class ReviewRowMapper1 implements RowMapper<ReviewVO> {
   
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
class ReviewRowMapper2 implements RowMapper<ReviewVO> {

   @Override
   public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {

      ReviewVO data=new ReviewVO();
      data.setRpk(rs.getInt("RPK"));
      data.setContent(rs.getString("CONTENT"));
      data.setWriteday(rs.getString("WRITEDAY"));
      data.setMid(rs.getString("MID"));
      data.setSizepk(rs.getInt("SIZEPK"));
      data.setReviewImg(rs.getString("REVIEWIMG"));
      data.setSize(rs.getInt("SIZE"));
      data.setColorpk(rs.getInt("COLORPK"));
      data.setShoesName(rs.getString("SHOESNAME"));
      
      return data;
   }
}   