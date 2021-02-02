package modAdmin.adminDo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

//import modEmp.bisDo.*;
import modAdmin.adminVo.cVBusinessList;
import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;

public class cDBusinessList {

	ArrayList subFlds = new ArrayList();

	cDConnectionManager objConnMan = null;
	indexConnection dbcon = null;
	boolean connected = false;

	public cDBusinessList() {
		try {
			objConnMan = cDConnectionManager.getObjHandle();
			dbcon = objConnMan.openConnection();

			if (dbcon.con == null)
				connected = false;
			else
				connected = true;
		} catch (Exception e) {
			cBLogger.error("Data Base Access Problem", e);
		}
	}
	//To get All appointments list
	public List<String> getAppointmentsList(String searchKey,int schoolId) {
		ArrayList<String> arr = new ArrayList<>();
		if (connected) {
			ResultSet r1 = null;
			String selectQuery=null;
			try {
				selectQuery = "SELECT facility_id,facility_name,facility_from_date,facility_to_date,facility_from_time,"
						+ "facility_to_time,facility_status FROM tb_facilities where school_id="+schoolId+" ";
				if(searchKey != null && !searchKey.equals("")){
					 selectQuery = selectQuery +" and facility_name LIKE '%"+searchKey+"%'";
				}
				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				while (r1.next()) {
					arr.add(r1.getString(1));
					arr.add(r1.getString(2));
					arr.add(r1.getString(3));
					arr.add(r1.getString(4));
					arr.add(r1.getString(5));
					arr.add(r1.getString(6));
					arr.add(r1.getString(7));

				}

			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDBusinessList, Function : getAppointmentsList , Error", sqlex);
			}

			finally {
				try {
					if (r1 != null)
						r1.close();
				} catch (SQLException e) {
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}

	public ArrayList hereBusinessDetails1(String businessid) {
		ArrayList arr = new ArrayList();
		if (connected) {
			ResultSet r1 = null;
			try {
				String selectQuery = "select b.business_id,b.user_id,b.business_name,b.business_start,b.business_end,b.business_categoty,b.business_add1,b.business_add2,b.business_city,b.business_zipcode,b.business_stateid,st.state_name,b.business_countryid,ct.country_name,sub.subs_id,sst.subs_name from tb_business b,tb_users u,tb_states st,tb_country ct,tb_user_subscription sub,tb_subscription sst where b.business_id='"
						+ businessid
						+ "' and b.user_id=u.user_id and b.business_stateid=st.state_id and b.business_countryid=ct.country_id and u.user_id=sub.user_id and sub.subs_id=sst.subs_id ";
				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				while (r1.next()) {
					arr.add(r1.getString(3));
					arr.add(r1.getString(4));
					arr.add(r1.getString(5));
					arr.add(r1.getString(6));
					arr.add(r1.getString(7));
					arr.add(r1.getString(8));
					arr.add(r1.getString(9));
					arr.add(r1.getString(10));
					arr.add(r1.getString(12));
					arr.add(r1.getString(14));
					arr.add(r1.getString(16));

				}

			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT CDBusinessList.JAVA----", sqlex);
			}

			finally {
				try {
					if (r1 != null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("SQL EXCEPTION AT CDBusinessList.JAVA----", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}

	public ArrayList hereBusinessDetails2(String businessid) {
		ArrayList arr = new ArrayList();
		if (connected) {
			ResultSet r1 = null;
			try {
				String selectQuery = "select b.business_id,b.user_id,b.owner_name,u.first_name,u.middle_name,u.last_name,u.email_id,u.phone_no,u.address_line1,u.address_line2,u.city,u.zip_code,u.state_id,st.state_name,u.country_id,ct.country_name from tb_business b,tb_users u,tb_country ct,tb_states st where b.business_id='"
						+ businessid
						+ "' and b.user_id=u.user_id and u.country_id=ct.country_id and u.state_id=st.state_id; ";

				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				while (r1.next()) {
					arr.add(r1.getString(3));
					arr.add(r1.getString(4));
					arr.add(r1.getString(5));
					arr.add(r1.getString(6));
					arr.add(r1.getString(7));
					arr.add(r1.getString(8));
					arr.add(r1.getString(9));
					arr.add(r1.getString(10));
					arr.add(r1.getString(11));
					arr.add(r1.getString(12));
					arr.add(r1.getString(14));
					arr.add(r1.getString(16));

				}

			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT CDBusinessList.JAVA----", sqlex);
			}

			finally {
				try {
					if (r1 != null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDBusinessList, Function : hereBusinessDetails2 , Error", e);

				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}

	public int hereDeleteBusiness(String temp) {
		int val = 0;

		if (connected) {
			ResultSet rs = null;
			ResultSet rs1 = null;
			PreparedStatement deleteUser = null;
			PreparedStatement deleteBusiness = null;
			PreparedStatement deleteSubscription = null;
			PreparedStatement deleteRole = null;
			try {
				String checkQuery = "select * from tb_facilities  where facility_business_id='" + temp + "'";
				rs = dbcon.con.createStatement().executeQuery(checkQuery);
				if (rs.next()) {
					val = 2;

				} else {
					String getuidQuery = "select user_id from tb_business where business_id='" + temp + "'";
					rs1 = dbcon.con.createStatement().executeQuery(getuidQuery);
					int get_uid = 0;
					if (rs1.next()) {
						get_uid = rs1.getInt("user_id");
					}
					deleteUser = dbcon.con.prepareStatement("delete from tb_users where user_id=? ");
					deleteUser.setInt(1, get_uid);

					deleteBusiness = dbcon.con.prepareStatement("delete from tb_business where business_id=? ");
					deleteBusiness.setString(1, temp);

					deleteSubscription = dbcon.con
							.prepareStatement("delete from tb_user_subscription where user_id=? ");
					deleteSubscription.setInt(1, get_uid);

					deleteRole = dbcon.con.prepareStatement("delete from tb_userrole where user_id=? ");
					deleteRole.setInt(1, get_uid);

					try {
						deleteUser.executeUpdate();
						deleteBusiness.executeUpdate();
						deleteSubscription.executeUpdate();
						deleteRole.executeUpdate();

						val = 1;
					} catch (Exception se) {

						cBLogger.error("class Name : cDBusinessList, Function : hereDeleteBusiness , Error", se);
						dbcon.con.rollback();
					}

				}
			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT ----", sqlex);
			}

			finally {
				try {
					if (rs1 != null)
						rs1.close();
					if (rs != null)
						rs.close();
					if (deleteUser != null)
						deleteUser.close();
					if (deleteBusiness != null)
						deleteBusiness.close();
					if (deleteSubscription != null)
						deleteSubscription.close();
					if (deleteRole != null)
						deleteRole.close();
				} catch (Exception e) {
					cBLogger.error("class Name : cDBusinessList, Function : hereDeleteBusiness , Error", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}

		return val;
	}

	public int hereUpdateAppointmentStatus(cVBusinessList objVoBusinessOpp) {
		int y = 0;
		if (connected) {
			ResultSet r1 = null;
			try {

				String updateQuery = "update tb_facilities set facility_status='" + objVoBusinessOpp.getStatusname()
						+ "' where facility_id='" + objVoBusinessOpp.getBusinessid_hidden() + "' ";
				y = dbcon.con.createStatement().executeUpdate(updateQuery);

			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT CDBusinessList.JAVA ----", sqlex);
				return y;
			} finally {
				try {
					if (r1 != null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDBusinessList, Function : hereUpdateAppointmentStatus , Error", e);

				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return y;
	}

	// To get all users list
	public ArrayList getUsersList(String searchkey,int schoolId) {
		ArrayList arr = new ArrayList();
		if (connected) {
			ResultSet r1 = null;
			ResultSet r2 = null;
			try {
				if (StringUtils.isEmpty(searchkey)) {
					String selectQuery ="select s.student_id,concat(s.first_name,'',s.middle_name,'',s.last_name),s.email_id,s.contact_no,st.status_name,emp.userrole_id from tb_student as s,tb_status as st,tb_empuserrole as emp where s.status_id=st.status_id and  emp.empid=s.student_id and s.school_id='"+schoolId+"'";
					r1 = dbcon.con.createStatement().executeQuery(selectQuery);
					while (r1.next()) {
						arr.add(r1.getString(1));
						arr.add(r1.getString(2));
						arr.add(r1.getString(3));
						arr.add(r1.getString(4));
						arr.add(r1.getString(5));
					    arr.add(r1.getInt(6));
						//arr.add(r1.getString(7));
					}
					String selectQuery1 ="select e.empid,concat(e.fname,'',e.mname,'',e.lname),e.email,e.phno,st.status_name,emp.userrole_id from tb_employee as e,tb_status as st,tb_empuserrole as emp where e.active=st.status_id and  emp.empid=e.empid and e.school_id='"+schoolId+"'";
					r2 = dbcon.con.createStatement().executeQuery(selectQuery1);
					while (r2.next()) {
						arr.add(r2.getString(1));
						arr.add(r2.getString(2));
						arr.add(r2.getString(3));
						arr.add(r2.getString(4));
						arr.add(r2.getString(5));
						arr.add(r2.getInt(6));
					//String selectQuery = "select b.user_id,b.business_name,b.business_start,u.user_name,b.business_id,u.status,u.email_id from tb_business b,tb_users u where b.user_id=u.user_id";				
					/*String selectQuery ="select user_id,user_name, CONCAT(first_name,middle_name,last_name),status,email_id,phone_no from tb_users"  ;
					r1 = dbcon.con.createStatement().executeQuery(selectQuery);
					while (r1.next()) {
						arr.add(r1.getInt(1));
						arr.add(r1.getString(2));
						arr.add(r1.getString(3));
						arr.add(r1.getString(4));
						arr.add(r1.getString(5));
						arr.add(r1.getString(6));*/
						//arr.add(r1.getString(7));// emailid
					}
				} else {
				//	String selectQuery = "select b.user_id,b.business_name,b.business_start,u.user_name,b.business_id,u.status,u.email_id from tb_business b,tb_users u where b.user_id=u.user_id and b.business_name like'%"+ searchkey + "%' ";
				//	String selectQuery ="select user_id,user_name,first_name,status,email_id,phone_no from tb_users where CONCAT(first_name,middle_name,last_name) LIKE '%"+ searchkey + "%' ";
					String selectQuery ="select s.student_id,concat(s.first_name,'',s.middle_name,'',s.last_name),s.email_id,s.contact_no,st.status_name,emp.userrole_id from tb_student as s,tb_status as st,tb_empuserrole as emp where s.status_id=st.status_id and s.school_id='"+schoolId+"' and  emp.empid=s.student_id and concat(s.first_name,s.middle_name,s.last_name) LIKE '%"+ searchkey + "%'";
					r1 = dbcon.con.createStatement().executeQuery(selectQuery);
					while (r1.next()) {
						arr.add(r1.getString(1));
						arr.add(r1.getString(2));
						arr.add(r1.getString(3));
						arr.add(r1.getString(4));
						arr.add(r1.getString(5));
						arr.add(r1.getInt(6));
					//	arr.add(r1.getString(6));
						//arr.add(r1.getString(7));
					}
					String selectQuery1 ="select e.empid,concat(e.fname,'',e.mname,'',e.lname),e.email,e.phno,st.status_name,emp.userrole_id from tb_employee as e,tb_status as st,tb_empuserrole as emp where e.active=st.status_id and st.school_id='"+schoolId+"' and emp.empid=e.empid and concat(e.fname,'',e.mname,'',e.lname) LIKE '%"+ searchkey + "%'";
					r2 = dbcon.con.createStatement().executeQuery(selectQuery1);
					while (r2.next()) {
						arr.add(r2.getString(1));
						arr.add(r2.getString(2));
						arr.add(r2.getString(3));
						arr.add(r2.getString(4));
						arr.add(r2.getString(5));
						arr.add(r2.getInt(6));
					//	arr.add(r1.getString(6));
						//arr.add(r1.getString(7));
					}
				}

			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT CDBusinessList.JAVA----", sqlex);
			}

			finally {
				try {
					if (r1 != null)
						r1.close();
				} catch (SQLException e) {
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	public int hereUpdateUserStatus(cVBusinessList objVoBusinessOpp) {
		int y=0;
		if (connected) {
			ResultSet r1=null;
			try {
					/*String selectQuery = "select b.business_id,b.user_id,u.user_id from tb_business b,tb_users u where b.business_id='"+objVoBusinessOpp.getSelected_ids()+"' and b.user_id=u.user_id;";
					r1 = dbcon.con.createStatement().executeQuery(selectQuery);*/
					/*while (r1.next()) {
					////	int b_id = r1.getInt(1);
						int b_uid = r1.getInt(2);
						int u_uid = r1.getInt(3);*/
						
						String updateQuery = "update tb_users set status='"+objVoBusinessOpp.getStatusname()+"' where user_id='"+objVoBusinessOpp.getSelected_ids()+"' ";
						dbcon.con.createStatement().executeUpdate(updateQuery);
						
						y=1;
					/*}*/
					
			}
			catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT CDBusinessList.JAVA ----", sqlex);
				return y;
			}
			finally {
				try {
					if(r1!=null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDBusinessList, Function : hereUpdateUserStatus , Error",e);

				}				
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return y;
	}
}// pstmt