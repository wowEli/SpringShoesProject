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
	final String sql_selectOne="SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
	final String sql_selectAll="SELECT * FROM MEMBER";
	final String sql_insert="INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
//	-	mid VARCHAR(50) PRIMARY KEY – 아이디(이메일주소)
//	-	mpw VARCHAR(20) – 비밀번호 (영문이나 특문추가 할 수 있음)
//	-	mname VARCHAR(20) – 이름
//	-	mphone VARCHAR(20) – 전화번호
//	-	shoesSize INT – 신발사이즈
//	-	maddress VARCHAR(100) – 주소
//	-	tier VARCHAR(20) –등급에따라 할인운영 제도
//	-	role VARCHAR(10) – 개인OR운영자DB에서만 확인

	final String sql_update="UPDATE MEMBER SET MPW=? WHERE MID=?";
	final String sql_delete="DELETE FROM MEMBER WHERE MID=? AND MPW=?";
	
	public void insertMember(MemberVO vo) {
		jdbcTemplate.update(sql_insert, vo.getMid(),vo.getMpw(),vo.getMname(),vo.getMphone(),vo.getShoesSize(),vo.getMaddress(),vo.getTier(),vo.getRole());
	}

	public void deleteMember(MemberVO vo) {
		jdbcTemplate.update(sql_delete, vo.getMid(), vo.getMpw());
	}

	public void updateMember(MemberVO vo) {
		jdbcTemplate.update(sql_update, vo.getMpw(), vo.getMid());
	}

	public MemberVO selectOneMember(MemberVO vo) {
		Object[] args = { vo.getMid(), vo.getMpw() };

		return jdbcTemplate.queryForObject(sql_selectOne, args, new MemberRowMapper());

	}

	public List<MemberVO> selectAllMember(MemberVO vo) {
		return jdbcTemplate.query(sql_selectAll, new MemberRowMapper());
	}

	
	
}
class MemberRowMapper implements RowMapper<MemberVO> {

	@Override
	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberVO data = new MemberVO();
		data.setMid(rs.getString("MID"));
		data.setMpw(rs.getString("MPW"));
		data.setMname(rs.getString("MNAE"));
		data.setMphone(rs.getString("MPHONE"));
		data.setShoesSize(rs.getInt("SHOESSIZE"));
		data.setMaddress(rs.getString("MADDRESS"));
		data.setTier(rs.getString("TIER"));
		data.setRole(rs.getString("ROLE"));
		return data;
//		-	mid VARCHAR(50) PRIMARY KEY – 아이디(이메일주소)
//		-	mpw VARCHAR(20) – 비밀번호 (영문이나 특문추가 할 수 있음)
//		-	mname VARCHAR(20) – 이름
//		-	mphone VARCHAR(20) – 전화번호
//		-	shoesSize INT – 신발사이즈
//		-	maddress VARCHAR(100) – 주소
//		-	tier VARCHAR(20) –등급에따라 할인운영 제도
//		-	role VARCHAR(10) – 개인OR운영자DB에서만 확인
	}

}
