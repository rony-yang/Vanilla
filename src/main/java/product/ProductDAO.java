package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	private Connection conn;
	private ResultSet rs;
	
	public ProductDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbID = "vanilla";
			String dbPassword = "vanilla";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	} // --productDAO
	
	public int getNext() {
		String SQL = "SELECT productCode FROM product order by productCode desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;		// 첫번째 게시글인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;		// 데이터베이스 오류
	} // --getNext
	
	public ArrayList<Product> getList(int pageNumber, String group) {
		String SQL = null;
		//if(group == "top") {
			SQL = "SELECT * FROM product where productCode < ? and productGroup ='"+group+"'"
					+ "order by productCode asc";
		//}
		/*
		else if (group == "bottom") {
			SQL = "SELECT * FROM product where productCode < ? and productGroup ='bottom'"
					+ "order by productCode asc";
		}
		else {
			SQL = "SELECT * FROM product where productCode < ? and productGroup ='dress'"
					+ "order by productCode asc";
		}*/
		
		ArrayList<Product> list = new ArrayList<Product>();
		try {  
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1) * 8);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductGroup(rs.getString(1));
				product.setProductSection(rs.getString(2));
				product.setProductCode(rs.getInt(3));
				product.setProductName(rs.getString(4));
				product.setProductPrice(rs.getString(5));
				product.setProductStock(rs.getInt(6));
				list.add(product);  
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean nextPage(int pageNumber) {  // 페이징 처리
		String SQL = "SELECT * FROM product where productCode < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1) * 8);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;		
	} 
	
	public Product getProduct(int productCode) {
		String SQL = "SELECT * FROM product where productCode = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, productCode); 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Product product = new Product();
				product.setProductGroup(rs.getString(1));
				product.setProductSection(rs.getString(2));
				product.setProductCode(rs.getInt(3));
				product.setProductName(rs.getString(4));
				product.setProductPrice(rs.getString(5));
				product.setProductStock(rs.getInt(6));
				return product;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;		
	} 
	
}
