package modAppointment.appointmentDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import modAppointment.appointmentBo.cBCommonAppoint;
import modAppointment.appointmentVo.cVFixAppointment;
import modAppointment.appointmentVo.emailTemplate;
import modCommon.commonDo.cDCommon;
import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;

public class cDFixAppointment {

	ResultSet r3 = null, r1 = null, r2 = null;
	/*
	 * Connection dbcon = null; boolean connected = true ; cDConnectionManager
	 * objConnMan;
	 */

	cDConnectionManager objConnMan = null;
	indexConnection dbcon = null;
	boolean connected = false;

	public cDFixAppointment() {
		try {
			objConnMan = cDConnectionManager.getObjHandle();
			dbcon = objConnMan.openConnection();

			if (dbcon.con == null)
				connected = false;
			else
				connected = true;
		} catch (Exception e) {
			cBLogger.error("class Name : cDFixAppointment, Constuctor : cDFixAppointment, Error : ", e);
		}
	}

	public int getFix(cVFixAppointment cvfa) {
		int y = 0;
		if (connected) {
			ResultSet rs = null;
			Statement stmt = null;

			try {
				dbcon.con.setAutoCommit(false);

				String from = cvfa.getAppfromdate().toString();
				String to = cvfa.getApptodate().toString();
				
				cDCommon obj = new cDCommon();
				String startDate=obj.getDateFormatterToDB1(from);
				String endDate=obj.getDateFormatterToDB1(to);
				//var startAcademicDate = formatDateToYYYYMMDD(from);
				cBCommonAppoint objDate = new cBCommonAppoint();
				Calendar fromDate = objDate.getCalenderDate(startDate);
				Calendar toDate = objDate.getCalenderDate(endDate);

				String appDate = "";
				String flag = "success";
				stmt = dbcon.con.createStatement();

				if (fromDate.equals(toDate)) {
					String sql = "insert into tb_appointment values(0,'" + cvfa.getFacid() + "','" + cvfa.getUid()
							+ "','" + cvfa.getApptimefrom() + "','" + cvfa.getApptimeto() + "','"
							+startDate + "','" + startDate + "','Booked','"
							+ cvfa.getAppointment_review() + "')";
					y = dbcon.con.createStatement().executeUpdate(sql);
				} else {
					String fixApp = "insert into tb_appointment values(0,'" + cvfa.getFacid() + "','" + cvfa.getUid()
							+ "','" + cvfa.getApptimefrom() + "','" + cvfa.getApptimeto() + "','"
							+ startDate + "','" + startDate + "','Booked','"
							+ cvfa.getAppointment_review() + "')";
					stmt.addBatch(fixApp);

					Calendar date = (Calendar) fromDate.clone();
					while (date.before(toDate)) {
						date.add(Calendar.DATE, 1);
						appDate = date.get(Calendar.YEAR) + "-" + (date.get(Calendar.MONTH) + 1) + "-"
								+ date.get(Calendar.DATE);

						String checkQuery = "select * from tb_appointment where appoint_from_date='" + appDate
								+ "' and appointment_status='Booked' and appoint_from_time='" + cvfa.getApptimefrom()
								+ "' and appoint_to_time='" + cvfa.getApptimeto() + "'";
						rs = dbcon.con.createStatement().executeQuery(checkQuery);
						if (rs.next()) {
							flag = "fail";
							y = 2;
						} else {
							fixApp = "insert into tb_appointment values(0,'" + cvfa.getFacid() + "','" + cvfa.getUid()
									+ "','" + cvfa.getApptimefrom() + "','" + cvfa.getApptimeto() + "','" + appDate
									+ "','" + appDate + "','Booked','" + cvfa.getAppointment_review() + "')";
							stmt.addBatch(fixApp);
							y = 1;
						}

					}
				}
				try {
					if (flag == "success") {
						stmt.executeBatch();
						dbcon.con.commit();
						y = 1;
					} else {
						y = 2;
					}
				} catch (Exception e) {
					cBLogger.error("class Name : cDFixAppointment, Function : getFix , Error :", e);
					dbcon.con.rollback();
					y = 0;
				}

			} catch (Exception ec) {
				cBLogger.error("class Name : cDFixAppointment, Function : getFix , Error :", ec);
			} finally {
				try {
					dbcon.con.setAutoCommit(true);
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
				} catch (Exception e) {
					cBLogger.error("class Name : cDFixAppointment, Function : getFix , Error :", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return y;
	}

	public ArrayList getAppointmentDetails(String user_id, String facid, String fromdate) {
		ArrayList appointmentDetails = new ArrayList();
		if (connected) {
			ResultSet rs = null;
			try {
				appointmentDetails.clear();
				String query = "select * from tb_appointment where user_id='" + user_id + "' and facility_id='" + facid
						+ "' and appoint_from_date='" + fromdate + "' and appointment_status='Booked'";

				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					appointmentDetails.add(rs.getInt(1));/* 0appoint id */
					appointmentDetails.add(rs.getInt(2));/* 1facility id */
					appointmentDetails
							.add(rs.getString(4));/* 2appointment from time */
					appointmentDetails
							.add(rs.getString(5));/* 3appointment to time */
					appointmentDetails
							.add(rs.getString(6));/* 4appointment from date */
					appointmentDetails
							.add(rs.getString(7));/* 5appointment to date */
				}

			} catch (Exception e) {
				cBLogger.error("class Name : cDFixAppointment, Function : getAppointmentDetails , Error : ", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFixAppointment, Function : getAppointmentDetails , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return appointmentDetails;
	}

	public int cancelAppontmentDB(cVFixAppointment cvfa) {
		int x = 0;
		if (connected) {
			try {
				String query = "update tb_appointment set appointment_status='Cancelled' where appoint_id='"
						+ cvfa.getAppid_hidden() + "'";
				if (dbcon.con.createStatement().executeUpdate(query) == 1) {
					return 1;
				} else {
					return 0;
				}
			} catch (Exception e) {
				cBLogger.error("sql", e);
			} finally {
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return 1;
	}

	public ArrayList checkInviteDeatails(cVFixAppointment cvfa) {
		ArrayList invitationDetails = new ArrayList();
		if (connected) {
			ResultSet rs = null;
			try {
				String selectQuery = "select * from tb_appointment_invitations where appointment_id='"
						+ cvfa.getAppid_hidden() + "' and invite_type='mail'";
				rs = dbcon.con.createStatement().executeQuery(selectQuery);
				while (rs.next()) {
					invitationDetails.add(rs.getInt(1));
					invitationDetails.add(rs.getString(3));
					invitationDetails.add(rs.getString(4));
					invitationDetails.add(rs.getString(5));
				}
			} catch (Exception e) {
				cBLogger.error("sql", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFixAppointment, Function : checkInviteDeatails , Error : ", e);

				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return invitationDetails;
	}

	public List<String> getUserEmailId(String user_id) {
		List<String> details = new ArrayList<String>();
		if (connected) {
			ResultSet rs = null;
			try {
				String query = "select s.email_id,concat(s.first_name,' ',s.middle_name,' ',s.last_name)"
						+ " from tb_student s where s.student_id='" + user_id + "'";

				rs = dbcon.con.createStatement().executeQuery(query);
				if (rs.next()) {
					details.add(rs.getString(1));/* emailId */
					details.add(rs.getString(2));
				}

			} catch (Exception e) {
				cBLogger.error("class Name : cDFixAppointment, Function : getUserEmailId , Error : ", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFixAppointment, Function : getUserEmailId , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return details;
	}

	public List<String> getUserEmailByAppointmentId(int appointmentId) {
		List<String> details = new ArrayList<String>();
		if (connected) {
			ResultSet rs = null;
			try {
//				String query = "select u.email_id,f.facility_name,f.facility_from_date,f.facility_from_time,"
//						+ "concat(u.first_name,' ',u.middle_name,' ',u.last_name) from tb_users u,tb_appointment a,tb_facilities f  "
//						+ "where a.user_id = u.user_id and f.facility_id =a.facility_id and a.appoint_id='"
//						+ appointmentId + "'";
				String query = "select s.email_id,f.facility_name,f.facility_from_date,f.facility_from_time,"
						+ "concat(s.first_name,' ',s.middle_name,' ',s.last_name) from tb_student s,tb_appointment a,"
						+ "tb_facilities f where a.user_id = s.student_id and f.facility_id =a.facility_id and a.appoint_id='"+ appointmentId + "'";

				rs = dbcon.con.createStatement().executeQuery(query);
				if (rs.next()) {
					details.add(rs.getString(1));/* emailId */
					details.add(rs.getString(2));
					details.add(rs.getString(3));
					details.add(rs.getString(4));
					details.add(rs.getString(5));
				}

			} catch (Exception e) {
				cBLogger.error("class Name : cDFixAppointment, Function : getUserEmailByAppointmentId , Error : ", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFixAppointment, Function : getUserEmailByAppointmentId , Error : ",
							e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return details;
	}

	// get email template object on the basis of templateId
	public emailTemplate getEmailTemplateByTemplateId(int emailtemplateId) {
		emailTemplate templateDetails1 = new emailTemplate();
		if (connected) {
			ResultSet rs = null;
			try {
				String selectQuery = "select * from tb_emailTemplate where emailTemplateId='" + emailtemplateId + "'";
				rs = dbcon.con.createStatement().executeQuery(selectQuery);
				while (rs.next()) {
					templateDetails1.setEmailTemplateId((rs.getInt(1)));
					templateDetails1.setEmailTemplateName(rs.getString(2));
					templateDetails1.setEmailTemplateSubject(rs.getString(3));
					templateDetails1.setEmailTemplateBody(rs.getString(4));
					templateDetails1.setEmailSignature1(rs.getString(5));
					templateDetails1.setEmailSignature2(rs.getString(6));
				}
			} catch (Exception e) {
				cBLogger.error("sql", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDFixAppointment, Function : checkInviteDeatails , Error : ", e);

				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return templateDetails1;
	}

}