package javabean;

import java.util.Calendar;

public class oDate {
	public String get_date() {
		String date=null;
		Calendar cal=Calendar.getInstance(); 
		int y=cal.get(Calendar.YEAR);
		int m=cal.get(Calendar.MONTH)+1; 
		int d=cal.get(Calendar.DATE);
		date=y+"-"+m+"-"+d;
		return date;
	}
	 
}
