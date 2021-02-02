package modFacility.facilityDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;

import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;

public class cDCommonFacility {
	ArrayList arr=new ArrayList();
	ResultSet r3=null,r1=null,r2 = null;
	
	/*int x = 0;
	Connection dbcon = null;
	boolean connected = true ;
	cDConnectionManager objConnMan;*/
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	public cDCommonFacility() {
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
			cBLogger.error("class Name : cDCommonFacility, Constructor : cDCommonFacility, Error : ", e);	
		}
	}
	
	
	public ArrayList getFacilityFromDB(String facility_id)
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			String	query="SELECT * FROM tb_facilities where facility_id='"+ facility_id+"'";

				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					arr.add(rs.getString(1));
					arr.add(rs.getString(2));
					arr.add(rs.getString(3));
					arr.add(rs.getString(4));
					arr.add(rs.getString(5));
					arr.add(rs.getString(6));
					arr.add(rs.getString(7));
					arr.add(rs.getString(8));
					arr.add(rs.getString(9));
					arr.add(rs.getString(10));
					arr.add(rs.getString(11));
					arr.add(rs.getString(12));
					arr.add(rs.getString(13));
					arr.add(rs.getString(14));
					arr.add(rs.getString(15));
					arr.add(rs.getString(16));
					arr.add(rs.getString(17));
					arr.add(rs.getString(18));
					arr.add(rs.getString(19));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommonFacility, Function : getFacilityFromDB  , Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommonFacility, Function : getFacilityFromDB  , Error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	
	public ArrayList getTimeSlotsFromDB(String facility_id)
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			String	query="SELECT facility_from_time,facility_to_time,time_per_slot FROM tb_facilities where facility_id='"+facility_id+"'";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					arr.add(rs.getString(1));
					arr.add(rs.getString(2));
					arr.add(rs.getString(3));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommonFacility, Function : getTimeSlotsFromDB  , Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommonFacility, Function : getTimeSlotsFromDB  , Error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	public String getweekholiday(String facility_id){
		String weekholiday="";
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			String	query="SELECT Days FROM tbl_weekholidays where day_id=(SELECT facility_holiday  FROM tb_facilities where facility_id='"+facility_id+"')";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					weekholiday=(rs.getString(1));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommonFacility, Function : getweekholiday  , Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommonFacility, Function : getweekholiday  , Error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return weekholiday;
	}
	public Hashtable getoptholidays(String facility_id){
		Hashtable optholidays= new Hashtable();
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			String	query="SELECT day_id,Date FROM tbl_optholidays where facility_id='"+facility_id+"'";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					optholidays.put(rs.getInt(1), rs.getString(2));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommonFacility, Function : getoptholidays  , Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommonFacility, Function : getoptholidays  , Error : ", e);	
					}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return optholidays;
	}
}
