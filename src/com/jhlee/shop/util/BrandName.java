package com.jhlee.shop.util;

public enum BrandName {
	삼성전자(1),WesternDigital(2),씨게이트(3),샌디스크(4),종료(5);
	
	private int 단축키;
	
	public void set단축키(int 단축키) {
		this.단축키 = 단축키;
	}

	public int get단축키() {
		return 단축키;
	}

	private BrandName(int 단축키) {
		this.단축키 = 단축키;
	}
	@Override
	public String toString() {
		return name() + "(" + get단축키() + ")";
	}
}
