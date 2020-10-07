package dao;
import vo.*;
import commons.DBUtil;
import java.sql.*;

// member_MemberDao
public class MemberDao {
	// 회원가입 메소드
	public void insertMember(Member member) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into member(member_email, member_pw, member_name, member_date) values(?,?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.executeUpdate();
		conn.close();
	}
	
	// 회원가입시 중복되는 이메일이 있는지 확인하여 중복을 방지하는 메소드
	public Member selectMemberEmailCk(String memberEmail) throws Exception {
		Member member = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select id from (select member_email id from member union select admin_id id from admin) t where id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			member = new Member();
			member.setMemberEmail(rs.getString("id"));
		}
		conn.close();
		return member;
	}
	
	// 로그인 메소드
	public String login(Member member) throws Exception {
		String loginMemberEmail = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email from member where member_email=? and member_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			loginMemberEmail = rs.getString("member_email");
		}
		conn.close();
		return loginMemberEmail;
	}
	
	// 회원탈퇴시 해당 회원정보 출력
	public Member memberOne(String memberEmail) throws Exception {
		Member member = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email from member where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
			member = new Member();
			member.setMemberEmail(rs.getString("member_email"));
		}
		conn.close();
		return member;
	}
	
	// 회원탈퇴 메소드
	public void deleteMember(String memberEmail) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "delete from member where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		System.out.println(memberEmail+" <--memberEmail");
		stmt.executeUpdate();
		conn.close();
	}
}
