package Utill;

import java.io.Serializable;

public class Jutill implements Serializable {

	//근무지 숫자를 넣으면 그에 해당하는 주소로 변환해주는 함수
	public String locationChange(int loc) {
		
		String[] sloc = {"error","강남구","성동구","중랑구"};
		
		return sloc[loc];
	}
	
	//DB에서 받아온 Date타입의 String을 2020/02/13 형식으로 바꾸어 변환해주는 함수 
	public String ChangeDate(String date) {
		
		date = date.replace("-", "/");
		date = date.substring(0, 10);
		
		return date;
	}
	
}
