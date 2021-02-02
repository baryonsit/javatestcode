package modAdmin.adminDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.EzAppointmentConstant;
//import modEmp.bisDo.*;
import modAdmin.adminVo.cVViewAppointments;
import modCommon.commonBo.sendingMail;
import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;

public class cDViewAppointments {

	ArrayList subFlds = new ArrayList();
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	HttpSession session;
	
	public cDViewAppointments() {
		try
		{
			objConnMan= cDConnectionManager.getObjHandle();
			dbcon = objConnMan.openConnection();
			
			if (dbcon.con==null)
				connected=false;
			else
				connected= true;	
		}
		catch(Exception e)
		{
			cBLogger.error("Data Base Access Problem", e);
		}
	}
	
	
	public ArrayList getAppointmentListHere(String search_key,String buid,String roleid,int schoolId) {
		ArrayList arr = new ArrayList();
		ArrayList arr1 = new ArrayList();
		if (connected) {
			ResultSet rr=null;
			ResultSet rrr=null;
			ResultSet rrr1=null;
			ResultSet rs=null;
			try {
					int bid=0;
					String bidquery = "";
					String selectQuery = "";
					
					if(roleid.equals(EzAppointmentConstant.TEACHER)) {
						/*bidquery = "select business_id from tb_business where user_id='"+buid+"'";
						
						rr = dbcon.con.createStatement().executeQuery(bidquery);
						while (rr.next()) {
							bid = rr.getInt(1);	
						}*/
						selectQuery = "select concat(s.first_name,' ',s.middle_name,' ',s.last_name),tcm.class_master_name,a.appointment_status,a.appoint_from_date,a.appoint_to_date,a.appoint_from_time,a.appoint_to_time,f.facility_id,f.facility_name,a.appoint_id,ca.category_name,tsm.section_master_desc from tb_student s,tb_appointment a,tb_facilities f,tb_category ca,tb_section_master tsm,tb_class_master tcm,tb_classes cls  where f.user_id='"+buid+"' and  s.student_id=a.user_id and f.facility_id=a.facility_id and ca.category_id=f.facilitycategory and tcm.class_master_id = cls.class_id and s.reg_for_class=cls.cls_id and cls.section_master_desc=tsm.section_master_id and cls.school_id='"+schoolId+"' and s.school_id='"+schoolId+"'";
						rs = dbcon.con.createStatement().executeQuery(selectQuery);	
						while (rs.next()) {
							arr.add(rs.getString(1));  	//0 user id
							arr.add(rs.getString(2));   //1 class name
							arr.add(rs.getString(3));   //2 status 
							arr.add(rs.getString(4));	//3 from date
							arr.add(rs.getString(5));	//4 to date
							arr.add(rs.getString(6));	//5 from time
							arr.add(rs.getString(7));	//6 to time
							arr.add(rs.getString(8));	//7 facility id
							arr.add(rs.getString(9));	//8 facility name
							arr.add(rs.getString(10));	//9 app id
							arr.add(rs.getString(11));	//10 category name
							arr.add(rs.getString(12));	//10 section name
						}
						
						/*bidquery = "select business_id from tb_user_to_business_map where user_id='"+buid+"'";
						rrr = dbcon.con.createStatement().executeQuery(bidquery);
						while (rrr.next()) {
							arr1.add(rrr.getInt(1));	
						}
					    for(int i=0;i<arr1.size();i++){
					    	selectQuery = "select concat(u.first_name,' ',u.middle_name,' ',u.last_name),u.user_name,a.appointment_status,a.appoint_from_date,a.appoint_to_date,a.appoint_from_time,a.appoint_to_time,f.facility_id,f.facility_name,a.appoint_id,ca.category_name  from tb_users u,tb_appointment a,tb_facilities f,tb_category ca where u.user_id='"+buid+"' and u.user_id=a.user_id and f.facility_business_id='"+arr1.get(i)+"' and f.facility_id=a.facility_id and ca.category_id=f.facilitycategory";
					    	rrr1 = dbcon.con.createStatement().executeQuery(selectQuery);	
							while (rrr1.next()) {
								arr.add(rrr1.getString(1));  	//0 user id
								arr.add(rrr1.getString(2));     //1 user name
								arr.add(rrr1.getString(3));     //2 status 
								arr.add(rrr1.getString(4));	    //3 from date
								arr.add(rrr1.getString(5));	    //4 to date
								arr.add(rrr1.getString(6));	    //5 from time
								arr.add(rrr1.getString(7));	    //6 to time
								arr.add(rrr1.getString(8));	    //7 facility id
								arr.add(rrr1.getString(9));	    //8 facility name
								arr.add(rrr1.getString(10));	//9 app id
								arr.add(rs.getString(11));	//10 category name
							}
						}*/
					}
					else if(roleid.equals(EzAppointmentConstant.STUDENT)) {
						/*bidquery = "select business_id from tb_user_to_business_map where user_id='"+buid+"'";
						rr = dbcon.con.createStatement().executeQuery(bidquery);
						while (rr.next()) {
							arr1.add(rr.getInt(1));	
						}
					    for(int i=0;i<arr1.size();i++){*/
				    		//selectQuery = "select u.user_id,u.user_name,a.appointment_status,a.appoint_from_date,a.appoint_to_date,a.appoint_from_time,a.appoint_to_time,f.facility_id,f.facility_name,a.appoint_id from tb_users u,tb_appointment a,tb_facilities f where u.user_id='"+buid+"' and u.user_id=a.user_id and f.user_id='"+arr1.get(i)+"' and f.facility_id=a.facility_id ";
					    	//selectQuery = "select concat(u.first_name,' ',u.middle_name,' ',u.last_name),u.user_name,a.appointment_status,a.appoint_from_date,a.appoint_to_date,a.appoint_from_time,a.appoint_to_time,f.facility_id,f.facility_name,a.appoint_id,ca.category_name  from tb_users u,tb_appointment a,tb_facilities f,tb_category ca where u.user_id='"+buid+"' and u.user_id=a.user_id and f.facility_id=a.facility_id and ca.category_id=f.facilitycategory ";
						selectQuery="select concat(s.first_name,' ',s.middle_name,' ',s.last_name),tcm.class_master_name,a.appointment_status,a.appoint_from_date,a.appoint_to_date,a.appoint_from_time,a.appoint_to_time,f.facility_id,f.facility_name,a.appoint_id,ca.category_name,tsm.section_master_desc from tb_student s,tb_appointment a,tb_facilities f,tb_category ca,tb_section_master tsm,tb_class_master tcm,tb_classes cls  where a.user_id='"+buid+"'  and  s.student_id=a.user_id and f.facility_id=a.facility_id and ca.category_id=f.facilitycategory and tcm.class_master_id = cls.class_id and s.reg_for_class=cls.cls_id and cls.section_master_desc=tsm.section_master_id and s.school_id='"+schoolId+"' and cls.school_id='"+schoolId+"'";
						rs = dbcon.con.createStatement().executeQuery(selectQuery);	
							while (rs.next()) {
								arr.add(rs.getString(1));  	//0 user id
								arr.add(rs.getString(2));   //1 class name
								arr.add(rs.getString(3));   //2 status 
								arr.add(rs.getString(4));	//3 from date
								arr.add(rs.getString(5));	//4 to date
								arr.add(rs.getString(6));	//5 from time
								arr.add(rs.getString(7));	//6 to time
								arr.add(rs.getString(8));	//7 facility id
								arr.add(rs.getString(9));	//8 facility name
								arr.add(rs.getString(10));	//9 app id
								arr.add(rs.getString(11));	//10 category name
								arr.add(rs.getString(12));	//10 section name
							}
						}
					
				} catch (SQLException sqlex) {
					cBLogger.error("class Name : cDViewAppointments, Function : getAppointmentListHere, error :", sqlex);
			}

			finally {
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDViewAppointments, Function : getAppointmentListHere, error :", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	
	
	public ArrayList getFacilityList(String userid,String roleid) {
		ArrayList arr = new ArrayList();
		ArrayList arr1 = new ArrayList();
		if (connected) {
			ResultSet r1=null;
			ResultSet rr=null;
			try {
				String selectQuery = "";
				String bidquery = "";
				int businessid = 0;
				
				if(roleid.equals(EzAppointmentConstant.TEACHER)) {
					/*selectQuery = "select f.facility_id,f.facility_name,b.business_id from tb_facilities f,tb_business b,tb_users u where b.user_id='"+userid+"' and b.user_id=u.user_id and f.facility_business_id=b.business_id ";
					r1 = dbcon.con.createStatement().executeQuery(selectQuery);	
					while (r1.next()) {
						arr.add(r1.getInt(1));
						arr.add(r1.getString(2));
					}
					bidquery = "select business_id from tb_user_to_business_map where user_id='"+userid+"'";
					rr = dbcon.con.createStatement().executeQuery(bidquery);
					while (rr.next()) {
						arr1.add(rr.getInt(1));	
					}
					for(int i=0;i<arr1.size();i++){*/
						//selectQuery = "select facility_id,facility_name from tb_facilities where facility_business_id="+arr1.get(i);
					selectQuery = "	select DISTINCT(f.facility_id),f.facility_name from tb_student s,tb_appointment a,tb_facilities f where s.student_id=a.user_id and f.user_id='"+userid+"' and f.facility_id=a.facility_id ; ";
					ResultSet rs1 = dbcon.con.createStatement().executeQuery(selectQuery);	
						while (rs1.next()) {
							arr.add(rs1.getInt(1));
							arr.add(rs1.getString(2));
						
					}
				}
				else if(roleid.equals(EzAppointmentConstant.STUDENT)) {
				/*	bidquery = "select business_id from tb_user_to_business_map where user_id='"+userid+"'";
					rr = dbcon.con.createStatement().executeQuery(bidquery);
					while (rr.next()) {
						arr1.add(rr.getInt(1));	
					}
					for(int i=0;i<arr1.size();i++){*/
						//selectQuery = "select facility_id,facility_name from tb_facilities where facility_business_id="+arr1.get(i);
					selectQuery = "select DISTINCT(f.facility_id),f.facility_name from tb_student s,tb_appointment a,tb_facilities f where s.student_id='"+userid+"' and s.student_id=a.user_id and f.facility_id=a.facility_id" ;	
					r1 = dbcon.con.createStatement().executeQuery(selectQuery);	
						while (r1.next()) {
							arr.add(r1.getInt(1));
							arr.add(r1.getString(2));
						}
					}
				
			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDViewAppointments, Function : getFacilityList, error :", sqlex);
			}

			finally {
					try {
						if(r1!=null)
							r1.close();
						if(rr!=null)
							rr.close();
						
					} catch (SQLException e) {
						cBLogger.error("class Name : cDViewAppointments, Function : getFacilityList, error :", e);
					}
				
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	
		
	
	public Hashtable<String, ArrayList<String>>  getAdminSearchResult(String values, cVViewAppointments objVoSearch,HttpServletRequest req)
	{
		Hashtable<String, ArrayList<String>> hs =new Hashtable<String, ArrayList<String>>();
		if (connected) 
		{
			ResultSet rr=null;
			ResultSet rs=null;
			ResultSet rss=null;
			ResultSet rss1=null;

			try
			{	
				session = req.getSession();
				
				int i=0;
				ArrayList arr =new ArrayList();
				arr.clear();
				String retVal = "no";
				String selectQuery = "";
				if(session.getAttribute("logedroleid").toString().equals(EzAppointmentConstant.TEACHER)) {
					selectQuery="select concat(s.first_name,' ',s.middle_name,' ',s.last_name),tcm.class_master_name,a.appointment_status,a.appoint_from_date,a.appoint_to_date,a.appoint_from_time,a.appoint_to_time,f.facility_id,f.facility_name,a.appoint_id,ca.category_name,tsm.section_master_desc from tb_student s,tb_appointment a,tb_facilities f,tb_category ca,tb_section_master tsm,tb_class_master tcm,tb_classes cls where ca.category_id=f.facilitycategory and s.student_id=a.user_id and f.user_id='"+objVoSearch.getBusinessuserid()+"' and f.facility_id=a.facility_id and tcm.class_master_id = cls.class_id and s.reg_for_class=cls.cls_id and cls.section_master_desc=tsm.section_master_id ";
				}
				else if(session.getAttribute("logedroleid").toString().equals(EzAppointmentConstant.STUDENT)) {
					selectQuery="select concat(s.first_name,' ',s.middle_name,' ',s.last_name),tcm.class_master_name,a.appointment_status,a.appoint_from_date,a.appoint_to_date,a.appoint_from_time,a.appoint_to_time,f.facility_id,f.facility_name,a.appoint_id,ca.category_name,tsm.section_master_desc from tb_student s,tb_appointment a,tb_facilities f,tb_category ca,tb_section_master tsm,tb_class_master tcm,tb_classes cls where ca.category_id=f.facilitycategory and s.student_id='"+objVoSearch.getBusinessuserid()+"' and s.student_id=a.user_id  and f.facility_id=a.facility_id and tcm.class_master_id = cls.class_id and s.reg_for_class=cls.cls_id and cls.section_master_desc=tsm.section_master_id";
				   }
					if(values.length()>0){
						selectQuery+=" and "+values+"";
					}
					rs=dbcon.con.createStatement().executeQuery(selectQuery);
					while (rs.next()) { 
						i++;
						retVal = "yes";
					
						arr.add(rs.getString(1));  	//0 user id
						arr.add(rs.getString(2));   //1 class name
						arr.add(rs.getString(3));   //2 status 
						arr.add(rs.getString(4));	//3 from date
						arr.add(rs.getString(5));	//4 to date
						arr.add(rs.getString(6));	//5 from time
						arr.add(rs.getString(7));	//6 to time
						arr.add(rs.getString(8));		//7 facility id
						arr.add(rs.getString(9));	//8 facility name
						arr.add(rs.getString(10));	//9 app id
						arr.add(rs.getString(11));	//9 category name 
						arr.add(rs.getString(12));	//9 section name 
						
						hs.put(String.valueOf(i),arr);
						
					}
				
     		}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDViewAppointments, Function : getAdminSearchResult, error :", sqlex);
			}
			finally
			{
				try {
					if(rr!=null)
						rr.close();
					if(rs!=null)
						rs.close();
					if(rss!=null)
						rss.close();
					if(rss1!=null)
						rss1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDViewAppointments, Function : getAdminSearchResult, error :", e);
				}
			
				
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return hs;
	
	}
	
	
	
	public int updateStatusByAdmin(String up_uid, String up_status,String appoint_id)
	{
		int res = 0;
		if (connected) {
			
			try {
				if(up_status.equals("Cancelled"))
				{
					
					String updateStatus = "update tb_appointment set appointment_status='"+up_status+"'  where user_id='"+up_uid+"' and appoint_id='"+appoint_id+"' ";
					dbcon.con.createStatement().executeUpdate(updateStatus);
					ArrayList inviteDetailsMail=new ArrayList();	
					
					inviteDetailsMail=checkInviteDeatails(appoint_id);
					
					if(inviteDetailsMail.size()>0){
					for(int i=0;i<inviteDetailsMail.size();i=i+4){
						String mailid=inviteDetailsMail.get(i+2).toString();
						String subject="Regarding cancellation of appointment";
						String message="Your Appointment is cancelled";
						
						sendingMail sendMail=new sendingMail();
						try{
						boolean result=sendMail.fireEmail(mailid,subject,message);
						res = 2;
						}
						catch(Exception e){
							cBLogger.error("class Name : cDViewAppointments, Function : updateStatusByAdmin, Error : ",e);
							res=3;
						}
					}
					}
					else
					{
						res=1;
					}
					
				}else if(up_status.equals("Postponed")){
					
					String updateStatus = "update tb_appointment set appointment_status='"+up_status+"'  where user_id='"+up_uid+"' and appoint_id='"+appoint_id+"' ";
					dbcon.con.createStatement().executeUpdate(updateStatus);
					ArrayList inviteDetailsMail=new ArrayList();	
					
					inviteDetailsMail=checkInviteDeatails(appoint_id);
				
					if(inviteDetailsMail.size()>0){
					for(int i=0;i<inviteDetailsMail.size();i=i+4){
						String mailid=inviteDetailsMail.get(i+2).toString();
						String subject="Regarding Postponed of Appointment";
						String message="Your Appointment is Postponed";
						
						sendingMail sendMail=new sendingMail();
						try{
						boolean result=sendMail.fireEmail(mailid,subject,message);
						res = 2;
						}
						catch(Exception e){
							cBLogger.error("class Name : cDViewAppointments, Function : updateStatusByAdmin, Error : ",e);
							res=3;
						}
					}
					}
					else
					{
						res=1;
					}
				}
				else{
					String updateStatus = "update tb_appointment set appointment_status='"+up_status+"'  where user_id='"+up_uid+"' and appoint_id='"+appoint_id+"' ";
					dbcon.con.createStatement().executeUpdate(updateStatus);
					res = 1;
				}
				
				
			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDViewAppointments, Function : updateStatusByAdmin, Error : ", sqlex);
			}

			finally {
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return res;
	}
	
	
	
	public ArrayList checkInviteDeatails(String appoint_id){
		ArrayList invitationDetails = new ArrayList();
		if (connected) {
			ResultSet rs=null;
			try {
			String selectQuery="select * from tb_appointment_invitations where appointment_id='"+appoint_id+"' and invite_type='mail'" ;
			rs = dbcon.con.createStatement().executeQuery(selectQuery);
			while (rs.next()) {
				invitationDetails.add(rs.getInt(1));
				invitationDetails.add(rs.getString(3));
				invitationDetails.add(rs.getString(4));
				invitationDetails.add(rs.getString(5));
			}
			}
			catch (Exception e) {
				cBLogger.error("class Name : cDViewAppointments, Function : checkInviteDeatails , Error : " , e);	
			} 
			finally {
					try {
						if(rs!=null)
							rs.close();
					} catch (SQLException e) {
						cBLogger.error("class Name : cDViewAppointments, Function : checkInviteDeatails , Error : ", e);
					}
				
				objConnMan.closeConnection(dbcon.index);
			}
	}
		return invitationDetails;
}
	public ArrayList getAppointmentDetails(String buid,String facilityId,String appointmentId) {
		ArrayList arr = new ArrayList();
		if (connected) {
			ResultSet rs=null;			
			try {
					String selectQuery = "";
					    	selectQuery = "select a.user_id,concat(s.first_name,' ',s.middle_name,' ',s.last_name),a.appointment_status,a.appoint_from_date,"
					    			+ "a.appoint_to_date,a.appoint_from_time,a.appoint_to_time,f.facility_id,f.facility_name,a.appoint_id,a.appointment_remark"
					    			+ " from tb_student s,tb_appointment a,tb_facilities f where a.user_id = s.student_id and f.facility_id =a.facility_id and a.appoint_id='"+ appointmentId + "'";
					    	rs = dbcon.con.createStatement().executeQuery(selectQuery);	
							while (rs.next()) {
								arr.add(rs.getString(1));  	//0 user id
								arr.add(rs.getString(2));   //1 user name
								arr.add(rs.getString(3));   //2 status 
								arr.add(rs.getString(4));	//3 from date
								arr.add(rs.getString(5));	//4 to date
								arr.add(rs.getString(6));	//5 from time
								arr.add(rs.getString(7));	//6 to time
								arr.add(rs.getString(8));	//7 facility id
								arr.add(rs.getString(9));	//8 facility name
								arr.add(rs.getString(10));	//9 app id
								arr.add(rs.getString(11));	//9 app id
								
							}
						
					
				} catch (SQLException sqlex) {
					cBLogger.error("class Name : cDViewAppointments, Function : getAppointmentDetails, error :", sqlex);
			}

			finally {
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDViewAppointments, Function : getAppointmentDetails, error :", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	
}

	
