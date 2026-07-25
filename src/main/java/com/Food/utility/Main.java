package com.Food.utility;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Main {
	
	public static void main(String[] args) {
		
		LocalDate ld = LocalDate.now();
		System.out.println(ld);
		System.out.println(ld.getDayOfMonth());
		System.out.println(ld.getMonthValue());
		System.out.println(ld.getYear());
		
		System.out.println(LocalDateTime.now());
		
		
		
		
	}

}