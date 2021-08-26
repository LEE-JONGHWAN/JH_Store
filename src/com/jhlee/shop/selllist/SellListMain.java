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



public class SellListMain {
	
	private static Date getDate(int year,int month,int date){
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR, year);
	    cal.set(Calendar.MONTH, month-1);
	    cal.set(Calendar.DAY_OF_MONTH, date);
	    return cal.getTime();
	}
	
	public static void main(String[] args) {
		try {
			ClassPathXmlApplicationContext appContext =
				new ClassPathXmlApplicationContext(
				  new String[]{"applicationContext-myBatis.xml"});
			
			SellDAO sellDaoImpl =
					(SellDAO)appContext.getBean("sellDaoImpl");
			
			
			/**
			 * 모든 상품 정보 출력
			 */
//			List <SellDVO> allDatas = sellDaoImpl.getAllData();
//			allDatas.forEach(System.out::println);
			
			/**
			 * 상품 정보를 입력한다.
			 */
			SellDVO newhd = new SellDVO();

			newhd.setSellbrand("삼성전자");
			newhd.setSellkinds("HDD");
			newhd.setSelldata("500GB");
			newhd.setSellcreate(LocalDate.now());
			newhd.setSellprice(80_000);
			
			int petId = sellDaoImpl.insertHard(newhd);
			System.out.println("ID: " + petId);
	
		}  catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}

//			/**
//			 * 애완동물 목록 길이 출력
//			 */
//			List <SellDVO> pets = petDaoImpl.getAllPetsData();
//			System.out.println("--- pets ---" + pets.size());
//			
//			/**
//			 * 애완동물 이름으로 찾아 출력
//			 */
//			SellDVO pet = petDaoImpl.getPetObject("나비");
//			System.out.println("--- 애완동물 ---");
//			System.out.println(pet);
//			
//			/**
//			 * 모든 애완 동물 정보 출력
//			 */
//			List <PetDVO> allPets = petDaoImpl.getAllPetsData();
//			allPets.forEach(System.out::println);
//			
//			/**
//			 * 모든 애완 동물 종류를 출력
//			 */
//			List <String> species = petDaoImpl.getAllSpecies();
//			for (String animal : species) {
//				System.out.println(animal);
//			}
//			
//			/**
//			 * 모든 애완 동물 암수 구별 목록 채취
//			 */
//			List <PetDVO> genderPets = petDaoImpl.petsByGender("f");
//			genderPets.forEach(System.out::println);
//			
//			/**
//			 * 애완동물 생성하여 삽입
//			 */
//			PetDVO newPet = new PetDVO();
//
//			newPet.setBirth(Util.getDate("1992-01-03")); // JB_module 프로젝트 Util 클래스
//			newPet.setDeath(null);
//			newPet.setName("Rolf");
//			newPet.setOwner("종범3");;
//			newPet.setSex('m');;
//			newPet.setSpecies("개");
//			
//
//			int petId = petDaoImpl.insertPet(newPet);
//			System.out.println("ID: " + petId);
//
//			/**
//			 * 투캅스 정보를 일부 수정한다. 투캅스 두 마리 청와대 입양 반영
//			 * 수정(갱신) 후, 그 동물의 정보를 출력
//			 */
//			PetDVO petDataObj = new PetDVO();
//			String name = "Rolf";
//
//			petDataObj.setOwner("자연인");
//			petDataObj.setName(name);
//			petDataObj.setDeath(null);
//			petDataObj.setId(petId);
//
//			petDaoImpl.updatePetData(petDataObj);	
////			PetDVO changedPet = petDaoImpl.getPetObject(petId); // 행1
//			System.out.println("--- 애완동물 ---"); // 행2
////			System.out.println(changedPet); // 행3

