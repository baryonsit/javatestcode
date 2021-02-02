package modAppointment.appointmentBo;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;

import modAppointment.appointmentDo.cDCommonAppoint;
import modLogger.cBLogger;

	public class cBCommonAppoint
	{
		Hashtable appdttm= new Hashtable();
		
		public Hashtable cBgetAppointDetails(String facility_id,int month,int year,int daysInMonths) {
			appdttm.clear();
			cDCommonAppoint cDAppoint = new cDCommonAppoint();
			
			DateFormat tmm = new SimpleDateFormat("yyyy-MM-dd");
			String facilitySlot=cDAppoint.getSlotFromDB(facility_id);
			ArrayList<ArrayList<String>> AllDates = new ArrayList<ArrayList<String>>();
			AllDates.clear();
			AllDates=cDAppoint.getAppFromToDateFromDB(facility_id,month,year);
			for(int i=0;i<AllDates.size();i++){
				String key;
				String newkey;
				ArrayList<String> times=new ArrayList<String>();
				times.clear();
				ArrayList<String> alldates=new ArrayList<String>();
				alldates=(ArrayList<String>)AllDates.get(i);
				
				if((alldates.get(8).toString()).equals("0")){
					key=alldates.get(5);
					if(!appdttm.containsKey(alldates.get(5))){
						appdttm.put(key,times);
					}
					
					this.Filltimes(key,alldates.get(3),alldates.get(4),facilitySlot,alldates.get(2));
					
				}else{
					try {
						Calendar frm=Calendar.getInstance();
						frm.setTime(tmm.parse(alldates.get(5)));
						
						Calendar to=Calendar.getInstance();
						to.setTime(tmm.parse(alldates.get(6)));
						while(frm.compareTo(to)<=0){
							if((frm.get(Calendar.MONTH)+1)<10)
							{
								key=String.valueOf(frm.get(Calendar.YEAR))+"-"+"0"+String.valueOf(frm.get(Calendar.MONTH)+1)+"-"+(frm.get(Calendar.DATE));
							}
							else
							{
								key=String.valueOf(frm.get(Calendar.YEAR))+"-"+String.valueOf(frm.get(Calendar.MONTH)+1)+"-"+(frm.get(Calendar.DATE));
							}
							if(!appdttm.containsKey(key)){
								appdttm.put(key,times);
							}
							Filltimes(key,alldates.get(3),alldates.get(4),facilitySlot,alldates.get(2));
							frm.add(Calendar.DATE,+1);
						}
						
					} catch (Exception e) {
						cBLogger.error("class name : cBCommonAppoint, Function : cBgetAppointDetails ,error : ", e);
						// TODO: handle exception
					}
				}
				alldates.clear();
			}
			return appdttm;
		}

public void Filltimes(String key,String fromTime,String toTime,String slot,String userid){
	ArrayList<String> temp=new ArrayList<String>();
	temp=(ArrayList<String>)this.appdttm.get(key);
	DateFormat tm = new SimpleDateFormat("HH:mm");
	String to=toTime;
	String from=fromTime;
	
	
	int minu1=getMinute(to);
	int minu2=getMinute(from);
	int slotDiff=getMinute(slot);
	int minuDiff=minu1-minu2;
	
	int numlop=0;
	numlop=minuDiff/slotDiff;
	//if(minuDiff==slotDiff)
	if(true)
	{
		temp.add(fromTime);
		temp.add(userid);
	}
	else if(minuDiff>slotDiff)
	{
		Calendar sttime=Calendar.getInstance();
		try
		{
			sttime.setTime(tm.parse(from));
		}
		catch(Exception ec)
		{
			cBLogger.error("class name : cBCommonAppoint, Function : Filltimes ,error : ", ec);
		}
		
		for(int n=0;n<(numlop-1);n++)
		{
			if(sttime.get(Calendar.MINUTE)==0)
			{
				temp.add((sttime.get(Calendar.HOUR_OF_DAY)+":"+"00"));
				temp.add(userid);
			}
			else
			{
				temp.add((sttime.get(Calendar.HOUR_OF_DAY)+":"+sttime.get(Calendar.MINUTE)));
				temp.add(userid);
			}
			sttime.add(Calendar.MINUTE, slotDiff);
		}
	}
	appdttm.put(key, temp);
}
		
public Hashtable cBgetAppointToDateDetails(String facility_id) 
{
	cDCommonAppoint cDAppoint = new cDCommonAppoint();
	return cDAppoint.getAppointToDateFromDB(facility_id);
}
		public int getMinute(String x)
		{
			int x1=0;
			DateFormat tm = new SimpleDateFormat("HH:mm");
			String tmuni=x;
			Calendar sttime=Calendar.getInstance();
			try
			{
				sttime.setTime(tm.parse(tmuni));
				double mins = 60*(sttime.get(Calendar.HOUR) ) +(sttime.get(Calendar.MINUTE));
				x1=(int)mins;
			}
			catch(Exception ecc)
			{
				cBLogger.error("class name : cBCommonAppoint, Function : getMinute ,error : ", ecc);	
			}
			return x1;
		}
		public int DateDiff(String fromdt, String todt)
		{
			int difference=0;
			try
			{
					Date date1 = getDate(fromdt);
					Date date2 = getDate(todt);	
					difference=(int)getDiffInDays(date1,date2);
			}
			catch(Exception ecc)
			{
				cBLogger.error("class name : cBCommonAppoint, Function : getMinute ,error : ",ecc);	
			}
			return difference;
		}
		public Date getDate(String date) throws Exception {
			SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
			return SDF.parse(date);
		}
		
		public Date getDateFromDateTime(String date) throws Exception {
			SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return SDF.parse(date);
		}
		
		
		public Calendar getCalenderDate(String date) throws Exception {
			SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
			String tmuni=date;
			Calendar sttime=Calendar.getInstance();
			sttime.setTime(SDF.parse(tmuni));
			return sttime;
		}
		
		public Calendar getCalenderDateTime(String date) throws Exception {
			SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String tmuni=date;
			Calendar sttime=Calendar.getInstance();
			sttime.setTime(SDF.parse(tmuni));
			return sttime;
		}
		
		public long getDiffInDays(Date d1, Date d2) {
			boolean isdiffGreaterThanYear = false;
			long diffInMilliSeconds = d2.getTime() - d1.getTime();
			return diffInMilliSeconds / (1000 * 60 * 60 * 24);

		}
		
		public Date getTime(String date) throws Exception {
			SimpleDateFormat SDF = new SimpleDateFormat("HH:mm");
			return SDF.parse(date);
		}
		
		public Date getTimeee(String date) throws Exception {
			SimpleDateFormat SDF = new SimpleDateFormat("HH:MM:ss");
			return SDF.parse(date);
		}
		
		public static boolean isValidTimeStr(String date) throws Exception{
		    try {
		     SimpleDateFormat df=new SimpleDateFormat("HH:mm"); // YYYY-MM-DD
		     df.setLenient(false);   // this is important!
		     df.parse(date);
		    }
		    catch (ParseException e) {
		    	cBLogger.error("Class name : cBCommonAppoint , function : isValidTimeStr, error : "+e);
		     return false;
		    }
		    catch (IllegalArgumentException e) {
		    	cBLogger.error("Class name : cBCommonAppoint , function : isValidTimeStr, error : "+e);
		     return false;
		    }
		    return true;
		  }
		
		
}
	