package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;

	public BbsDAO() { 
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbID = "vanilla";
			String dbPassword = "vanilla";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";		// 데이터베이스 오류
	}
	
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS order by bbsID desc";
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
	}
	
	
	public int write(String bbsCate, String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, sysdate, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsCate);
			pstmt.setString(3, bbsTitle);
			pstmt.setString(4, userID);
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);		// bbsAvailable 함수
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;		// 데이터베이스 오류
	} 
	
	public ArrayList<Bbs> getList(int startRow, int pageSize) { //가변길이 배열 생성
		String SQL = "SELECT * FROM bbs where bbsID > ? AND bbsID <= ? and bbsavailable = '1' order by bbsID desc";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {  
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsCate(rs.getString(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setUserID(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				bbs.setBbsContent(rs.getString(6));
				bbs.setBbsAvailable(rs.getInt(7));
				list.add(bbs);  // list에 해당 인스턴스를 넣어서 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	public int getTotal() { // 전체 글의 수 얻기
		int cnt = 0;
		String SQL = "select count(*) cnt from bbs where bbsavailable = '1'";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1); // 데이터가 없으면 null이고 return 값이 0이 된다
				return cnt;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	} 
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM bbs where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID); 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsCate(rs.getString(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setUserID(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				bbs.setBbsContent(rs.getString(6));
				bbs.setBbsAvailable(rs.getInt(7));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;		
	} 
	
	
	public int update(int bbsID, String bbsTitle, String bbsContent, String bbsCate) {
		String SQL = "UPDATE bbs SET bbsCate = ?, bbsTitle = ?, bbsContent = ? where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsCate);
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContent);
			pstmt.setInt(4, bbsID);	
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	} 
	
	
	public int delete(int bbsID) {
		String SQL = "UPDATE bbs SET bbsAvailable = 0 where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);	
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	} 
	
}