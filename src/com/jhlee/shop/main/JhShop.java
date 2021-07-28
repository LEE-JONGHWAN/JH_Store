package com.jhlee.shop.main;


import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Scanner;
import java.util.logging.Logger;

import com.jbpark.dabang.module.AddressMan;
import com.jbpark.utility.JLogger;


class DBLogin {
	private static Logger logger = null; 
	
	private static Connection conn = getConnection();
	
	public static Connection getConnection() {
		Connection conn = null;
		String userName = "myself";
		String password = "1234";
		String url = "jdbc:mariadb://localhost:3306/jb_dabang";
		String driver = "org.mariadb.jdbc.Driver";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userName, password);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
public class JHShop {
	private static Logger logger = JLogger.getLogger();
	
	private static Connection conn = null;

	static {
		conn = DBLogin.getConnection();
		if (conn != null)
			logger.info("Connection is successful");
	};
	
	public static void main(String[] args) {
			SelectionSpace();
	}	
	
	private static void SelectionSpace() {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("=".repeat(40));
		System.out.println("JH스토어에 오신걸 환영합니다.");
		System.out.println("=".repeat(40));
		System.out.println("상품을 골라주세요.");
		System.out.println("=".repeat(40));
		System.out.println("1.삼성전자|2.WesternDigital|3.씨게이트|4.샌디스크|5.종료");
        System.out.println("=".repeat(40));
        System.out.print("입력>");
        int putt = sc.nextInt();
        while(true) {
        if(putt==1) {
        	System.out.println("삼성전자 메뉴로 이동합니다.");
        	showSleepTime();
        	samsungArea();
        }
        if(putt==2) {
        	System.out.println("Western Digital 메뉴로 이동합니다.");
        	showSleepTime();
        	westernDigitalArea();
        }
        if(putt==3) {
        	System.out.println("씨게이트 메뉴로 이동합니다.");
        	showSleepTime();
        	seaGateArea();
        }
        if(putt==4) {
        	System.out.println("샌디스크 메뉴로 이동합니다.");
        	showSleepTime();
        	sanDiskArea();
        }
        if(putt==5) {
        	System.out.println("쇼핑을 종료합니다.");
        		break;
        	}
        }
        sc.close();
	}
	
	/**
	 * 
	 * @return 브랜드를 선택한 후 다음으로 넘어갈 때, 웨이팅 "."을 표시해준다.
	 * 
	 */
	private static void showSleepTime() {
		for(int i =0; i < 3; i++) {
			try {
				Thread.sleep(300);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(".");
		}
	}
	
	/**
	 * 
	 * @return 삼성전자 에리어 선택 후에 용량 메소드로 이동.
	 * 
	 */
	private static void samsungArea() {
		System.out.println("=".repeat(30));
		System.out.println("삼성전자의 코너입니다.");
		System.out.println("=".repeat(30));
		daTaSelection();
	}
	/**
	 * 
	 * @return WesternDigitalArea 선택 후에는 용량 메소드로 이동.
	 * 
	 */
	private static void westernDigitalArea() {
		System.out.println("=".repeat(30));
		System.out.println("WesternDigital의 코너입니다.");
		System.out.println("=".repeat(30));
		daTaSelection();
	}
	
	/**
	 * 
	 * @return WesternDigitalArea 선택 후에는 용량 메소드로 이동.
	 * 
	 */
	private static void sanDiskArea() {
		System.out.println("=".repeat(30));
		System.out.println("샌디스크의 코너입니다.");
		System.out.println("=".repeat(30));
		daTaSelection();		
	}

	/**
	 * 
	 * @return WesternDigitalArea 선택 후에는 용량 메소드로 이동.
	 * 
	 */
	private static void seaGateArea() {
		System.out.println("=".repeat(30));
		System.out.println("씨게이트의 코너입니다.");
		System.out.println("=".repeat(30));
		daTaSelection();		
	}

	
	/**
	 *  250|500|1T로 나누어져 있다. 
	 * switch case 와 Scanner를 이용해서 출력하고 있다.
	 */
	private static void daTaSelection() {
		Scanner sc = new Scanner(System.in);
		for(int i =0; i < 3; i++) {
			try {
				Thread.sleep(300);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(".");
		}
		System.out.println("용량을 선택해주세요.");
		System.out.println("=".repeat(30));
		System.out.println("1.250GB|2.500GB|3.1TB");
		int daTa = sc.nextInt();
		switch(daTa) {
		case 1 : 
			System.out.println("250GB를 선택하셨습니다.");
			exitSelection();
		case 2 :
			System.out.println("500GB를 선택하셨습니다.");
			exitSelection();
		case 3 :
			System.out.println("1TB를 선택하셨습니다.");
			exitSelection();
		}
		sc.close();
	}
	
	
	/**
	 * 종료하기 위해 오는 메소드 공간.
	 * 여기서 종료를 시킬지 말지를 결정하게 만들어보자.
	 */
	private static void exitSelection() {
		Scanner sc = new Scanner(System.in);
		for(int i = 0; i < 3; i++) {
			try {
				Thread.sleep(300);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(".");
		}
		System.out.println("선택을 종료하시겠습니까?");
		System.out.println("1.종료|2.다시시작");
		int tRy = sc.nextInt();
		switch(tRy) {
			
		case 1 :
			System.out.print("쇼핑을 종료합니다.");
			System.exit(0);
			
		case 2 :
			System.out.println("처음으로 돌아갑니다.");
			SelectionSpace();
		}
		sc.close();
	}
}

