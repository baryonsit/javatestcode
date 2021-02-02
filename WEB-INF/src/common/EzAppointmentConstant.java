package common;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class EzAppointmentConstant {
	
	public static final String SCHOOLADMIN = "34";
	public static final String TEACHER = "2";
	public static final String STUDENT = "3";
	public static final String PARENT = "102";
	public static final String INSTITUTEADMIN = "5";
	public static final String SUPERADMIN = "4";
	public static final String PRINCIPAL = "1";


	
	
	// Date Format
	public static final String DATE_FORMAT = "yyyy-MM-dd";
	public static final String STRINGDATEFORMAT = "dd-M-yy";
	public static final String STRINGDATEFORMATER = "dd-MMM-yyyy";
	public static final List<String> COMMONROLE = new ArrayList<String>( Arrays.asList(TEACHER, PRINCIPAL, SCHOOLADMIN,STUDENT) );

	
}
