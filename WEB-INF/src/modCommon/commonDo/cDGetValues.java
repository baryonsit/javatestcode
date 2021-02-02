package modCommon.commonDo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modLogger.cBLogger;

public class cDGetValues {
	
	ArrayList arr=new ArrayList();
	ResultSet r3=null,r1=null,r2 = null;
	//int x = 0;
	/*Connection dbcon = null;
	boolean connected = true ;
	cDConnectionManager objConnMan;
	HttpSession session;*/
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	public cDGetValues() {
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
			cBLogger.error("class Name : cDGetValues, Constructor : cDGetValues, Error :  ", e);	
		}
	}
	public int checkCanFixAppointment(String fac_id,String bid_id,String role_id,String user_id)
	{
		int val = 0;
		if (connected) 
		{
			ResultSet rs2=null;
			ResultSet r1 = null;
			try			
			{
				String query = "select facility_type from tb_facilities where facility_id="+fac_id+"";
				r1 = dbcon.con.createStatement().executeQuery(query);
				if (r1.next()){
					if (r1.getString(1).equals("public")){
						if(role_id.equals("1")) //Super Admin
						{
							val = 1;
						}
						else if(role_id.equals("2")) //Business Owners have Admin role 
						{
							String Query = "select * from tb_business b,tb_users u where u.user_id='"+user_id+"' and u.user_id=b.user_id and business_id='"+bid_id+"' ";
							r1 = dbcon.con.createStatement().executeQuery(Query);
							if(r1.next()) {
								val = 1;
							}
							else {
								String sql="select count(*) from tb_user_to_business_map where business_id='"+bid_id+"' and user_id='"+user_id+"'";
			       	    		rs2 = dbcon.con.createStatement().executeQuery(sql);
			       	    		while(rs2.next()){
					       	    	if(rs2.getInt(1)==1){
					       	    		val=1;
					       	    	}
					       	    }
							}
						}
						else  //Users To Business Map (check registered or not)
						{
							String Query = "select * from tb_user_to_business_map where business_id='"+bid_id+"' and user_id='"+user_id+"' ";
							r1 = dbcon.con.createStatement().executeQuery(Query);
							if(r1.next()) {
								val = 1;
							}
							else {
								val = 0;
							}
						}
			        }
					else 
					{
						//The following check applies for private facilities
						if(role_id.equals("1")) //Super Admin
						{
							val = 1;
						}
						else if(role_id.equals("2")) //Business Owners have Admin role 
						{
							String Query = "select * from tb_business b,tb_users u where u.user_id='"+user_id+"' and u.user_id=b.user_id and business_id='"+bid_id+"' ";
							r1 = dbcon.con.createStatement().executeQuery(Query);
							if(r1.next()) {
								val = 1;
							}
							else {
								String sql="select count(*) from tb_user_to_business_map where business_id='"+bid_id+"' and user_id='"+user_id+"'";
			       	    		rs2 = dbcon.con.createStatement().executeQuery(sql);
			       	    		while(rs2.next()){
					       	    	if(rs2.getInt(1)==1){
					       	    		val=1;
					       	    	}
					       	    }
							}
						} 
						else //Users To Business Map (check registered or not)
						{
							String Query = "select * from tb_user_to_business_map where business_id='"+bid_id+"' and user_id='"+user_id+"' ";
							r1 = dbcon.con.createStatement().executeQuery(Query);
							if(r1.next()) {
								val = 1;
							}
							else {
								val = 0;
							}
						}
					}
				}
				else
					val=0;
				}

				catch (Exception sqlex)
				{
					cBLogger.error("class Name : cDGetValues,  Function : checkCanFixAppointment , Error :  ", sqlex);	
				}
				finally
				{
					try {
						if(r1!=null)
							r1.close();
						if(rs2!=null)
							rs2.close();
					} catch (SQLException e) {
						cBLogger.error("class Name : cDGetValues,  Function : checkCanFixAppointment , Error :  ", e);	
					}
					objConnMan.closeConnection(dbcon.index);
				}
			}
			return val;
	}
	
	
	public String getBusinessType(String fac_id)
	{
		String loFacilityType="";
		if(connected)
		{
			ResultSet rs=null;
			try
			{
				String query="select facility_type from tb_facilities where facility_id='"+fac_id+"'";
				rs=dbcon.con.createStatement().executeQuery(query);
				
				while (rs.next()){
				loFacilityType=(rs.getString('1'));
				}}
				
				catch (SQLException sqlex){
					cBLogger.error("class Name : cDGetValues,  Function : getBusinessType , Error :  ", sqlex);	
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
		return loFacilityType;
}
		
	
	
	//ArrayList
	public ArrayList getCountryDB()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			
				String	query="select country_id,country_name from tb_country";
				rs=dbcon.con.createStatement().executeQuery(query);
				
				while (rs.next()) {

					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
					
					
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDGetValues,  Function : getCountryDB , Error :  ", sqlex);	
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
	
	
	public ArrayList getCountry()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				String default_country="default_country";
				String	query="select country_name,country_id from tb_country where country_id=(select param_value from tb_global_settings where param_name='"+default_country+"')";
			
				rs=dbcon.con.createStatement().executeQuery(query);
				
				while (rs.next()) {

					arr.add(rs.getString(1));	
					arr.add(rs.getInt(2));	
				
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDGetValues,  Function : getCountry , Error :  ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDGetValues,  Function : getCountry , Error :  ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	
	public ArrayList getCountryForBu()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				String default_country="default_country_by_bo";
				String	query="select country_name,country_id from tb_country where country_id=(select param_value from tb_global_settings where param_name='"+default_country+"')";
			
				rs=dbcon.con.createStatement().executeQuery(query);
				
				while (rs.next()) {

					arr.add(rs.getString(1));	
					arr.add(rs.getInt(2));	
					
				
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDGetValues,  Function : getCountryForBu , Error :  ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDGetValues,  Function : getCountryForBu , Error :  ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	
	public ArrayList getStateDB()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				String default_country="default_country";
				String	query="select state_id,state_name from tb_states where country_id=(select param_value from tb_global_settings where param_name='"+default_country+"')";
			
				rs=dbcon.con.createStatement().executeQuery(query);
			
				while (rs.next()) {
					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
					
				
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDGetValues,  Function : getStateDB , Error :  ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDGetValues,  Function : getStateDB , Error :  ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	
	
	
	public ArrayList getStatesForBu()
	{
		if (connected) 
		{
			ResultSet rs=null;

			try
			{	
				String default_country="default_country_by_bo";
				String	query="select state_id,state_name from tb_states where country_id=(select param_value from tb_global_settings where param_name='"+default_country+"')";
			
				rs=dbcon.con.createStatement().executeQuery(query);
			
				while (rs.next()) {

					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
					
				
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDGetValues,  Function : getStatesForBu , Error :  ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDGetValues,  Function : getStatesForBu , Error :  ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	
	public ArrayList getBusinessForBu()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				String default_country="default_country_by_bo";
				String	query="SELECT business_id , business_name from tb_business";
			
				rs=dbcon.con.createStatement().executeQuery(query);
			
				while (rs.next()) {

					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
					
				
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDGetValues,  Function : getStatesForBu , Error :  ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDGetValues,  Function : getStatesForBu , Error :  ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	
	public ArrayList getCurrenciesDB()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				String	query="select * from tb_currency";
			
				rs=dbcon.con.createStatement().executeQuery(query);
			
				while (rs.next()) {

					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));				
				
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDGetValues,  Function : getCurrenciesDB , Error :  ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDGetValues,  Function : getCurrenciesDB , Error :  ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	/*//To get Citylist from db
	public ArrayList getCityDB(String stateId)
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				//String default_country="default_country";
				//String	query="select state_id,state_name from tb_states where country_id=(select param_value from tb_global_settings where param_name='"+default_country+"')";
				String	query= "select cityid,cityname from tb_city where stateid='"+stateId+"'";
				rs=dbcon.con.createStatement().executeQuery(query);
			
				while (rs.next()) {
					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDGetValues,  Function : getCityDB , Error :  ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDGetValues,  Function : getCityDB , Error :  ", e);	
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}*/

	// To get Categorylist from db
	public ArrayList getCategoryDB() {
		if (connected) {
			ResultSet rs = null;
			try {
				String query = "select category_id,category_name from tb_category";
				rs = dbcon.con.createStatement().executeQuery(query);

				while (rs.next()) {
					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
				}
			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDGetValues,  Function : getCategoryDB , Error :  ", sqlex);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDGetValues,  Function : getCategoryDB , Error :  ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	// To get Country list from db
		public ArrayList getCountryList() {
			if (connected) {
				ResultSet rs = null;
				try {
					String query = "select * from tb_countries";
					rs = dbcon.con.createStatement().executeQuery(query);

					while (rs.next()) {
						arr.add(rs.getInt(1));
						arr.add(rs.getString(2));
					}
				} catch (SQLException sqlex) {
					cBLogger.error("class Name : cDGetValues,  Function : getCountryList , Error :  ", sqlex);
				} finally {
					try {
						if (rs != null)
							rs.close();
					} catch (SQLException e) {
						cBLogger.error("class Name : cDGetValues,  Function : getCountryList , Error :  ", e);
					}
					objConnMan.closeConnection(dbcon.index);
				}
			}
			return arr;
		}
		// Function to fetch the default locations for 1st time load of
		// usermanament.jsp
		public String getdefault_locationsDB(String type) {
			String arr = "";
			if (connected) {
				ResultSet rs = null;
				try {
					String default_location = "select param_value from tb_global_settings where param_name='"
							+ type + "'";
					rs = dbcon.con.createStatement().executeQuery(default_location);
					while (rs.next()) {
						arr = rs.getString(1);
					}
				} catch (SQLException sqlex) {
	               System.out.println(sqlex);
				} finally {
					try {
						if (rs != null)
							rs.close();
					} catch (SQLException e) {
					     System.out.println(e);
					}
					objConnMan.closeConnection(dbcon.index);
				}

			}
			return arr;
		}
		public ArrayList getStates(String def_country)
		{
			ArrayList arr=new ArrayList();
			ArrayList States = new ArrayList();
			if (connected) 
			{		
				ResultSet rs5 = null;

				try
				{	
					
					String states = "SELECT state_id , state_name FROM tb_states where country_id='"+def_country+"' order by state_name";
					rs5 = dbcon.con.createStatement().executeQuery(states);
					while(rs5.next()){
						States.add(rs5.getInt(1));
						States.add(rs5.getString(2));
					}
				}
				catch (SQLException sqlex) {
                  System.out.println(sqlex);
				}
				finally
				{
					try {				
						if(rs5!=null)
							rs5.close();
					} catch (SQLException e) {
					    System.out.println(e);
					}
					objConnMan.closeConnection(dbcon.index);
				}
				
			}
			return States;

		}
		public ArrayList getCities(String def_state)
		{
			ArrayList arr=new ArrayList();
			ArrayList Cities = new ArrayList();
			if (connected) 
			{				
				ResultSet rs5 = null;
				try
				{			
					String cities = "SELECT cityid,cityname FROM tb_city where stateid="+def_state;
					rs5 = dbcon.con.createStatement().executeQuery(cities);
					while(rs5.next()){
						Cities.add(rs5.getInt(1));
						Cities.add(rs5.getString(2));
					}
				}
				catch (SQLException sqlex) {
					System.out.println(sqlex);
				}
				finally
				{
					try {
						
						if(rs5!=null)
							rs5.close();
					} catch (SQLException e) {
						System.out.println(e);
					}
					objConnMan.closeConnection(dbcon.index);
				}
				
			}
			return Cities;

		}
		// To get getStatusList from db
		public ArrayList getStatusList() {
			if (connected) {
				ResultSet rs = null;
				try {
					String query = "select status_id,status_name from tb_status";
					rs = dbcon.con.createStatement().executeQuery(query);

					while (rs.next()) {
						arr.add(rs.getInt(1));
						arr.add(rs.getString(2));
					}
				} catch (SQLException sqlex) {
					cBLogger.error("class Name : cDGetValues,  Function : getStatusList , Error :  ", sqlex);
				} finally {
					try {
						if (rs != null)
							rs.close();
					} catch (SQLException e) {
						cBLogger.error("class Name : cDGetValues,  Function : getStatusList , Error :  ", e);
					}
					objConnMan.closeConnection(dbcon.index);
				}
			}
			return arr;
		}
}

	