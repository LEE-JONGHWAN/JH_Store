package com.jhlee.shop.selllist;

import java.io.File;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SellDVO  implements Serializable {
	private static final long serialVersionUID = 7382410727665515038L;
	
	private Integer sellsr;
	private String sellbrand;
	private String sellkinds;
	private String selldata;
	private File sellinfo;
	private File sellimage;
	private Date sellcreate;
	
	
	
	public SellDVO(String sellbrand, String sellkinds, 
			String selldata, File sellinfo, File sellimage,
			Date sellcreate) {
		super();
		this.sellbrand = sellbrand;
		this.sellkinds = sellkinds;
		this.selldata = selldata;
		this.sellinfo = sellinfo;
		this.sellimage = sellimage;
		this.sellcreate = sellcreate;
	}
	
	@Override
	public String toString() {
		var sDate = new SimpleDateFormat("yyyy-MM-dd");
		String createstr = (sellcreate == null? "" : sDate.format(sellcreate));
		return "브랜드명 : " + sellbrand + ", 판매 상품 종류 : " + sellkinds + 
				", 판매 상품 용량 : " + selldata + ", 판매 상품 설명 : " + sellinfo
				+ ", 판매 상품 이미지 : " + sellimage 
				+ ", 판매 상품 등록일 : " + createstr + "]";
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
	public Date getSellcreate() {
		return sellcreate;
	}
	public void setSellcreate(Date sellcreate) {
		this.sellcreate = sellcreate;
	}
	
	
}
