package com.jhlee.shop.main;


import java.util.Scanner;


public class TestMain {

	public static void main(String[] args) {
		var testMain = new TestMain(); 
		Scanner sc = new Scanner(System.in);
		
		System.out.println("=".repeat(40));
		System.out.println("JH스토어에 오신걸 환영합니다.");
		System.out.println("=".repeat(40));
		System.out.println("상품을 골라주세요.");
		
		System.out.println("=".repeat(40));
		System.out.println("1.삼성전자|2.웬즈데이|3.씨게이트|4.샌디스크|5.종료");
//		for (BrandName i:bNs) {
//            System.out.printf("%s",i);
//		System.out.println();
//		}
        System.out.println("=".repeat(40));
        System.out.print("입력>");
        int putt = sc.nextInt();
        while(true) {
        if(putt==1) {
        	System.out.println("삼성전자 메뉴로 이동합니다.");
        	SamsungArea();
        }
//        if(putt==2) {
//        	System.out.println("웬즈데이 메뉴로 이동합니다.");
//        }
//        if(putt==3) {
//        	System.out.println("씨게이트 메뉴로 이동합니다.");
//        }
//        if(putt==4) {
//        	System.out.println("샌디스크 메뉴로 이동합니다.");
//        }
        if(putt==5) {
        	System.out.println("스토어를 종료합니다.");
        		break;
        	}
        }  
	}

	/**
	 * 250|500|1T로 나누어져 있다. 
	 * switch case 와 Scanner를 이용해서 출력하고 있다.
	 * 삼성전자 용량 선택 에리어 선택 후에는 다른 곳으로 이동.
	 * 
	 */
	private static void SamsungArea() {
		Scanner sc = new Scanner(System.in);
		System.out.println("=".repeat(30));
		System.out.println("삼성전자 코너입니다.");
		System.out.println("=".repeat(30));
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
			break;
		case 3 :
			System.out.println("1TB를 선택하셨습니다.");
			break;
		}
		
	}

	/**
	 * 종료하기 위해 오는 메소드 공간.
	 * 여기서 종료를 시킬지 말지를 결정하게 만들어보자.
	 */
	private static void exitSelection() {
		System.out.println("용량을 선택하셨습니다.");
		System.out.print("프로그램을 종료합니다.");
		System.exit(0);
		
		
	}
}

