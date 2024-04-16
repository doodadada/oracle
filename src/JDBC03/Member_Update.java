package JDBC03;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;

public class Member_Update {
	public static void main(String[] args) throws ParseException {
		Scanner sc = new Scanner(System.in);

		System.out.print("수정할 회원의 번호를 입력하세요 : ");
		int membernum = Integer.parseInt(sc.nextLine());
		MemberDao mdao = new MemberDao();
		MemberDto mdto = mdao.getMember(membernum);

		if (mdto == null) {
			System.out.println("입력하신 번호의 회원이 목록에 존재하지 않습니다\n프로그램을 종료합니다.");
			return;
		}

		System.out.printf("이름 : %s\n수정할 이름을 입력하세요(수정하지 않으면 Enter 입력) : ", mdto.getName());
		String name = sc.nextLine();
		if (!name.equals(""))
			mdto.setName(name);

		System.out.printf("전화번호 : %s\n수정할 전화번호를 입력하세요(수정하지 않으면 Enter 입력) : ", mdto.getPhone());
		String phone = sc.nextLine();
		if (!phone.equals(""))
			mdto.setPhone(phone);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.printf("생년월일 : %s\n수정할 생년월일 입력하세요(YYYY-MM-DD)(수정하지 않으면 Enter 입력) : ", mdto.getBirth());
		String input = sc.nextLine();
		if (!input.equals("")) {
			java.util.Date d = sdf.parse(input);
			
			// java.util.Date 를 java.sql.Date로 변환
			// d.getTime()을 java.sql.Date의 생성자의 전달인수로 넣습니다
			java.sql.Date birth = new java.sql.Date(d.getTime());
			mdto.setBirth(birth);
			
			// 생년월일이 수정되면 나이도 자동으로 수정
			Calendar today = Calendar.getInstance(); //오늘 날짜
			Calendar c = Calendar.getInstance();
			c.setTime(d); 
			//java.util.Date -> Calendar 변환
			int age = today.get(Calendar.YEAR) - c.get(Calendar.YEAR);
			mdto.setAge(age);
		}
		
		System.out.printf("성별 : %s\n수정할 성별을 입력하세요(M/F)(수정하지 않으면 Enter 입력) : ", mdto.getGender());
		String gender = sc.nextLine();
		if (!gender.equals(""))
			mdto.setGender(gender);
		
		System.out.printf("사은포인트 : %d\n수정할 사은포인트를 입력하세요(수정하지 않으면 Enter 입력) : ", mdto.getBpoint());
		int bpoint = Integer.parseInt(sc.nextLine());
		if (bpoint!=0)
			mdto.setBpoint(bpoint);

		int result = mdao.updateMember(mdto);
		
		if (result == 1) {
			System.out.println("레코드 수정 성공");
		} else {
			System.out.println("레코드 수정 실패");
		}

	}
}
