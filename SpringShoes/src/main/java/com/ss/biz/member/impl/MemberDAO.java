package com.ss.biz.member.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ss.biz.member.MemberVO;
import com.ss.biz.member.impl.MemberRowMapper;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//sql 문 
	final String sql_login="SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
	final String sql_selectOne="SELECT * FROM MEMBER WHERE MID=?";
	
	final String sql_insert="INSERT INTO MEMBER(MID,MPW,MNAME,MPHONE,SHOESSIZE,MADDRESS) VALUES(?,?,?,?,?,?)";
	
	final String sql_update="UPDATE MEMBER SET MPW=? WHERE MID=?";
	final String sql_updateTier = "UPDATE MEMBER SET TIER=TIER+? WHERE MID=?";
	final String sql_delete="DELETE FROM MEMBER WHERE MID=?";
	
	public void insertMember(MemberVO vo) {
		jdbcTemplate.update(sql_insert, vo.getMid(),vo.getMpw(),vo.getMname(),vo.getMphone(),vo.getShoesSize(),vo.getMaddress());
	}

	public void deleteMember(MemberVO vo) {
		jdbcTemplate.update(sql_delete, vo.getMid());
	}

	public void updateMember(MemberVO vo) {
		jdbcTemplate.update(sql_update, vo.getMpw(), vo.getMid());
	}
	public void updateTierMember(MemberVO vo) {
		jdbcTemplate.update(sql_updateTier, vo.getTier(), vo.getMid());
	}

	public MemberVO login(MemberVO vo) {
		Object[] args = { vo.getMid(), vo.getMpw() };

		try {
			return jdbcTemplate.queryForObject(sql_login, args, new MemberRowMapper());
			
		}catch(Exception e){
			// 로그인 실패시 null로 반환해줌
			return null;
		}

	}
	
	public MemberVO selectOneMember(MemberVO vo) {
		Object[] args = { vo.getMid()};
		try {
			return jdbcTemplate.queryForObject(sql_selectOne, args, new MemberRowMapper());
			
		}catch(Exception e){
			return null;
		}
		
	}
	

}
class MemberRowMapper implements RowMapper<MemberVO> {

	@Override
	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberVO data = new MemberVO();
		data.setMid(rs.getString("MID"));
		data.setMpw(rs.getString("MPW"));
		data.setMname(rs.getString("MNAME"));
		data.setMphone(rs.getString("MPHONE"));
		data.setShoesSize(rs.getInt("SHOESSIZE"));
		data.setMaddress(rs.getString("MADDRESS"));
		data.setTier(rs.getInt("TIER"));
		return data;
	}

}
