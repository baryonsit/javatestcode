package modAdmin.adminBo;

import java.util.ArrayList;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import modAdmin.adminDo.cDViewAppointments;
import modAdmin.adminVo.cVViewAppointments;
import modCommon.commonDo.cDCommon;
import modCommon.commonDo.cDDisplayBusinessAndFacilities;

import org.apache.commons.lang3.StringUtils;


public class cBViewAppointments{
	
	
	//required for displaying the proper messages on success or failure of operations.
	//HttpServletRequest req;
	//HttpSession session = req.getSession();
	
	
	public ArrayList getAppointmentsList(String search_key,String id,String roleid,int schoolId) {

		cDViewAppointments objDoAppList = new cDViewAppointments();
		
		ArrayList AppListarr = new ArrayList();
		
		if(search_key.equals("loadall")){
			
			AppListarr = objDoAppList.getAppointmentListHere(search_key,id,roleid,schoolId);			
		}
		return AppListarr;
	}
	
	
	public Hashtable<String,ArrayList<String>> searchUserByAdmin(cVViewAppointments objVoSearch,HttpServletRequest req) {

		cDViewAppointments objDoAppList = new cDViewAppointments();
	
		String facility=objVoSearch.getFilterfac();
		String status=objVoSearch.getFilterstatus();
		String startdate=objVoSearch.getFromdate();
		String enddate=objVoSearch.getTodate();
		String search_key=objVoSearch.getSearch();
		cDCommon obj = new cDCommon();
		String fromdate=obj.getDateFormatterToDB1(startdate);
		String todate=obj.getDateFormatterToDB1(enddate);
		
		String string1 = "";
		
		if(facility.equalsIgnoreCase("Select Facility") && status.equalsIgnoreCase("Select Status") && fromdate.equalsIgnoreCase("From Date") && todate.equalsIgnoreCase("To Date") && StringUtils.isEmpty(search_key)){
			string1 = "concat(s.first_name,s.middle_name,s.last_name) like '%" + search_key + "%'";
		}
		if(StringUtils.isNotEmpty(search_key)){
			string1 = "concat(s.first_name,s.middle_name,s.last_name) like '%" + search_key + "%'";
		}
		if(!facility.equalsIgnoreCase("Select Facility")){
			if(StringUtils.isEmpty(string1)){
				string1 = "f.facility_id='" + facility + "'";
			}
			else{
				string1=string1+" and f.facility_id='" + facility + "'";
			}
		}
		if(!status.equalsIgnoreCase("Select Status")){
			if(StringUtils.isEmpty(string1)){
				string1 = "appointment_status='" + status + "'";

			}
			else{
				string1=string1+" and appointment_status='" + status + "'";
			}
		}
		if(!startdate.equalsIgnoreCase("From Date") && !enddate.equalsIgnoreCase("To Date")){
			if(StringUtils.isEmpty(string1)){
				string1 = "a.appoint_from_date='" + fromdate + "'";

			}
			else{
				
				string1=string1+" and a.appoint_from_date>='" + fromdate + "' and a.appoint_to_date<='" + todate +"'";
			}
		}
		if(!startdate.equalsIgnoreCase("From Date")){
			if(StringUtils.isEmpty(string1)){
				string1 = "a.appoint_from_date='" + fromdate + "'";

			}
			else{
				string1=string1+" and a.appoint_from_date='" + fromdate + "'";
			}
		}
		if(!enddate.equalsIgnoreCase("To Date")){
			if(StringUtils.isEmpty(string1)){
				string1 = "a.appoint_to_date='" + todate + "'";

			}
			else{
				string1=string1+" and a.appoint_to_date='" + todate + "'";
			}
		}
		
		
		Hashtable<String, ArrayList<String>> arr;
		
		arr = objDoAppList.getAdminSearchResult(string1,objVoSearch,req);
		return arr;
	}
	
	public ArrayList getFacilityList(String userid,String roleid) {

		cDViewAppointments objDoAppList = new cDViewAppointments();
		
		ArrayList FacilityListarr = new ArrayList();
		FacilityListarr = objDoAppList.getFacilityList(userid,roleid);
		return FacilityListarr;
	}

	
	public int updateBusinessUserStatus(HttpServletRequest req,String up_uid,String up_status,String appoint_id) {

		cDViewAppointments objDoAppList = new cDViewAppointments();
		
		HttpSession session = req.getSession();
		int result = 0;
		result = objDoAppList.updateStatusByAdmin(up_uid,up_status,appoint_id);
		
		if(result==1){
			session.setAttribute("message", "User Appointment has been updated successfully.");
		}
		else if(result==2){
			session.setAttribute("message", "User Appointment has been cancelled and the mail has been sent to invitees.");
		}
		else if(result==3){
			session.setAttribute("message", "User Appointment has been cancelled and the mail not been sent to invitees.");
		}

		return result;
	}
	
	
	// To appointment details by facilityId
	public ArrayList fetchAppointmentDetailsByfacId(String userId, String fac_id,String appointmentId) {
		cDViewAppointments objDoAppList = new cDViewAppointments();
		ArrayList appointment_details = new ArrayList();
		appointment_details = objDoAppList.getAppointmentDetails(userId, fac_id,appointmentId);
		return appointment_details;
	}
	
}