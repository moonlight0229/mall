package dao;
import vo.*;
import commons.DBUtil;
import java.util.*;
import java.sql.*;

public class NoticeDao {
	// 최근 공지 2개를 출력하는 메소드
	public ArrayList<Notice> selectNoticeList() throws Exception{
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
	
	// 공지 상세정보
	public Notice selectNoticeOne() {
		return null;
	}
	
}
