package JDBC02;

import java.util.Scanner;

public class test {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		BookDto bdto = new BookDto();
		
//		System.out.print("제목을 입력하세요 : ");
//		bdto.setSubject(sc.nextLine());
//		System.out.print("출판년도을 입력하세요 : ");
//		bdto.setMakeyear(Integer.parseInt(sc.nextLine()));
//		System.out.print("입고가격을 입력하세요 : ");
//		bdto.setInprice(Integer.parseInt(sc.nextLine()));
//		System.out.print("대여가격을 입력하세요 : ");
//		bdto.setRentprice(Integer.parseInt(sc.nextLine()));
//		System.out.print("등급을 입력하세요 : ");
//		bdto.setGrade(sc.nextLine());
		
		//------------------------
		
//		System.out.print("제목을 입력하세요 : ");
//		bdto.setSubject(sc.nextLine());
//		System.out.print("출판년도을 입력하세요 : ");
//		bdto.setMakeyear(sc.nextInt());
//		System.out.print("입고가격을 입력하세요 : ");
//		bdto.setInprice(sc.nextInt());
//		System.out.print("대여가격을 입력하세요 : ");
//		bdto.setRentprice(sc.nextInt());
//		System.out.print("등급을 입력하세요 : ");
//		bdto.setGrade(sc.nextLine());
//		
//		System.out.println(bdto.toString());
		
		System.out.print("숫자입력하세용 : ");
		int a = sc.nextInt();
		System.out.println(a+"이(가) 출력됨");
		System.out.print("문자입력하세용 : ");
		String b = sc.nextLine();
		System.out.println(b+"이(가) 출력됨");
		System.out.println("프로그램 종료");
		
	}
}
