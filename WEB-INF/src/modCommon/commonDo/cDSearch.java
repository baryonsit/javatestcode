package modCommon.commonDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;

import modLogger.cBLogger;

//import java.lang.*;

public class cDSearch {
	ResultSet r3=null,r1=null,r2 = null;
	int x = 0;
	ArrayList arr = new ArrayList();
	/*Connection dbcon = null;
	boolean connected = true ;
	cDConnectionManager objConnMan;*/
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	public cDSearch() {
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
			cBLogger.error("class Name : cDSearch, Constructor : cDSearch ,error ", e);	
		}
	}
	
	public Hashtable<String, ArrayList<String>>  SearchBuisness(String values)
	{
		Hashtable<String, ArrayList<String>> hs =new Hashtable<String, ArrayList<String>>();
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				int i=0;
				arr.clear();				
				String retVal = "no";
				
				String selectQuery="select business_name,business_desc,business_id,business_countryid,business_stateid,business_categoty from tb_business ";
				if(values.length()>0){
					selectQuery+=" where "+values+"";
				}
				rs=dbcon.con.createStatement().executeQuery(selectQuery);
				while (rs.next()) { // fname,mname,lname,email,phno,gender,nationality,empid
					i++;
					retVal = "yes";
				
					arr.add(rs.getString(1));
					arr.add(rs.getString(2));	
					arr.add(rs.getString(3));	
					arr.add(rs.getString(4));
					arr.add(rs.getString(5));	
					arr.add(rs.getString(6));	
					hs.put(String.valueOf(i),arr);
					
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDSearch, Function : SearchBuisness, error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDSearch, Function : SearchBuisness, error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return hs;
	
}
	
	public ArrayList getStateListForSearchDB(String country_id )
	{

		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			String	query="SELECT * FROM tb_states where country_id="+country_id+"";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					arr.add(rs.getInt(1));			//state id
					arr.add(rs.getInt(2));		//country id
					arr.add(rs.getString(3));		//state name
					
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDSearch, Function : getStateListForSearchDB, error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDSearch, Function : getStateListForSearchDB, error : ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
}
