package modCommon.commonDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;

import common.EzAppointmentConstant;
//import modUser.userVo.cVBusinessOwner;
import modCommon.commonVo.cVSendMail;
import modLogger.cBLogger;

public class cDCommon {
	
	ArrayList arr=new ArrayList();
	ArrayList search=new ArrayList();
	ResultSet r3=null,r1=null,r2 = null;
	/*int x = 0;
	Connection dbcon = null;
	boolean connected = true ;
	cDConnectionManager objConnMan;*/
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	public cDCommon() {
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
			cBLogger.error("class Name : cDCommon, Constructor : cDCommon, Error : ",e);
		}
	}
	
	//ArrayList
	public ArrayList getCategoryFromDB()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
			
				String	query="select category_id,category_name from tb_category";
				
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					arr.add(rs.getString(1));
					arr.add(rs.getString(2));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommon, Function : getCategoryFromDB, Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommon, Function : getCategoryFromDB, Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return arr;

	}
	public ArrayList searchFromDB(String searchWord,String countryid,String role_id,String user_id)
	{
		if (connected) 
		{
			ResultSet rs=null;

			try
			{	
				String	query="";
				//if(role_id.equals("2")){
					//query="select business_name,business_desc,business_id,business_countryid from tb_business where business_name like '%"+searchWord+"%' and business_countryid='"+countryid+"' and user_id='"+user_id+"'";
				//}
				//else{
					query="select business_name,business_desc,business_id,business_countryid from tb_business where business_name like '%"+searchWord+"%' and business_countryid='"+countryid+"'";
				//}
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					search.add(rs.getString(1));
					search.add(rs.getString(2));
					search.add(rs.getString(3));
					search.add(rs.getString(4));//country id
				}
				rs.close();
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommon, Function : searchFromDB, Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommon, Function : searchFromDB, Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return search;

	}
	
	public String contryvalDB(String county_id)
	{
		String contry_val="";
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				String	query="";
				
					query="SELECT country_name FROM tb_country where country_id='"+county_id+"'";
			
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					contry_val = rs.getString(1);
				}
				
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommon, Function : searchFromDB, Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommon, Function : searchFromDB, Error : ", e);
				}
				
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return contry_val;
	}
	
public int insertInviteDetails(cVSendMail cvmail,String[] temp){
		int i=0;
		if (connected) {
			try
			{				
				String Query="insert into tb_appointment_invitations values(null,'"+cvmail.getAppid_hidden()+"','"+cvmail.getInvitetype_mail()+"','"+temp[2]+"','"+temp[1]+"')";
				i=dbcon.con.createStatement().executeUpdate(Query);
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommon, Function : insertInviteDetails, Error : ", sqlex);	
			}
			
			finally
			{
				objConnMan.closeConnection(dbcon.index);
			}
			
	    }
		return i;
	
}


public int insertInviteDetailsSms(cVSendMail cvmail,String[] temp){
	int i=0;
	if (connected) {
		try
		{				
			String Query="insert into tb_appointment_invitations values(null,'"+cvmail.getAppid_hidden()+"','"+cvmail.getInvitetype_sms()+"','"+temp[1]+"','"+temp[2]+"')";
			if(dbcon.con.createStatement().executeUpdate(Query)==1){
				return 1;
			}
			else{
				return 0;
			}
		}
		catch (SQLException sqlex) {
			cBLogger.error("class Name : cDCommon, Function : insertInviteDetailsSms , Error : ", sqlex);	
		}
		
		finally
		{
			objConnMan.closeConnection(dbcon.index);
		}
		
	}
	return i;

}

	public ArrayList getBusinessOfCategory(String categoryName)
	{
		ArrayList businessList=new ArrayList();
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				String	query="select business_name from tb_business where business_categoty='"+categoryName+"'";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					businessList.add(rs.getString(1));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommon, Function : getBusinessOfCategory , Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommon, Function : getBusinessOfCategory , Error : ",e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return businessList;
	}
	
	public ArrayList getDays()
	{
		ArrayList Days=new ArrayList();
		if (connected) 
		{
			ResultSet rs=null;

			try
			{	
				String	query="select * from tbl_weekholidays";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					Days.add(rs.getInt(1));
					Days.add(rs.getString(2));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommon, Function : getDays , Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommon, Function : getDays , Error : ", e);

				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		return Days;
	}
	
	
	public String getRoleName(String role_id)
	{
		cBLogger.debug("Class :cDCommon , User : Function  getRoleName: Entering ");
		String role_name=""; 
		if (connected) 
		{
			ResultSet rs=null;
			try
			{	
				String	query="select role_name from tb_roles where role_id='"+role_id+"'";
				rs=dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					role_name= rs.getString(1);
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ", sqlex);	
			}
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ",e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
			
		}
		cBLogger.debug("Class :cDCommon , User : Function  getRoleName: Existing ");
		return role_name;
	}

	// Method To Convert Date Format Data Layer
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String getDateFormatterToDB(String date) {
		ArrayList arr = new ArrayList();
		String formattedDateString = "";
		if (connected) {
			ResultSet rs = null;
			try {
				SimpleDateFormat formatter = new SimpleDateFormat(EzAppointmentConstant.DATE_FORMAT);
				SimpleDateFormat formatter1 = new SimpleDateFormat(EzAppointmentConstant.STRINGDATEFORMATER);
				String dateInString = date;
				try {
					Date dateForm = formatter.parse(dateInString);
					formattedDateString = formatter1.format(dateForm);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ", e);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return formattedDateString;

	}
	// Method To Convert Date DD-MMM-YYYY TO YYYY-MM-DD Format Data Layer
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String getDateFormatterToDB1(String date) {
			ArrayList arr = new ArrayList();
			String formattedDateString = "";
			if (connected) {
				ResultSet rs = null;
				try {
					SimpleDateFormat formatter = new SimpleDateFormat(EzAppointmentConstant.STRINGDATEFORMATER);
					SimpleDateFormat formatter1 = new SimpleDateFormat(EzAppointmentConstant.DATE_FORMAT);
					
					String dateInString = date;
					try {
						Date dateForm = formatter.parse(dateInString);
						formattedDateString = formatter1.format(dateForm);
						
						//Date dateForm = formatter.parse(dateInString);
						//formattedDateString = formatter1.format(dateForm);
					} catch (ParseException e) {
						e.printStackTrace();
					}
				} catch (Exception e) {
					cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ", e);
				} finally {
					try {
						if (rs != null)
							rs.close();
					} catch (SQLException e) {
						cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ", e);
					}
					objConnMan.closeConnection(dbcon.index);
				}

			}
			return formattedDateString;

		}

	// Function to fetch the details of a school
	public ArrayList fetchSchoolDetails(String schoolId) {
		ArrayList arr = new ArrayList();
		if (connected) {
			ResultSet rs = null;
			try {

				String Schoolquery = "select * from tb_school where school_id='" + schoolId + "'";
				rs = dbcon.con.createStatement().executeQuery(Schoolquery);
				if (rs != null) {
					while (rs.next()) {
						arr.add(rs.getInt(1)); // school id
						arr.add(rs.getString(2)); // gov reg id
						arr.add(rs.getInt(3)); // board id
						arr.add(rs.getString(4)); // school name
						arr.add(rs.getString(5)); // principal name
						arr.add(rs.getString(6)); // school opening date
						arr.add(rs.getString(7)); // school contact
						arr.add(rs.getString(8)); // school website
						arr.add(rs.getString(9)); // school address1
						arr.add(rs.getString(10)); // school address2
						arr.add(rs.getInt(11)); // school city
						arr.add(rs.getInt(12)); // school country
						arr.add(rs.getInt(13)); // school state
						arr.add(rs.getInt(14)); // school zipcode
						arr.add(rs.getString(15)); // school description
						arr.add(rs.getString(16)); // school email
						arr.add(rs.getInt(17)); // school institute id
						arr.add(rs.getString(18)); // school created date time
					}
				}
			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ", sqlex);

			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ", e);

				}
				objConnMan.closeConnection(dbcon.index);
			}

		}

		return arr;

	}

	// Function to fetch a class details for its updation
	public ArrayList fetchInstitutesDetails(String institute_id) {

		ArrayList arr = new ArrayList();
		String fetchInstitutesDetails = null;
		if (connected) {
			ResultSet rs = null;

			try {

				fetchInstitutesDetails = "select * from tb_institute  where institute_id='" + institute_id + "' ";

				rs = dbcon.con.createStatement().executeQuery(fetchInstitutesDetails);
				while (rs.next()) {

					arr.add(rs.getString(1)); // institute Id
					arr.add(rs.getString(2)); // institute name
					arr.add(rs.getString(3)); // website address
					arr.add(rs.getString(4));
					arr.add(rs.getString(5));
					arr.add(rs.getString(6));
					arr.add(rs.getString(7));
					arr.add(rs.getString(8)); // institute name
					arr.add(rs.getString(9)); // website address
					arr.add(rs.getInt(10));
					arr.add(rs.getInt(11));
					arr.add(rs.getInt(12));
					arr.add(rs.getInt(13));
					arr.add(rs.getString(14));
					arr.add(rs.getString(15));
					arr.add(rs.getString(16) != null ? Base64.getEncoder().encodeToString(rs.getBytes(16))
							: rs.getString(16));
				}

			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ", sqlex);

			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDCommon, Function : getRoleName , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return arr;
	}
	
}
