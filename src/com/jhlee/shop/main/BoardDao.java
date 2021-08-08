package com.jhlee.shop.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
public class BoardDao {
 

	
    private Connection conn; //DB 커넥션 연결 객체
    private static final String USERNAME = "myself";//DBMS접속 시 아이디
    private static final String PASSWORD = "1234";//DBMS접속 시 비밀번호
    private static final String URL = "jdbc:mysql//localhost:3305/test";//DBMS접속할 db명
    private static final String driver = "org.mariadb.jdbc.Driver";
    public BoardDao() {
        try {
            System.out.println("생성자");
            Class.forName(driver);
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("드라이버 로딩 성공");
        } catch (Exception e) {
            System.out.println("드라이버 로딩 실패 ");
            try {
                conn.close();
            } catch (SQLException e1) {    }
        }
        
        
    }
    
    public void insertBoard(){
        //쿼리문 준비
        String sql = "insert into board values(?,?,?,?,?,?)";
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, null);
            pstmt.setString(2, "안녕하세요");
            pstmt.setString(3, "1111");
            pstmt.setString(4, "공개");
            pstmt.setString(5, "홍길동");
            pstmt.setString(6, "반갑습니다.");
            
            int result = pstmt.executeUpdate();
            if(result==1) {
                System.out.println("Board데이터 삽입 성공!");
                
            }
            
        } catch (Exception e) {
            System.out.println("Board데이터 삽입 실패!");
        }    finally {
            try {
                if(pstmt!=null && !pstmt.isClosed()) {
                    pstmt.close();
                }
            } catch (Exception e2) {}
        }
        
        
    }
    
}
 
