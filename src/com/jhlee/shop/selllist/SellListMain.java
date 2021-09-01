package com.jhlee.shop.selllist;

import java.io.InputStream;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.SellDAO;
import model.SellDVO;





public class SellListMain {
	
	private static Date getDate(int year,int month,int date){
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR, year);
	    cal.set(Calendar.MONTH, month-1);
	    cal.set(Calendar.DAY_OF_MONTH, date);
	    return cal.getTime();
	}
	
	public static void main(String[] args) {

		
		
	
	}
}



