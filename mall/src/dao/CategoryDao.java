package dao;
import vo.*;
import commons.DBUtil;
import java.util.*;
import java.sql.*;

public class CategoryDao {
	// 카테고리 목록을 출력하는 메소드
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> categorylist = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			categorylist.add(category);		
		}
		conn.close();
		return categorylist;
	}
	
	// 카테고리 이미지와 추천 카테고리 목록을 출력하는 메소드
	public ArrayList<Category> selectCategoryCkList() throws Exception {
		ArrayList<Category> categorylist = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select category_id, category_pic from category where category_ck='Y' limit 0,4";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
	
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryPic(rs.getString("category_pic"));
			categorylist.add(category);		
		}
		conn.close();
		return categorylist;
	}
}
