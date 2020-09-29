package dao;
import vo.*;
import java.sql.*;
import java.util.*;
import commons.DBUtil;

//member_product
public class ProductDao {
	// 상품을 출력하는 메소드
	public ArrayList<Product> selectProductList() throws Exception {
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
