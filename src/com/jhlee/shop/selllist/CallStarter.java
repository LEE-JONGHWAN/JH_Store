package com.jhlee.shop.selllist;

import java.sql.SQLException;

public class CallStarter {

	public static void main(String[] args) {
		try {
		StringBuilder sb = new StringBuilder();
		sb.append("환영합니다. JH_Store에 어서오세요.");
		sb.append("=".repeat(30));
		sb.append("sellform");
		sb.append("=".repeat(30));
		sb.append(0);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
