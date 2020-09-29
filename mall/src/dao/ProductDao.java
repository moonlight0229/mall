package dao;
import vo.*;
import java.sql.*;
import java.util.*;
import commons.DBUtil;

//member_product
public class ProductDao {
	// 전체 상품목록 출력 메소드
	public ArrayList<Product> selectProductList() throws Exception {
		ArrayList<Product> productList = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout, product_pic from product";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic(rs.getString("product_pic"));
			productList.add(product);
		}
		conn.close();
		return productList;
	}
	// 선택한 카테고리의 상품목록만 출력하는 메소드
	public ArrayList<Product> selectProductListByCategoryId(int categoryId) throws Exception { 
		ArrayList<Product> productList = new ArrayList<Product>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout, product_pic from product where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic(rs.getString("product_pic"));
			productList.add(product);
		}
	
		conn.close();
		return productList;
	}

	// 메인페이지에서 추천 상품 6개만 출력하는 메소드
	public ArrayList<Product> selectMainPageProductList() throws Exception {
		ArrayList<Product> productList = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, product_pic, product_name, product_price, product_soldout from product limit 0,6";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Product product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setProductPic(rs.getString("product_pic"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
			productList.add(product);
		}
		conn.close();
		return productList;
	}
	
	// 메인페이지에서 선택한 카테고리의 추천 상품 6개만 출력하는 메소드
	public ArrayList<Product> selectMainPageProductListByCategoryId(int categoryId) throws Exception { 
		ArrayList<Product> productList = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout, product_pic from product where category_id=? limit 0,6";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic(rs.getString("product_pic"));
			productList.add(product);
		}
		System.out.println(categoryId);
		conn.close();
		return productList;
	}
	
	
	// 상품 상세보기
	public Product selectProductOne(int productId) throws Exception {
		Product product = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, product_pic, product_name, product_price, product_soldout, product_content from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setProductPic(rs.getString("product_pic"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductContent(rs.getString("product_content"));
		}
		conn.close();
		return product;
	}
}
