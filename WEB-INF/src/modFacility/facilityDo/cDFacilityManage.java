package modFacility.facilityDo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modAdmin.adminVo.cVBusinessList;
import modCommon.commonDo.cDCommon;
import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
//import modEmp.bisDo.*;
import modFacility.facilityVo.cVFacilityManage;
import modLogger.cBLogger;

public class cDFacilityManage {

	/*
	 * Connection dbcon = null; boolean connected = true; cDConnectionManager objConnMan;
	 */
	int time_sheet_id = 0;

	cDConnectionManager objConnMan = null;
	indexConnection dbcon = null;
	boolean connected = false;

	public cDFacilityManage() {
		try {
			objConnMan = cDConnectionManager.getObjHandle();
			dbcon = objConnMan.openConnection();

			if (dbcon.con == null)
				connected = false;
			else
				connected = true;
		} catch (Exception e) {
			cBLogger.error("class Name : cDFacilityManage, Constructor : cDFacilityManage, Error : ", e);
		}
	}

	public int insertDetailsDB(cVFacilityManage objVoAddFacility,int schoolId) {
		int x = 0;
		int flag = 0;

		if (connected) {
			ResultSet rs = null;
			ResultSet rs1 = null;
			PreparedStatement pstmtck = null;
			PreparedStatement pstmtFac = null;
			try {
				dbcon.con.setAutoCommit(false);

				/*
				 * String checkQuery="select business_id from tb_business where user_id='"
				 * +objVoAddFacility.getUserid_hidden()+"'";
				 * rs=dbcon.con.createStatement().executeQuery(checkQuery); while(rs.next()){
				 * businessid=rs.getInt(1); }
				 */

				pstmtck = dbcon.con.prepareStatement("select * from tb_facilities where facility_name=? and user_id=?");
				pstmtck.setString(1, objVoAddFacility.getFacilityname());
				pstmtck.setString(2, objVoAddFacility.getUserid_hidden());
				rs1 = pstmtck.executeQuery();
				if (rs1.next()) {
					cBLogger.error("Facility already exist");
					flag = 1;
					x = 1;

				}
				cDCommon obj = new cDCommon();
				String startdate = obj.getDateFormatterToDB1(objVoAddFacility.getFacstartdate());
				String enddate = obj.getDateFormatterToDB1(objVoAddFacility.getFacenddate());
				/*
				 * pstmtFac= dbcon.con .prepareStatement(
				 * "INSERT into tb_facilities values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				 */

				pstmtFac = dbcon.con.prepareStatement("INSERT into tb_facilities(facility_id, user_id, facility_name, facility_type, "
						+ "facility_from_date, facility_to_date, facility_from_time, facility_to_time, time_per_slot, "
						+ "members_per_slot, facility_desc, facility_add1, facility_add2, facility_city, facility_zip_code, "
						+ "facility_state_id, facility_country_id, facility_contact_no, facility_status, facilitycategory, school_id) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmtFac.setString(1, null);
				pstmtFac.setString(2, objVoAddFacility.getUserid_hidden());
				pstmtFac.setString(3, objVoAddFacility.getFacilityname());
				pstmtFac.setString(4, objVoAddFacility.getFacilitytype());
				pstmtFac.setString(5, startdate);
				pstmtFac.setString(6, enddate);
				pstmtFac.setString(7, objVoAddFacility.getFacopentime());
				pstmtFac.setString(8, objVoAddFacility.getFacclosetime());
				pstmtFac.setString(9, objVoAddFacility.getTimeslot());
				pstmtFac.setString(10, objVoAddFacility.getMembersslot());
				pstmtFac.setString(11, objVoAddFacility.getDescription());
				pstmtFac.setString(12, objVoAddFacility.getFacadd1());
				pstmtFac.setString(13, objVoAddFacility.getFacadd2());
				pstmtFac.setString(14, objVoAddFacility.getCity());
				pstmtFac.setString(15, objVoAddFacility.getFaczip());
				pstmtFac.setInt(16, objVoAddFacility.getState());
				pstmtFac.setInt(17, objVoAddFacility.getCountry());
				pstmtFac.setString(18, objVoAddFacility.getFaccontactno());
				pstmtFac.setString(19, "2");
				pstmtFac.setInt(20, objVoAddFacility.getFacilitycategory());
				pstmtFac.setInt(21, schoolId);
				pstmtFac.addBatch();

				try {

					if (flag == 0) {
						// throw(new SQLException());
						pstmtFac.executeBatch();
						dbcon.con.commit();
						dbcon.con.setAutoCommit(true);
						x = 2;
					} 
					// dbcon.con.setAutoCommit(true);
				} catch (Exception se) {
					cBLogger.error("class Name : cDFacilityManage,  Function : insertDetailsDB , Error : ", se);
					dbcon.con.rollback();
					x = 0;
				}

			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDFacilityManage,  Function : insertDetailsDB , Error : ", sqlex);
			}

			finally {

				try {
					if (rs != null)
						rs.close();
					if (rs1 != null)
						rs1.close();
					if (pstmtck != null)
						pstmtck.close();
					if (pstmtFac != null)
						pstmtFac.close();
				} catch (Exception e) {
					cBLogger.error("class Name : cDFacilityManage,  Function : insertDetailsDB , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return x;
	}

	public int updateDetailsDB(cVFacilityManage objVoAddFacility) {
		int updateflag = 0;
		int y = 0;
		int flag = 0;
		String sql = "";
		String Date = "";
		String Desc = "";
		String temp[];
		String temp1[];

		try {
			if (connected) {
				ResultSet rs = null;
				ResultSet check = null;
				PreparedStatement pstmtFacUpdate = null;
				ResultSet check1 = null;
				try {
					String checkFacilityUnique = "select facility_name from tb_facilities where facility_id='" + objVoAddFacility.getFacid_hidden() + "'";
					check = dbcon.con.createStatement().executeQuery(checkFacilityUnique);
					if (check.next()) {

						if (objVoAddFacility.getFacilityname().equals(check.getString(1))) {
							// updateflag=0; //can edit Term name

							String checkAppointment = "select appoint_id from tb_appointment where appointment_status='Booked' and facility_id='"
									+ objVoAddFacility.getFacid_hidden() + "'";
							rs = dbcon.con.createStatement().executeQuery(checkAppointment);
							if (rs.next()) {
								cBLogger.error("Facility Cannot be updated There were fixed appoinments");
								updateflag = 2;
								y = 4;
							} else {
								cDCommon obj = new cDCommon();
								String startdate = obj.getDateFormatterToDB1(objVoAddFacility.getFacstartdate());
								String enddate = obj.getDateFormatterToDB1(objVoAddFacility.getFacenddate());
								pstmtFacUpdate = dbcon.con.prepareStatement(
										"update tb_facilities set facility_name=?,facility_type=?,facility_desc=?,facility_from_date=?,facility_to_date=?,facility_from_time=?,facility_to_time=?,time_per_slot=?,members_per_slot=?,facility_add1=?,facility_add2=?,facility_city=?,facility_state_id=?,facility_country_id=?,facility_zip_code=?,facility_contact_no=?,facilitycategory=? where facility_id=?");
								pstmtFacUpdate.setString(1, objVoAddFacility.getFacilityname());
								pstmtFacUpdate.setString(2, objVoAddFacility.getFacilitytype());
								pstmtFacUpdate.setString(3, objVoAddFacility.getDescription());
								pstmtFacUpdate.setString(4, startdate);
								pstmtFacUpdate.setString(5, enddate);
								pstmtFacUpdate.setString(6, objVoAddFacility.getFacopentime());
								pstmtFacUpdate.setString(7, objVoAddFacility.getFacclosetime());
								pstmtFacUpdate.setString(8, objVoAddFacility.getTimeslot());
								pstmtFacUpdate.setString(9, objVoAddFacility.getMembersslot());
								pstmtFacUpdate.setString(10, objVoAddFacility.getFacadd1());
								pstmtFacUpdate.setString(11, objVoAddFacility.getFacadd2());
								pstmtFacUpdate.setString(12, objVoAddFacility.getCity());
								pstmtFacUpdate.setInt(13, objVoAddFacility.getState());
								pstmtFacUpdate.setInt(14, objVoAddFacility.getCountry());
								pstmtFacUpdate.setString(15, objVoAddFacility.getFaczip());
								pstmtFacUpdate.setString(16, objVoAddFacility.getFaccontactno());
								pstmtFacUpdate.setInt(17, objVoAddFacility.getFacilitycategory());
								pstmtFacUpdate.setString(18, objVoAddFacility.getFacid_hidden());
								pstmtFacUpdate.executeUpdate();

								try {
									temp = objVoAddFacility.getFacccdate().split("/");
									temp1 = objVoAddFacility.getFacccdesc().split("/");
									if (objVoAddFacility.getFunction().equals("update")) {

										String del = "DELETE FROM  tbl_optholidays WHERE facility_id ='" + objVoAddFacility.getFacid_hidden() + "'";
										dbcon.con.createStatement().executeUpdate(del);

										for (int i = 0; i <= temp.length - 1; i++) {
											Date = temp[i];
											Desc = temp1[i];
											sql = "INSERT INTO tbl_optholidays (`facility_id`,`Date`,`Description`) VALUES ('"
													+ objVoAddFacility.getFacid_hidden() + "','" + Date + "','" + Desc + "')";
											flag = dbcon.con.createStatement().executeUpdate(sql);
										}
									}
									if (objVoAddFacility.getFunction().equals("insert")) {

										for (int i = 0; i <= temp.length - 1; i++) {
											Date = temp[i];
											Desc = temp1[i];
											sql = "INSERT INTO tbl_optholidays (`facility_id`,`Date`,`Description`) VALUES ('"
													+ objVoAddFacility.getFacid_hidden() + "','" + Date + "','" + Desc + "')";
											flag = dbcon.con.createStatement().executeUpdate(sql);
										}
									}
								} catch (Exception ee) {
									cBLogger.error("class Name : cDFacilityManage,  Function : updateDetailsDB , Error : ", ee);
								}

								y = 2;
							}
						} else {
							String checkFacilityUnique1 = "select * from tb_facilities where facility_name='" + objVoAddFacility.getFacilityname() + "'";
							check1 = dbcon.con.createStatement().executeQuery(checkFacilityUnique1);
							if (check1.next()) {
								cBLogger.error("Facility Name already exist");
								updateflag = 1;
								y = 1;
							} else {

								String checkAppointment = "select appoint_id from tb_appointment where facility_id='" + objVoAddFacility.getFacid_hidden()
										+ "'";
								rs = dbcon.con.createStatement().executeQuery(checkAppointment);
								if (rs.next()) {
									cBLogger.error("Facility Cannot be updated There were fixed appoinments");
									updateflag = 2;
									y = 4;
								} else {
									pstmtFacUpdate = dbcon.con.prepareStatement(
											"update tb_facilities set facility_name=?,facility_type=?,facility_desc=?,facility_from_date=?,facility_to_date=?,facility_from_time=?,facility_to_time=?,time_per_slot=?,members_per_slot=?,facility_add1=?,facility_add2=?,facility_city=?,facility_state_id=?,facility_country_id=?,facility_zip_code=?,facility_contact_no=?,facilitycategory=? where facility_id=?");

									pstmtFacUpdate.setString(1, objVoAddFacility.getFacilityname());
									pstmtFacUpdate.setString(2, objVoAddFacility.getFacilitytype());
									pstmtFacUpdate.setString(3, objVoAddFacility.getDescription());
									pstmtFacUpdate.setString(4, objVoAddFacility.getFacstartdate());
									pstmtFacUpdate.setString(5, objVoAddFacility.getFacenddate());
									pstmtFacUpdate.setString(6, objVoAddFacility.getFacopentime());
									pstmtFacUpdate.setString(7, objVoAddFacility.getFacclosetime());
									pstmtFacUpdate.setString(8, objVoAddFacility.getTimeslot());
									pstmtFacUpdate.setString(9, objVoAddFacility.getMembersslot());
									pstmtFacUpdate.setString(10, objVoAddFacility.getFacadd1());
									pstmtFacUpdate.setString(11, objVoAddFacility.getFacadd2());
									pstmtFacUpdate.setString(12, objVoAddFacility.getCity());
									pstmtFacUpdate.setInt(13, objVoAddFacility.getState());
									pstmtFacUpdate.setString(14, objVoAddFacility.getCity());
									pstmtFacUpdate.setString(15, objVoAddFacility.getFaczip());
									pstmtFacUpdate.setString(16, objVoAddFacility.getFaccontactno());
									pstmtFacUpdate.setInt(17, objVoAddFacility.getFacilitycategory());
									pstmtFacUpdate.setString(18, objVoAddFacility.getFacid_hidden());
									// pstmtFacUpdate.setString(14, objVoAddFacility.getFaczip());
									// pstmtFacUpdate.setString(15,
									// objVoAddFacility.getFaccontactno());
									// pstmtFacUpdate.setInt(16, objVoAddFacility.getFacholiday());
									// pstmtFacUpdate.setString(17,
									// objVoAddFacility.getFacid_hidden());
									// pstmtFacUpdate.setInt(18,
									// objVoAddFacility.getFacilitycategory());
									pstmtFacUpdate.executeUpdate();

									try {
										temp = objVoAddFacility.getFacccdate().split("/");
										temp1 = objVoAddFacility.getFacccdesc().split("/");
										if (objVoAddFacility.getFunction().equals("update")) {

											String del = "DELETE FROM  tbl_optholidays WHERE facility_id ='" + objVoAddFacility.getFacid_hidden() + "'";
											dbcon.con.createStatement().executeUpdate(del);

											for (int i = 0; i <= temp.length - 1; i++) {
												Date = temp[i];
												Desc = temp1[i];
												sql = "INSERT INTO tbl_optholidays (`facility_id`,`Date`,`Description`) VALUES ('"
														+ objVoAddFacility.getFacid_hidden() + "','" + Date + "','" + Desc + "')";
												flag = dbcon.con.createStatement().executeUpdate(sql);
											}
										}
										if (objVoAddFacility.getFunction().equals("insert")) {

											for (int i = 0; i <= temp.length - 1; i++) {
												Date = temp[i];
												Desc = temp1[i];
												sql = "INSERT INTO tbl_optholidays (`facility_id`,`Date`,`Description`) VALUES ('"
														+ objVoAddFacility.getFacid_hidden() + "','" + Date + "','" + Desc + "')";
												flag = dbcon.con.createStatement().executeUpdate(sql);
											}
										}
									} catch (Exception ee) {
										cBLogger.error("class Name : cDFacilityManage,  Function : updateDetailsDB , Error : ", ee);
									}
									y = 2;
								}
							}
						}
					}
				} catch (Exception updateclass) {
					cBLogger.error("class Name : cDFacilityManage,  Function : updateDetailsDB , Error : ", updateclass);
					y = 3; // error

				} finally {
					try {
						if (rs != null)
							rs.close();
						if (check != null)
							check.close();
						if (check1 != null)
							check1.close();
						if (pstmtFacUpdate != null)
							pstmtFacUpdate.close();

					} catch (SQLException e) {
						cBLogger.error("class Name : cDFacilityManage,  Function : updateDetailsDB , Error : ", e);
					}
					objConnMan.closeConnection(dbcon.index);
				}
			}
		} catch (Exception db) {
			cBLogger.error("class Name : cDFacilityManage,  Function : updateDetailsDB , Error : ", db);
			y = 0; // Data Base Connection Problem
		}
		return y;
	}

	public int deleteFacilityDB(String temp) {
		int y = 0;
		int flag = 0;
		if (connected) {
			ResultSet rs = null;
			try {
				String checkAppointment = "select appoint_id from tb_appointment where facility_id='" + temp + "'";
				rs = dbcon.con.createStatement().executeQuery(checkAppointment);
				if (rs.next()) {
					flag = 1;
					y = 1;
				}

				String deleteQuery = "delete from tb_facilities where facility_id='" + temp + "'";
				if (flag == 0) {
					dbcon.con.createStatement().executeUpdate(deleteQuery);
					y = 2;
				}

			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDFacilityManage,  Function : deleteFacilityDB , Error : ", sqlex);
			}

			finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return y;
	}

	public ArrayList getFacilityList(String facilitytype, String search_by_facname, String userid, int schoolId) {
		ArrayList arr = new ArrayList();
		if (connected) {
			ResultSet r1 = null;

			try {

				String selectQuery = "select * from tb_facilities where user_id='" + userid + "' and school_id=" + schoolId + "  ";
				if (!facilitytype.equalsIgnoreCase("All")) {
					selectQuery = selectQuery + " and facility_type='" + facilitytype + "' ";
				}

				if (!search_by_facname.equalsIgnoreCase("")) {
					selectQuery += " and facility_name like '%" + search_by_facname + "%'";
				}

				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				while (r1.next()) {

					arr.add(r1.getString(3)); // facility name
					arr.add(r1.getString(5)); // facility start date
					arr.add(r1.getString(6)); // facility end date
					arr.add(r1.getString(7)); // facility start time
					arr.add(r1.getString(8)); // facility end time
					arr.add(r1.getInt(1));
					arr.add(r1.getString(2)); // facility business id
					arr.add(r1.getString(4)); // facility type
					arr.add(r1.getString(19));

				}
			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDFacilityManage,  Function : getFacilityList , Error : ", sqlex);
			}

			finally {
				try {
					if (r1 != null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage,  Function : getFacilityList , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}

	public ArrayList getFacilityDetails(int facility_id) {
		ArrayList facilityDetails = new ArrayList();
		if (connected) {
			ResultSet rs = null;
			try {
				facilityDetails.clear();
				String query = "select * from tb_facilities where facility_id='" + facility_id + "'";
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					facilityDetails.add(rs.getString(1));/* 0facility id */
					facilityDetails.add(rs.getString(2));/* 1facility buisness id */
					facilityDetails.add(rs.getString(3));/* 2facility name */
					facilityDetails.add(rs.getString(4));/* 3facility type */
					facilityDetails.add(rs.getString(5));/* 4facility from date */
					facilityDetails.add(rs.getString(6));/* 5facility to date */
					facilityDetails.add(rs.getString(7));/* 6facility from time */
					facilityDetails.add(rs.getString(8));/* 7facility to time */
					facilityDetails.add(rs.getString(9));/* 8time per slot */
					facilityDetails.add(rs.getString(10));/* 9member per slot */
					facilityDetails.add(rs.getString(11));/* 10facility desc */
					facilityDetails.add(rs.getString(12));/* 11facility address1 */
					facilityDetails.add(rs.getString(13));/* 12facility address2 */
					facilityDetails.add(rs.getString(14));/* 13facility city */
					facilityDetails.add(rs.getString(15));/* 14zip code */
					facilityDetails.add(rs.getString(16));/* 15state id */
					facilityDetails.add(rs.getString(17));/* 16country id */
					facilityDetails.add(rs.getString(18));/* 17contact no */
					facilityDetails.add(rs.getString(19));/* 18status */
					facilityDetails.add(rs.getInt(20));/* category */

				}

			} catch (Exception e) {
				cBLogger.error("class Name : cDFacilityManage,  Function : getFacilityDetails , Error : ", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage,  Function : getFacilityDetails , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return facilityDetails;
	}

	public ArrayList getBusinessAddress(String user_id) {
		ArrayList businessAddress = new ArrayList();
		if (connected) {
			ResultSet rs = null;
			try {
				businessAddress.clear();
				String query = "select b.business_add1,b.business_add2,b.business_city,b.business_zipcode,b.business_stateid from tb_business b where b.user_id='"
						+ user_id + "'";
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					businessAddress.add(rs.getString(1));/* 0address line1 */
					businessAddress.add(rs.getString(2));/* 1address line2 */
					businessAddress.add(rs.getString(3));/* 2city */
					businessAddress.add(rs.getString(4));/* 3 Zip code */
					businessAddress.add(rs.getString(5));/* 3 State name */
				}

			} catch (Exception e) {
				cBLogger.error("class Name : cDFacilityManage,  Function : getBusinessAddress , Error : ", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage,  Function : getBusinessAddress , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return businessAddress;
	}

	public ArrayList getholidaydetail(int facility_id) {
		ArrayList hoildayDet = new ArrayList();
		if (connected) {
			ResultSet rs = null;
			try {
				String query = "select Date,Description from tbl_optholidays where facility_id='" + facility_id + "'";
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					hoildayDet.add(rs.getString(1));/* 0address line1 */
					hoildayDet.add(rs.getString(2));/* 1address line2 */
				}

			} catch (Exception e) {
				cBLogger.error("class Name : cDFacilityManage,  Function : getholidaydetail , Error : ", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage,  Function : getholidaydetail , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return hoildayDet;
	}

	public String getBusinessId(String user_id) {
		String businessid = "";
		if (connected) {
			ResultSet rs = null;
			try {

				String query = "SELECT business_id FROM tb_business where user_id='" + user_id + "'";
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					businessid = rs.getString(1);
				}

			} catch (Exception e) {
				cBLogger.error("class Name : cDFacilityManage,  Function : getBusinessId , Error :  ", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage,  Function : getBusinessId , Error :  ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return businessid;
	}

	public ArrayList getfacility_id() {
		ArrayList facility_id = new ArrayList();
		String sql = "";
		if (connected) {
			ResultSet rs = null;
			ResultSet rs1 = null;

			try {
				sql = "SELECT Max(facility_id) from tb_facilities";
				rs = dbcon.con.createStatement().executeQuery(sql);
				while (rs.next()) {
					facility_id.add(rs.getInt(1));
				}
				String sql1 = "SELECT facility_from_date,facility_to_date from tb_facilities where facility_id='" + facility_id.get(0) + "'";
				rs1 = dbcon.con.createStatement().executeQuery(sql1);
				while (rs1.next()) {
					facility_id.add(rs1.getString(1));
					facility_id.add(rs1.getString(2));
				}
			} catch (Exception e) {
				cBLogger.error("class Name : cDFacilityManage,  Function : getfacility_id , Error :  ", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (rs1 != null)
						rs1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage,  Function : getfacility_id , Error :  ", e);
				}

				objConnMan.closeConnection(dbcon.index);
			}
		}
		return facility_id;

	}

	public int Addoptholiday(String date, String desc, int facilityid, String function) {
		int flag = 0;
		String sql = "";
		String Date = "";
		String Desc = "";
		if (connected) {
			try {
				String temp[];
				String temp1[];
				temp = date.split("/");
				temp1 = desc.split("/");
				if (function.equals("insert")) {
					for (int i = 0; i <= temp.length - 1; i++) {
						Date = temp[i];
						Desc = temp1[i];
						sql = "INSERT INTO tbl_optholidays (`facility_id`,`Date`,`Description`) VALUES ('" + facilityid + "','" + Date + "','" + Desc + "')";
						flag = dbcon.con.createStatement().executeUpdate(sql);
					}
				}
			} catch (Exception e) {
				cBLogger.error("class Name : cDFacilityManage,  Function : Addoptholiday , Error :  ", e);
			} finally {
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return flag;

	}

	public boolean getBusinnesstoUserDet(String facId, String businessId, String user_id, String Role_id) {
		boolean flag = false;
		if (connected) {
			ResultSet rs1 = null;
			ResultSet rs2 = null;

			try {
				String query = "";
				if (Role_id.equals("3"))// business User
				{
					query = "select count(*) from tb_user_to_business_map where user_id = '" + user_id + "' and business_id='" + businessId + "'";
					rs1 = dbcon.con.createStatement().executeQuery(query);
					while (rs1.next()) {
						if (rs1.getInt(1) == 1) {
							flag = true;
						}
					}
				} else {// business Owner
					query = "select count(*) from tb_business b,tb_users u where u.user_id='" + user_id + "' and u.user_id=b.user_id and business_id='"
							+ businessId + "'";
					rs1 = dbcon.con.createStatement().executeQuery(query);
					while (rs1.next()) {
						if (rs1.getInt(1) == 1) {
							flag = true;
						} else {
							String sql = "select count(*) from tb_user_to_business_map where business_id='" + businessId + "' and user_id='" + user_id + "'";
							rs2 = dbcon.con.createStatement().executeQuery(sql);
							while (rs2.next()) {
								if (rs2.getInt(1) == 1) {
									flag = true;
								}
							}
						}
					}
				}

			} catch (Exception e) {
				cBLogger.error("class Name : cDFacilityManage,  Function : getBusinnesstoUserDet , Error :  ", e);
			} finally {
				try {
					if (rs1 != null)
						rs1.close();
					if (rs2 != null)
						rs2.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage,  Function : getBusinnesstoUserDet , Error :  ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return flag;

	}

	public int insert_user_to_business(String user_id, String business_id) {
		int flag = 0;
		if (connected) {
			try {
				String sql = "INSERT INTO tb_user_to_business_map (`user_business_id`,`user_id`,`business_id`) VALUES (null,'" + user_id + "','" + business_id
						+ "')";
				flag = dbcon.con.createStatement().executeUpdate(sql);
			} catch (Exception e) {
				cBLogger.error("class Name : cDFacilityManage,  Function : insert_user_to_business , Error :  ", e);
			} finally {
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return flag;

	}

	// Method to update appointment status
	public int hereUpdateAppointmentStatus(cVFacilityManage objVoAddFacility) {
		int y = 0;
		if (connected) {
			ResultSet r1 = null;
			try {
				String updateQuery = "update tb_facilities set facility_status='" + objVoAddFacility.getFacility_status() + "'" + "where facility_id='"
						+ objVoAddFacility.getSelected_ids() + "'";
				dbcon.con.createStatement().executeUpdate(updateQuery);
				y = 1;
			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT cDFacilityManage.JAVA ----", sqlex);
				return y;
			} finally {
				try {
					if (r1 != null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage, Function : hereUpdateAppointmentStatus , Error", e);

				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return y;
	}

	// Method to update appointment details
	public int updateAppointmentDetails(cVFacilityManage objVoAddFacility) {
		int y = 0;
		if (connected) {
			ResultSet r1 = null;
			cDCommon obj = new cDCommon();
			String startdate = obj.getDateFormatterToDB1(objVoAddFacility.getFacstartdate());
			String enddate = obj.getDateFormatterToDB1(objVoAddFacility.getFacenddate());
			try {
				String updateQuery = "update tb_appointment set appoint_from_time='" + objVoAddFacility.getFacopentime() + "' ,appoint_to_time='"
						+ objVoAddFacility.getFacclosetime() + "'," + "appoint_from_date='" + startdate + "',appoint_to_date='" + enddate
						+ "',appointment_status='" + objVoAddFacility.getAppointment_status() + "',appointment_remark='"
						+ objVoAddFacility.getAppointment_remark() + "'where appoint_id='" + objVoAddFacility.getAppointment_id() + "' ";
				dbcon.con.createStatement().executeUpdate(updateQuery);
				y = 1;
			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT cDFacilityManage.JAVA ----", sqlex);
				return y;
			} finally {
				try {
					if (r1 != null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage, Function : updateAppointmentDetails , Error", e);

				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return y;
	}

	public List<String> getCountryNameById(String countryId, String stateId, String cityId, String categoryId) {
		List<String> nameById = new ArrayList<String>();
		String name = "--";
		String selectQuery = "";
		if (connected) {
			ResultSet r1 = null;
			try {
				selectQuery = "select c.country_name from tb_country as c where c.country_id='" + countryId + "'";
				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				if (r1.next()) {
					name = r1.getString(1);
				}
				r1.close();
				nameById.add(name);

				selectQuery = "select s.state_name from tb_states as s where s.state_id='" + stateId + "'";
				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				if (r1.next()) {
					name = r1.getString(1);
				}
				r1.close();
				nameById.add(name);

				selectQuery = "select c.cityname from tb_city as c where c.cityid='" + cityId + "'";
				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				if (r1.next()) {
					name = r1.getString(1);
				}
				r1.close();
				nameById.add(name);
				selectQuery = "select c.category_name from tb_category as c where c.category_id='" + categoryId + "'";
				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				if (r1.next()) {
					name = r1.getString(1);
				}
				r1.close();
				nameById.add(name);

			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT cDFacilityManage.JAVA ----", sqlex);

			} finally {
				try {
					if (r1 != null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFacilityManage, Function : updateAppointmentDetails , Error", e);

				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return nameById;
	}

}
