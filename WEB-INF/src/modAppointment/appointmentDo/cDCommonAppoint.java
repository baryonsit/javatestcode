package modAppointment.appointmentDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;

import modAppointment.appointmentBo.cBCommonAppoint;
import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;

public class cDCommonAppoint {
	ArrayList arr = new ArrayList();
	ResultSet r3 = null, r1 = null, r2 = null;
	
	/*int x = 0;
	Connection dbcon = null;
	boolean connected = true;
	cDConnectionManager objConnMan;*/
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;

	public cDCommonAppoint() {
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
			cBLogger.error("class Name : cDCommonAppoint, Constuctor : cDCommonAppoint , Error : ",e);
		}
	}

	public Hashtable getAppointFromDB(String facility_id) {
		int a = 0;
		Hashtable hashtable = new Hashtable();
		if (connected) {
			ResultSet rs=null;
			try {
				String query = "SELECT SUBSTRING(appoint_from_time,1,5),appoint_from_date FROM tb_appointment where facility_id='"
						+ facility_id + "'";
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					/*
					 * arr.add(rs.getString(1)); arr.add(rs.getString(2));
					 * arr.add(rs.getString(3));
					 */
					hashtable.put(rs.getString(1), rs.getString(2));
					// hashtable.put(rs.getString(1),rs.getString(2));
					a = 1;

				}
			} catch (SQLException sqlex) {
				cBLogger.error("class name : cBCommonAppoint, Function : cancelAppointment ,error : ",sqlex);	

			} finally {
					try {
						if(rs!=null)
							rs.close();
					} catch (SQLException e) {
						cBLogger.error("class name : cBCommonAppoint, Function : cancelAppointment ,error : ",e);	
					}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return hashtable;

	}

	public Hashtable getAppointToDateFromDB(String facility_id) {
		int a = 0;
		Hashtable hashtable = new Hashtable();
		if (connected) {
			ResultSet rs=null;
			try {
				String query = "SELECT SUBSTRING(appoint_from_time,1,5),SUBSTRING(appoint_to_time,1,5) FROM tb_appointment where facility_id='"
						+ facility_id + "'";
				
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					/*
					 * arr.add(rs.getString(1)); arr.add(rs.getString(2));
					 * arr.add(rs.getString(3));
					 */
					hashtable.put(rs.getString(1), rs.getString(2));
					// hashtable.put(rs.getString(1),rs.getString(2));
					a = 1;

				}
			} catch (SQLException sqlex) {
				cBLogger.error("class name : cBCommonAppoint, Function : cancelAppointment ,error : ", sqlex);	

			} finally {
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class name : cBCommonAppoint, Function : cancelAppointment ,error : ",e);
				}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return hashtable;

	}

	public String getSlotFromDB(String facility_id) {
		String slotvalue = "";
		if (connected) {
			ResultSet rs=null;
			try {
				String query = "SELECT SUBSTRING(time_per_slot,1,5) FROM tb_facilities where facility_id='"
						+ facility_id + "'";
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					slotvalue = rs.getString(1);

				}
			} catch (SQLException sqlex) {
				cBLogger.error("class name : cDCommonAppoint, Function : getSlotFromDB ,error : ", sqlex);	

			} finally {
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class name : cDCommonAppoint, Function : getSlotFromDB ,error : ", e);		
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return slotvalue;

	}

	public Hashtable getAppointToTimeDateFromDB(String facility_id) {
		int a = 0;
		Hashtable hashtable = new Hashtable();
		if (connected) {
			ResultSet rs=null;
			try {
				String query = "SELECT SUBSTRING(appoint_to_time,1,5),appoint_to_date FROM tb_appointment where facility_id='"
						+ facility_id + "'";
				
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					hashtable.put(rs.getString(1), rs.getString(2));
				}
			} catch (SQLException sqlex) {
				cBLogger.error("class name : cDCommonAppoint, Function : getAppointToTimeDateFromDB ,error : ", sqlex);	

			} finally {
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class name : cDCommonAppoint, Function : getAppointToTimeDateFromDB ,error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return hashtable;

	}

	public ArrayList getAppFromToDateFromDB(String facility_id,int month,int year) {
		int a = 0;
		String mon="";
		int newMonth=month+1;
		ArrayList<ArrayList<String>> apptimedt = new ArrayList<ArrayList<String>>();
		if (connected) {
			ResultSet rs=null;
			try {
				if(newMonth<10)
				{
					mon="0"+newMonth;
				}
				else
				{
					mon=""+newMonth;
				}
				/*String query = "SELECT appoint_id,facility_id,user_id,SUBSTRING(appoint_from_time,1,5),SUBSTRING(appoint_to_time,1,5),appoint_from_date,appoint_to_date,appointment_status,DATEDIFF(appoint_to_date,appoint_from_date) FROM tb_appointment where facility_id='"
						+ facility_id + "' and appoint_from_date like '%"+year+"-"+mon+"%' and appoint_to_date like '%"+year+"-"+mon+"%'";*/
				String query = "SELECT appoint_id,facility_id,user_id,SUBSTRING(appoint_from_time,1,5),SUBSTRING(appoint_to_time,1,5),appoint_from_date,appoint_to_date,appointment_status,DATEDIFF(appoint_to_date,appoint_from_date) FROM tb_appointment where facility_id='"
					+ facility_id + "' and appoint_from_date like '%"+year+"-"+mon+"%' and appoint_to_date like '%"+year+"-"+mon+"%' and appointment_status!='Cancelled' ";
				
				rs = dbcon.con.createStatement().executeQuery(query);
				int i = 0;
				while (rs.next()) {
					ArrayList<String> list1 = new ArrayList<String>();
					list1.add(rs.getString(1));
					list1.add(rs.getString(2));
					list1.add(rs.getString(3));
					list1.add(rs.getString(4));
					list1.add(rs.getString(5));
					list1.add(rs.getString(6));
					list1.add(rs.getString(7));
					//list1.add(changeDBDate(rs.getString(6)));
					//list1.add(changeDBDate(rs.getString(7)));
					list1.add(rs.getString(8));
					list1.add(rs.getString(9));
					apptimedt.add(list1);
						
					//list1.clear();
					
				}

			} catch (SQLException sqlex) {
				
				cBLogger.error("class name : cDCommonAppoint, Function : getAppFromToDateFromDB ,error : ", sqlex);	

			} finally {
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class name : cDCommonAppoint, Function : getAppFromToDateFromDB ,error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return apptimedt;

	}
	public int checkavail(String facility_id,String fromDT,String toDT,String fromTime,String toTime) {
		int count = 0;
		
		if (connected) {
			ResultSet rs=null;

			try {
				String query = "SELECT count(*) FROM tb_appointment where facility_id='"+ facility_id + "' and appoint_from_date>='"+ fromDT +"' and appoint_to_date<='"+toDT+"' and appoint_from_time>='"+fromTime+"' and appoint_to_time<='"+toTime+"'";
				
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					count=rs.getInt(1);
				}
			} catch (SQLException sqlex) {
				
				cBLogger.error("class name : cDCommonAppoint, Function : checkavail ,error : ", sqlex);	

			} finally {
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class name : cDCommonAppoint, Function : checkavail ,error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return count;

	}
	
	public String changeDBDate(String dbDate) {
		String fromDT= dbDate;
		String dateFromTo="";
		cBCommonAppoint app = new cBCommonAppoint();
		try {
		Calendar FDT=app.getCalenderDateTime(fromDT+" "+"00"+":"+"00");
		FDT.set(FDT.get(Calendar.YEAR),FDT.get(Calendar.MONTH),FDT.get(Calendar.DATE));
		if(FDT.get(Calendar.MONTH)<10 && FDT.get(Calendar.DATE)<10) {
			dateFromTo = FDT.get(Calendar.YEAR)+"-"+"0"+FDT.get(Calendar.MONTH)+"-"+"0"+FDT.get(Calendar.DATE);
		}
		else if((FDT.get(Calendar.MONTH)>10 && FDT.get(Calendar.DATE)<10)) {
			dateFromTo = FDT.get(Calendar.YEAR)+"-"+FDT.get(Calendar.MONTH)+"-"+"0"+FDT.get(Calendar.DATE);
		} 
		else if((FDT.get(Calendar.MONTH)<10 && FDT.get(Calendar.DATE)>10)) {
			dateFromTo = FDT.get(Calendar.YEAR)+"-"+"0"+FDT.get(Calendar.MONTH)+"-"+FDT.get(Calendar.DATE);
		}
		else
		{
			dateFromTo = FDT.get(Calendar.YEAR)+"-"+FDT.get(Calendar.MONTH)+"-"+FDT.get(Calendar.DATE);
		}
		  }
		catch (Exception e) {
			cBLogger.error("class name : cDCommonAppoint, Function : changeDBDate ,error : ", e);	

		}
		return dateFromTo;
	}


}
