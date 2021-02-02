package dao;
import vo.*;
import commons.DBUtil;
import java.util.*;
import java.sql.*;

// member_NoticeDao
public class NoticeDao {
	// 전체 공지사항을 출력하는 메소드
	public ArrayList<Notice> selectNoticeList() throws Exception {
		ArrayList<Notice> noticelist = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice order by notice_id desc";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
			noticelist.add(notice);
		}
		conn.close();
		return noticelist;
	}
	
	// 메인 페이지에서 최근 공지 3개를 출력하는 메소드
	public ArrayList<Notice> selectMainPageNoticeList() throws Exception{
		ArrayList<Notice> noticeList = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title from notice order by notice_date desc limit 0,3";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			// notice.noticeTitle = rs.getString("notice_title");
			// notice.noticeId = rsgetInt("notice_id");
			noticeList.add(notice);
		}
		conn.close();
		return noticeList;
	}
	
	// 공지사항 상세정보 출력 메소드
	public Notice noticeOne(int noticeId) throws Exception {
		Notice notice = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);
		ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
			notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
		}
		conn.close();
		return notice;
	}
}
