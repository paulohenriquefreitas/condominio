package com.utils;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ConvertDates {
	
	public static java.sql.Date convertToSqlDate(String date, Integer interval){
		Date sqlStartDate = null;
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
		try {
			java.util.Date dt = sdf1.parse(date);
			sqlStartDate = new Date(dt.getTime());
		} catch (ParseException e) {
			System.out.println(e);
		}
		
		if(interval != null){
			Calendar cal = Calendar.getInstance();
			cal.setTime(sqlStartDate);
			cal.add(Calendar.MONTH,-interval);
			
			java.sql.Date sqlTommorow = new java.sql.Date(cal.getTimeInMillis());
			return sqlTommorow;
		}else{
			return sqlStartDate; 
		}
	}
	
	public static String convertSqlDateToString(Date date){
		String formattedDate = null;
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
		try {
			formattedDate = sdf1.format(date);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return formattedDate;
	}

}
