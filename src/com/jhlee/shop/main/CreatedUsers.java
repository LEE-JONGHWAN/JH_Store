package com.jhlee.shop.main;

import java.io.IOException;
import java.nio.file.NoSuchFileException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;




public class CreatedUsers {
	private static Logger logger = JLogger.getLogger();
	private static Connection conn = null;

	static {
		conn = DBLogin.getConnection();
		if (conn != null)
			logger.info("Connection is successful");
	};
	
	public static void main(String[] args) {
			Scanner sc = new Scanner(System.in);
			
			//formatter:off
			String iSql = "insert into "
					+ "회원명의(회원ID,회원이름,핸드폰번호,이메일) "
					+ "values(?,?,?,?)";
			//formatter:on
			
			System.out.println("회원아이디를 입력하세요.");
			System.out.print("입력>");
			String usrID = sc.nextLine();
			System.out.println("회원이름을 입력하세요.");
			System.out.print("입력>");
			String usrName = sc.nextLine();
			System.out.println("회원 핸드폰번호를 입력하세요.");
			System.out.print("입력>");
			String usrPhone = sc.nextLine();
			System.out.println("회원 이메일을 입력하세요.");
			System.out.print("입력>");
			String usrEmail = sc.nextLine();
			try {
				var iPs = conn.prepareStatement(iSql);
				
				iPs.setString(1, usrID);
				iPs.setString(2, usrName);
				iPs.setString(3, usrPhone);
				iPs.setString(4, usrEmail);
				
				int inserted = iPs.executeUpdate();
				logger.config("주문 DB 저장 건수: " + inserted);
				logger.config("회원ID: "+ usrID + "회원이름: " + usrName + "\n" 
						+ "회원 핸드폰번호: " + usrPhone +"회원 이메일: " + usrEmail);
			} catch (SQLException e) {
				e.printStackTrace();
				logger.severe(e.getMessage());
			}
			
		}
	}



