package com.jhlee.shop.util;

public enum Menu {
	하루이용권("ㅎ"),반일이용권("ㅂ");
	// 예문 : 부동산 일 경우 => 아파트, 단독, 빌라, 원룸, 투룸, 오피스텔 등등
	
	private String 단축명;

	public String get단축명() {
		return 단축명;
	}

	private Menu(String 단축명) {
		this.단축명 = 단축명;
	}
	
	@Override
	public String toString() {
		return name() + "(" + get단축명() + ")";
	}
	

}
