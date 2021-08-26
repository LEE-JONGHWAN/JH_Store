package com.jhlee.shop.selllist;

import java.io.File;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

public class SellDVO  implements Serializable {
	private static final long serialVersionUID = 7382410727665515038L;
	
	private Integer sellsr;
	private String sellbrand;
	private String sellkinds;
	private String selldata;
	private int sellinven;
	private int sellprice;
	private File sellinfo;
	private File sellimage;
	private LocalDate sellcreate;
	private Integer bksr;
	private Integer sellusr;


	@Override
	public String toString() {
		var sDate = new SimpleDateFormat("yyyy-MM-dd");
		String createstr = (sellcreate == null? "" : sDate.format(sellcreate));
		return "리스트 번호 : " + sellsr +", 브랜드명 : " + sellbrand + ", 판매 상품 종류 : " + sellkinds + 
				", 판매 상품 용량 : " + selldata + ", 판매 재고량 : " + sellinven + 
				", 판매 가격 : " + sellprice + ", 판매 상품 설명 : " + sellinfo 
				+ ", 판매 상품 이미지 : " + sellimage + ", 판매 상품 등록일 : " + createstr + ", 장바구니 번호 : " + bksr
				+ ", 판매자 번호 : " + sellusr + "]";
	}


	public Integer getSellsr() {
		return sellsr;
	}


	public void setSellsr(Integer sellsr) {
		this.sellsr = sellsr;
	}


	public String getSellbrand() {
		return sellbrand;
	}


	public void setSellbrand(String sellbrand) {
		this.sellbrand = sellbrand;
	}


	public String getSellkinds() {
		return sellkinds;
	}


	public void setSellkinds(String sellkinds) {
		this.sellkinds = sellkinds;
	}


	public String getSelldata() {
		return selldata;
	}


	public void setSelldata(String selldata) {
		this.selldata = selldata;
	}


	public int getSellinven() {
		return sellinven;
	}


	public void setSellinven(int sellinven) {
		this.sellinven = sellinven;
	}


	public int getSellprice() {
		return sellprice;
	}


	public void setSellprice(int sellprice) {
		this.sellprice = sellprice;
	}


	public File getSellinfo() {
		return sellinfo;
	}


	public void setSellinfo(File sellinfo) {
		this.sellinfo = sellinfo;
	}


	public File getSellimage() {
		return sellimage;
	}


	public void setSellimage(File sellimage) {
		this.sellimage = sellimage;
	}


	public LocalDate getSellcreate() {
		return sellcreate;
	}


	public void setSellcreate(LocalDate localDate) {
		this.sellcreate = localDate;
	}


	public Integer getBksr() {
		return bksr;
	}


	public void setBksr(Integer bksr) {
		this.bksr = bksr;
	}


	public Integer getSellusr() {
		return sellusr;
	}


	public void setSellusr(Integer sellusr) {
		this.sellusr = sellusr;
	}

	
	
}
