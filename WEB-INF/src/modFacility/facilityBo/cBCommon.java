package modFacility.facilityBo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;

import modFacility.facilityDo.cDCommonFacility;
import modLogger.cBLogger;

public class cBCommon {
	public ArrayList cBgetFacilityDetails(String facility_id) {
		cDCommonFacility cDFacility = new cDCommonFacility();
		ArrayList facilitylist = new ArrayList();
		facilitylist=cDFacility.getFacilityFromDB(facility_id);
		return facilitylist;
	}
	
	public ArrayList cBgetTimeSlotDetails(String facility_id) {
		cDCommonFacility cDFacility = new cDCommonFacility();
		ArrayList timeslotlist = new ArrayList();
		ArrayList slot = new ArrayList();
		timeslotlist.clear();
		slot.clear();
		timeslotlist=cDFacility.getTimeSlotsFromDB(facility_id);
		
		slot=cBTimeSlot(timeslotlist);
		return slot;
	}
	public ArrayList cBTimeSlot( ArrayList timeslotlist)
	{
		ArrayList slot = new ArrayList();
		slot.clear();
		DateFormat tm = new SimpleDateFormat("HH:mm:ss");
		String startTime,endTime,slotTime;
		String split;
		int mm=0,s=0;
		//startTime="10:00:00";
		startTime=timeslotlist.get(0).toString();
		endTime=timeslotlist.get(1).toString();
		split = timeslotlist.get(2).toString();
		slotTime=timeslotlist.get(2).toString();
		
		Calendar sttime=Calendar.getInstance();
		Calendar entime=Calendar.getInstance();
		Calendar slotMiu=Calendar.getInstance();
		try
		{
			sttime.setTime(tm.parse(startTime));
			entime.setTime(tm.parse(endTime));
			slotMiu.setTime(tm.parse(slotTime)); //parseDouble
			
			double mins = 60*(slotMiu.get(Calendar.HOUR) ) +(slotMiu.get(Calendar.MINUTE)) + (1/60.0)*(slotMiu.get(Calendar.SECOND));
			mm=(int)mins;
		
			if(sttime.get(Calendar.MINUTE)==0){
				if((sttime.get(Calendar.HOUR_OF_DAY)<10)) {
				slot.add("0"+(sttime.get(Calendar.HOUR_OF_DAY)+":"+"00"));
				}
				else {
					slot.add((sttime.get(Calendar.HOUR_OF_DAY)+":"+"00"));
				}
			}
			else
			{
				if((sttime.get(Calendar.HOUR_OF_DAY)<10)) {
			slot.add("0"+(sttime.get(Calendar.HOUR_OF_DAY)+":"+sttime.get(Calendar.MINUTE)));
				}
				else {
					slot.add((sttime.get(Calendar.HOUR_OF_DAY)+":"+sttime.get(Calendar.MINUTE)));
				}
			}
			while(sttime.compareTo(entime)<0)
			{
				sttime.add(Calendar.MINUTE, +mm);
				
				if(sttime.get(Calendar.MINUTE)==0)
				{
					if((sttime.get(Calendar.HOUR_OF_DAY))<10) {
					slot.add("0"+(sttime.get(Calendar.HOUR_OF_DAY)+":"+"00"));
					}
					else {
					slot.add((sttime.get(Calendar.HOUR_OF_DAY)+":"+"00"));
					}
				}
				else
				{
					if((sttime.get(Calendar.HOUR_OF_DAY))<10) {
						slot.add("0"+(sttime.get(Calendar.HOUR_OF_DAY)+":"+sttime.get(Calendar.MINUTE)));
						}
					else {
				slot.add((sttime.get(Calendar.HOUR_OF_DAY)+":"+sttime.get(Calendar.MINUTE)));
					}
				}
				s++;
			}
		
		}
		catch(Exception ecc)
		{
			cBLogger.error("Class Name: cBCommon , Function : cBTimeSlot , Error:", ecc);	

		}
		return slot;
	}
	public String getweekholiday(String facility_id) {
		String Weekholiday ="";
		cDCommonFacility cDFacility = new cDCommonFacility();
		Weekholiday = cDFacility.getweekholiday(facility_id);
		return Weekholiday;
		
	}
	public Hashtable getoptholidays(String facility_id) {
		Hashtable optholiday = new Hashtable();
		cDCommonFacility cDFacility = new cDCommonFacility();
		optholiday = cDFacility.getoptholidays(facility_id);
		return optholiday;
		
	}
	
}
