package study.j0805;

import java.util.Scanner;

public class Test01 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("수를 입력하세요? ");
		int su = scanner.nextInt();
		
		String str = "";
		if(su % 2 == 0) str = "짝수";
		else str = "홀수";
		
		System.out.println("입력받은 수 "+su+"는 "+str+"입니다.");
		
		scanner.close();
	}
}
