package modAppointment.appointmentDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;


public class cDGetData {
	
	/*Connection dbcon = null;
	boolean connected = true ;
	cDConnectionManager objConnMan;*/
	ArrayList arr=new ArrayList();
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	public cDGetData() {

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
	
	public ArrayList getSearchData(){
		arr.clear();
		if (connected) {
			ResultSet rs=null;
			try {
				String sql="SELECT appoint_id,(select facility_name from " +
						"tb_facilities where facility_id=a.facility_id) as facilityname," +
						"(select user_name from tb_users where user_id=a.user_id) as username," +
						"appointment_status,appoint_from_date,appoint_to_date,appoint_from_time," +
						"appoint_to_time  FROM tb_appointment a";
				rs=dbcon.con.createStatement().executeQuery(sql);
				while (rs.next()) {

					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
					arr.add(rs.getString(3));
					arr.add(rs.getString(4));
					arr.add(rs.getString(5));
					arr.add(rs.getString(6));
					arr.add(rs.getString(7));
					arr.add(rs.getString(8));

				}
			}catch (Exception ec) {
				cBLogger.error("class Name : cDGetData, Function : getSearchData, Error : ", ec);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDGetData, Function : getSearchData, Error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return arr;
	}
}