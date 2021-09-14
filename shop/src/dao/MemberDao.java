package dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import commons.DBUtil;
import vo.Member;

public class MemberDao {

	public void insertMember(Member member) throws ClassNotFoundException, SQLException{
		//매개변수 디버깅
		System.out.println(member.getMemberId()+"<-------memberId 매개변수 디버깅");
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//디버깅
		System.out.println(conn +"<------------conn 디버깅 ");
		
		String sql ="INSERT INTO member(member_id, member_pw, member_level, member_name, member_age, member_gender, update_date, create_date) VALUES(?, PASSWORD(?), 0, ?, ?, ?,NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId()); //아이디
		stmt.setString(2, member.getMemberPw()); // 비번
		stmt.setString(3, member.getMemberName()); // 이름 
		stmt.setInt(4, member.getMemberAge()); // 나이 
		stmt.setString(5, member.getMemberGender()); // 성별
		
		stmt.executeUpdate();
		stmt.close();
		conn.close();
		
	
		
		/*
		 *  INSERT INTO member(
		 member_id, member_pw, member_level, member_name, member_age, member_gender, update_date, create_date)
	  VALUES(?, PASSWORD(?), 0, ?, ?, NOW(), NOW());
		 */

	}
	public Member login(Member member) throws ClassNotFoundException, SQLException {
		Member returnMember = null;
		//매개변수 로그인
		System.out.println(member.getMemberId()+"<------매개변수 ID");
		System.out.println(member.getMemberPw()+"<------매개변수 PW");
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		//디버깅
		System.out.println(conn +"<------------conn 디버깅 ");
		
		String sql = "select member_no memberNo, member_id memberId, member_level memberLevel,member_name memberName FROM member where member_id = ? AND member_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberNo(Integer.parseInt(rs.getString("memberNo")));
			returnMember.setMemberId(rs.getString("memberId"));
			returnMember.setMemberName(rs.getString("memberName"));
			returnMember.setMemberLevel(Integer.parseInt(rs.getString("memberLevel")));
			return returnMember;
		
		}
		rs.close();
		stmt.close();
		conn.close();
		
		
		return null;
		
		/*
		 	select member_no memberNo, member_id memberId, member_level memberLevel
		 	 FROM member where member_id = ? AND member_pw = PASSWORD(?);
		 */
		
	}

}
