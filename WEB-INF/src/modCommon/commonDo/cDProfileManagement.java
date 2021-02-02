package modCommon.commonDo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.ibm.icu.text.SimpleDateFormat;

import common.EzAppointmentConstant;
import modCommon.commonVo.cVProfileManagement;
import modLogger.cBLogger;


public class cDProfileManagement {
	ResultSet r3=null,r1=null,r2 = null;
	int x = 0;
	
	ArrayList arr = new ArrayList();
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	public cDProfileManagement() {
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
			cBLogger.error("class Name : cDProfileManagement, Constructor : cDProfileManagement , "+e);
		}
	}
	
	
	public ArrayList getUserProfileDetails(String qsuserid, String qsroleid)
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{		
				if(qsroleid.equals(EzAppointmentConstant.STUDENT)){
				//	String	query="select s.first_name,s.middle_name,s.last_name,s.email_id,s.contact_no,sa.addrline1,sa.addrline2,sa.cityname,c1.cityname,sa.zipcode,sa.state_id,st.state_name,sa.country_id,c.country_name from tb_student s,tb_address sa,tb_states st,tb_countries c,tb_city c1 where s.student_id='"+qsuserid+"' and st.state_id=sa.state_id and c.country_id=sa.country_id and sa.cityname=c1.cityid and sa.student_id='"+qsuserid+"' group by s.student_id;";				
					String	query="select DISTINCT s.first_name,s.middle_name,s.last_name,s.email_id,s.contact_no,sa.addrline1,sa.addrline2,sa.cityname,c1.cityname,sa.zipcode,sa.state_id,st.state_name,sa.country_id,c.country_name,tcm.class_master_name,tsm.section_master_desc"
								+ "  from tb_student s,tb_address sa,tb_states st,tb_countries c,tb_city c1,tb_section_master tsm,tb_class_master tcm,tb_classes cls"
								+ "  where s.student_id='"+qsuserid+"' and st.state_id=sa.state_id and c.country_id=sa.country_id and sa.cityname=c1.cityid and sa.student_id='"+qsuserid+"' and tcm.class_master_id = cls.class_id and s.reg_for_class=cls.cls_id and cls.section_master_desc=tsm.section_master_id";	
					rs=dbcon.con.createStatement().executeQuery(query);	
					while (rs.next()) {	
						arr.add(rs.getString(1));	//first_name
						arr.add(rs.getString(2));	//middle_name
						arr.add(rs.getString(3));	//last_name
						arr.add(rs.getString(4));	//email_id
						arr.add(rs.getString(5));	//phone_no
						arr.add(rs.getString(6));	//address_line1
						arr.add(rs.getString(7));	//address_line2
						arr.add(rs.getString(8));	//city
						arr.add(rs.getString(9));	//city name
						arr.add(rs.getString(10));	//zip code
						arr.add(rs.getInt(11));	//state id
						arr.add(rs.getString(12));	//state name
						arr.add(rs.getInt(13));	//country id
						arr.add(rs.getString(14));	//country name
						arr.add(rs.getString(15));	//class name
						arr.add(rs.getString(16));	//section name
					}
				}else{
					String	query="select DISTINCT e.fname,e.mname,e.lname,e.email,e.phno,ea.line1,ea.line2,ea.cityid,c1.cityname,ea.zipcode,ea.stateid,s.state_name,ea.countryid,c.country_name from tb_employee e,tb_empaddress ea,tb_states s,tb_countries c,tb_city c1 where e.empid='"+qsuserid+"' and s.state_id=ea.stateid and c.country_id=ea.countryid and ea.cityid=c1.cityid	and ea.empid='"+qsuserid+"' ";				
					rs=dbcon.con.createStatement().executeQuery(query);	
				while (rs.next()) {	
					arr.add(rs.getString(1));	//first_name
					arr.add(rs.getString(2));	//middle_name
					arr.add(rs.getString(3));	//last_name
					arr.add(rs.getString(4));	//email_id
					arr.add(rs.getString(5));	//phone_no
					arr.add(rs.getString(6));	//address_line1
					arr.add(rs.getString(7));	//address_line2
					arr.add(rs.getString(8));	//city
					arr.add(rs.getString(9));	//city name
					arr.add(rs.getString(10));	//zip code
					arr.add(rs.getInt(11));	//state id
					arr.add(rs.getString(12));	//state name
					arr.add(rs.getInt(13));	//country id
					arr.add(rs.getString(14));	//country name	
				}
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT getUserProfileDetails.java(cDProfileManagement)----", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	
	
	
	public ArrayList getUserBusinessDetails(String qsuserid, String qsroleid)
	{
		
		if (connected) 
		{
			ResultSet rs=null;
			try
			{				
				String	query="select b.business_name,b.owner_name,b.business_start,b.business_end,sub1.subs_id,sub2.subs_name,cat.category_id,b.business_categoty,b.business_add1,b.business_add2,b.business_city,b.business_zipcode,b.business_stateid,s.state_name,b.business_countryid,c.country_name,b.business_desc,u.user_id from tb_business b,tb_states s,tb_country c,tb_users u,tb_user_subscription sub1,tb_subscription sub2,tb_category cat where b.user_id='"+qsuserid+"' and b.user_id=u.user_id and b.business_stateid=s.state_id and b.business_countryid=c.country_id and sub1.user_id=b.user_id and sub2.subs_id=sub1.subs_id and cat.category_name=b.business_categoty ";
				
				rs=dbcon.con.createStatement().executeQuery(query);
					
				while (rs.next()) {
	
					arr.add(rs.getString(1));	//business_name
					arr.add(rs.getString(2));	//owner_name
					arr.add(rs.getString(3));	//business_start
					arr.add(rs.getString(4));	//business_end
					
					arr.add(rs.getInt(5));		//subs_id
					arr.add(rs.getString(6));	//subs_name
					
					arr.add(rs.getInt(7));		//category_id
					arr.add(rs.getString(8));	//business_categoty
					
					arr.add(rs.getString(9));	//business_add1
					arr.add(rs.getString(10));	//business_add1
					arr.add(rs.getString(11));	//Business city
					arr.add(rs.getString(12));	//Business Zip
					
					arr.add(rs.getInt(13));		//Business_State_id
					arr.add(rs.getString(14));	//Business_State_name
					
					arr.add(rs.getInt(15));		//Business_Country_id
					arr.add(rs.getString(16));	//Business_Country_name
					
					arr.add(rs.getString(17));	//Business_Desc
						
					
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT getUserProfileDetails()(cDProfileManagement.java)----", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
					rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDProfileManagement, Function : getUserBusinessDetails , error: ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	
	
	
	public ArrayList getSubscriptionHere()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			
				String	query="select subs_id,subs_name from tb_subscription";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDProfileManagement, Function : getSubscriptionHere , error: ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	
	public ArrayList getStates(String conty_id)
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			
				String	query="SELECT state_id,state_name FROM tb_states where country_id='"+conty_id+"'";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDProfileManagement, Function : getStates , error: ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDProfileManagement, Function : getStates , error: ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	
	public ArrayList getAllBuscitylist(String contry_id)
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			
				//String	query="select distinct business_city from tb_business where business_stateid ='"+contry_id+"' ";
				String	query="select tc.cityname from tb_facilities as tf,tb_city as tc where tf.facility_state_id ='"+contry_id+"' and tc.cityid=tf.facility_city ";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					arr.add(rs.getString(1));
					
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDProfileManagement, Function : getAllBuscitylist , error :", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDProfileManagement, Function : getAllBuscitylist , error :", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	
	public ArrayList getStatesforcountry(String category_id)
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			
				//String	query="SELECT state_id , state_name FROM tb_states where country_id ='"+contry+"'";
				String	query="select DISTINCT(tf.facility_state_id),ts.state_name from tb_facilities as tf,tb_states as ts  where tf.facilitycategory='"+category_id+"' and tf.facility_state_id=ts.state_id;";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
					
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDProfileManagement, Function : getStatesforcountry , error :", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDProfileManagement, Function : getStatesforcountry , error :", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	
	
	public ArrayList getCategoriesHere()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			
				String	query="select category_id,category_name from tb_category";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
				}
				rs.close();
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDProfileManagement, Function : getCategoriesHere , error : ", sqlex);	
			}
			finally
			{

				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDProfileManagement, Function : getCategoriesHere , error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	
	
	
	public int doUpdateProfile(cVProfileManagement semp)
	{
		
		int val=0;
		if (connected) 
		{
			PreparedStatement pstmt = null;
			PreparedStatement pstmt1 = null;
			PreparedStatement pstmt2 = null;
			
				if(semp.getHiddenroleid().equals(EzAppointmentConstant.STUDENT))
				{
					try{
				    pstmt = dbcon.con.prepareStatement("update tb_student as s ,tb_address as sta set s.first_name=?,s.middle_name=?,s.last_name=?,s.email_id=?,s.contact_no=?,sta.addrline1=?,sta.addrline2=?,sta.cityname=?,sta.zipcode=?,sta.state_id=?,sta.country_id=? where s.student_id=? and sta.student_id=?");
					pstmt.setString(1,semp.getFname());
					pstmt.setString(2,semp.getMname());
					pstmt.setString(3,semp.getLname());
					pstmt.setString(4,semp.getEmail());
					pstmt.setString(5,semp.getContact());
					pstmt.setString(6,semp.getAdd1());
					pstmt.setString(7,semp.getAdd2());
					pstmt.setString(8,semp.getCity());
					pstmt.setString(9,semp.getZipcode());
					pstmt.setString(10,semp.getState());
					pstmt.setString(11,semp.getCountry());
					//pstmt.setString(12,semp.getMemberid());
					pstmt.setString(12,semp.getHiddenuserid());
					pstmt.setString(13,semp.getHiddenuserid());
					pstmt.executeUpdate();
					val=1;
					}
					catch (SQLException sqlex)
					{
						cBLogger.error("SQL EXCEPTION AT doUpdateProfile()(cDProfileManagement.java)----", sqlex);	
						
					}
					finally
					{
						try {
							if(pstmt!=null)
								pstmt.close();
						} catch (Exception e) {
							cBLogger.error("SQL EXCEPTION AT doUpdateProfile()(cDProfileManagement.java)----",e);
						}
					}
					
				}
				else 
				{	
					try{
					
					pstmt1 = dbcon.con.prepareStatement("update tb_employee as e ,tb_empaddress as empa set e.fname=?,e.mname=?,e.lname=?,e.email=?,e.phno=?,empa.line1=?,empa.line2=?,empa.cityid=?,empa.zipcode=?,empa.stateid=?,empa.countryid=? where e.empid=? and empa.empid=?");
					pstmt1.setString(1,semp.getFname());
					pstmt1.setString(2,semp.getMname());
					pstmt1.setString(3,semp.getLname());
					pstmt1.setString(4,semp.getEmail());
					pstmt1.setString(5,semp.getContact());
					pstmt1.setString(6,semp.getAdd1());
					pstmt1.setString(7,semp.getAdd2());
					pstmt1.setString(8,semp.getCity());
					pstmt1.setString(9,semp.getZipcode());
					pstmt1.setString(10,semp.getState());
					pstmt1.setString(11,semp.getCountry());
					pstmt1.setString(12,semp.getHiddenuserid());
					pstmt1.setString(13,semp.getHiddenuserid());
					pstmt1.executeUpdate();

					
					//,business_categoty=?,business_start=?,business_end=?
				/*	pstmt2 = dbcon.con.prepareStatement("update tb_business set business_name=?,owner_name=?,business_add1=?,business_add2=?,business_city=?,business_zipcode=?,business_stateid=?,business_countryid=?,business_desc=? where user_id=?");
					pstmt2.setString(1,semp.getBissname());
					pstmt2.setString(2,semp.getBissowner());
					//pstmt2.setString(3,semp.getBissstart());
					//pstmt2.setString(4,semp.getBissend());
					//pstmt2.setString(5,semp.getBisscategory());
					pstmt2.setString(3,semp.getBissadd1());
					pstmt2.setString(4,semp.getBissadd2());
					pstmt2.setString(5,semp.getBisscity());
					pstmt2.setString(6,semp.getBisszipcode());
					pstmt2.setString(7,semp.getBissstate());
					pstmt2.setString(8,semp.getBisscountry());
					pstmt2.setString(9,semp.getBissdesc());
					pstmt2.setString(10,semp.getHiddenuserid());
					pstmt2.executeUpdate();*/
					
					val=1;
					}
					catch (SQLException sqlex)
					{
						cBLogger.error("SQL EXCEPTION AT doUpdateProfile()(cDProfileManagement.java)----", sqlex);	
					}
					finally
					{
						try {
							if(pstmt1!=null)
								pstmt1.close();
							if(pstmt2!=null)
								pstmt2.close();
						} catch (Exception e) {
							cBLogger.error("SQL EXCEPTION AT doUpdateProfile()(cDProfileManagement.java)----", e);	
						}
						objConnMan.closeConnection(dbcon.index);
					}
					}					
			}
			
		return val;
			
		}
		
		
	
	public ArrayList getCategoryonidHere(String user_id,String role_id) {
		ArrayList categoryList =new ArrayList();
		if (connected) 
		{	
			ResultSet rs=null;
			try{
				String	query="";
				if(role_id.equals("2")){
				    query="SELECT business_id,business_categoty FROM tb_business where user_id='"+user_id+"'";
				}
				else{
					query="SELECT business_id,business_categoty FROM tb_business where business_id =Any (SELECT business_id FROM tb_user_to_business_map where user_id ='"+user_id+"')";
				}
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					categoryList.add(rs.getString(1));
					categoryList.add(rs.getString(2));
				}
			}catch(Exception ee){
				cBLogger.error("class Name : cDProfileManagement, Function : getCategoryonidHere , error", ee);	
			}finally{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDProfileManagement, Function : getCategoryonidHere , error", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return categoryList;
		
	}
	
	public ArrayList getStatesfromDB(String country_id) {
		ArrayList stateslist =new ArrayList();
		if (connected) 
		{	
			ResultSet rs=null;
			try{
				String	query="";
				
				    query="SELECT state_id , state_name FROM tb_states where country_id='"+country_id+"'";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					stateslist.add(rs.getInt(1));
					stateslist.add(rs.getString(2));
				}
			}catch(Exception ee){
				cBLogger.error("class Name : cDProfileManagement, Function : getCategoryonidHere , error", ee);	
			}finally{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDProfileManagement, Function : getCategoryonidHere , error", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return stateslist;
		
	}
	public int getBusinessIdByUserId(String user_id,String c_id) {
		int business_id=0;
		if (connected) 
		{	
			ResultSet rs=null;
			try{
				String	query="";
				   query="SELECT a.business_id FROM tb_business a,tb_users  b  where  b.status='Active' and a.business_categoty='"+c_id+"' and a.user_id='"+user_id+"' and b.user_id='"+user_id+"'";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					 business_id=rs.getInt(1);
				}
			}catch(Exception ee){
				cBLogger.error("class Name : cDProfileManagement, Function : getBusinessIdByUserId , error", ee);	
			}finally{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDProfileManagement, Function : getBusinessIdByUserId , error", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return business_id;
		
	}
	
	// Getting appointmentList by id
		public JSONArray getappointments(String userId,String roleid) {
			JSONArray appointmentList = new JSONArray();
			if (connected) {
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				String SelQuery="";
				try {
					if(roleid.equals(EzAppointmentConstant.TEACHER)) {
					 SelQuery = "SELECT tf.facility_name,ta.appoint_from_date,ta.appoint_to_date,ta.appoint_from_time ,ta.appoint_to_time,ta.appointment_status,tf.facility_desc,tcm.class_master_name,tsm.section_master_desc,concat(ts.first_name,'',ts.middle_name,'',ts.last_name) FROM tb_appointment as ta,tb_facilities as tf,tb_student as ts,tb_section_master tsm,tb_class_master tcm,tb_classes cls where tf.facility_id=ta.facility_id and tf.user_id='"+userId+"' and ts.student_id=ta.user_id and tcm.class_master_id = cls.class_id and ts.reg_for_class=cls.cls_id and cls.section_master_desc=tsm.section_master_id";
					pstmt = dbcon.con.prepareStatement(SelQuery);
					rs = pstmt.executeQuery();
					}else if(roleid.equals(EzAppointmentConstant.STUDENT)){
						 SelQuery = "SELECT tf.facility_name,ta.appoint_from_date,ta.appoint_to_date,ta.appoint_from_time ,ta.appoint_to_time,ta.appointment_status,tf.facility_desc,tcm.class_master_name,tsm.section_master_desc,concat(ts.first_name,'',ts.middle_name,'',ts.last_name) FROM tb_appointment as ta,tb_facilities as tf,tb_student as ts,tb_section_master tsm,tb_class_master tcm,tb_classes cls where tf.facility_id=ta.facility_id and ta.user_id='"+userId+"'  and ts.student_id='"+userId+"' and tcm.class_master_id = cls.class_id and ts.reg_for_class=cls.cls_id and cls.section_master_desc=tsm.section_master_id";
						pstmt = dbcon.con.prepareStatement(SelQuery);
						rs = pstmt.executeQuery();
					}else{
						 SelQuery = "SELECT tf.facility_name,ta.appoint_from_date,ta.appoint_to_date,ta.appoint_from_time ,ta.appoint_to_time,ta.appointment_status,tf.facility_desc,tcm.class_master_name,tsm.section_master_desc,concat(ts.first_name,'',ts.middle_name,'',ts.last_name) FROM tb_appointment as ta,tb_facilities as tf,tb_student as ts,tb_section_master tsm,tb_class_master tcm,tb_classes cls where tf.facility_id=ta.facility_id and ts.student_id=ta.user_id and tcm.class_master_id = cls.class_id and ts.reg_for_class=cls.cls_id and cls.section_master_desc=tsm.section_master_id";
						pstmt = dbcon.con.prepareStatement(SelQuery);
						rs = pstmt.executeQuery();
					}
					while (rs.next()) {
						String appointmentName = rs.getString(1);
						String startdate = rs.getString(2);
						String enddate = rs.getString(3);
						String appointmentStartTime = rs.getString(4);
						String appointmentEndTime = rs.getString(5);
						String appointmentstatus = rs.getString(6);
						String appointmentDescription = rs.getString(7);
						String className = rs.getString(8);
						String sectionName = rs.getString(9);
						String studentName = rs.getString(10);
						
						/*SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm a");
						String fromTime = dateFormat.format(appointmentStartTime);
						String toTime = dateFormat.format(appointmentStartTime);
						System.out.println(fromTime);*/
						
						JSONObject obj = new JSONObject();
						try {
							obj.put("title", appointmentstatus); // attendance status
							obj.put("start", startdate+"T"+appointmentStartTime); // date	
							obj.put("endtDate", enddate+"T"+appointmentEndTime); 
							//obj.put("startTime", appointmentStartTime);
							//obj.put("endTime", appointmentEndTime); 	
							obj.put("appointmentName", appointmentName);
							obj.put("appointmentstatus", appointmentstatus);
							obj.put("appointmentDescription", appointmentDescription); 
							obj.put("clsName", className);
							obj.put("section", sectionName); 
							obj.put("stuName", studentName); 
						} catch (JSONException e) {
							cBLogger.error("class Name : cDProfileManagement, Function : getappointments , error", e);	
						}
						appointmentList.put(obj);
					}
				} catch (SQLException sqlex) {
					cBLogger.error("class Name : cDProfileManagement, Function : getappointments , error", sqlex);	
				} finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
					} catch (SQLException e) {
						cBLogger.error("class Name : cDProfileManagement, Function : getappointments , error", e);	
					}
					objConnMan.closeConnection(dbcon.index);
				}
			}
			return appointmentList;
		}
}