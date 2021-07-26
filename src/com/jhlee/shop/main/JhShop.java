package com.jhlee.shop.main;

import java.awt.Toolkit;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

import com.jhlee.shop.util.Menu;


public class JhShop {

	/*
	 * 로그를 저장하는 장소를 만든다.
	 */
	
	public static void main(String[] args) {
		//실행할 메소드 및 클래스의 간략한 소스만 넣는다.
		var jShop = new JhShop(); 
		try (Scanner sc = new Scanner(System.in)) {
			while (true) {
				jShop.WonderSelection(sc);
				for (int i = 0; i<3; i++) {
					System.out.println(".");
					try {
						Thread.sleep(200);
					} catch (InterruptedException e) {}
				}
			}
		}

		
	}
	
	/*
	 * 여기에는 선택할 공간을 넣는 메소드를 제작한다.
	 */
	private void WonderSelection(Scanner sse) {
		Scanner sec = new Scanner(System.in);
		System.out.println(" " + "=".repeat(20));
		System.out.println("|" + " 어서오세요~ 원더랜드에~ " + "|");
		System.out.println(" " + "=".repeat(20));
		
		Menu type = null;
		
		System.out.println("상품을 선택해 주세요~~");
		sec.nextLine();

	}
	
	/*
	 * 여기는 그 선택한 공간이 적합한지를 선택하는
	 * boolean형을 사용한다.
	 */
	
	
	/*
	 * 선택이 적합하다면 sql문을 
	 * 이용해서 데이터베이스에 입력한다.
	 */
	
	

}
