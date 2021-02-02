package modUser.userDo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.lang3.StringUtils;

import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;
import modUser.userVo.cVBusinessOwner;

public class cDBusinessOwner {
	
	ArrayList arr=new ArrayList();
	
	ResultSet r3=null,r1=null,r2 = null;
	
	int x = 0;
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	public cDBusinessOwner()
	{
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
			cBLogger.error("class Name : cDBusinessOwner, Constructor : cDBusinessOwner, Error : ", e);
		}
	}
	
	
	public ArrayList getCountryDB()
	{
		if (connected) 
		{
			ResultSet rs=null;
			try
			{			
				rs= dbcon.con.createStatement().executeQuery("select country_id,country_name from tb_country");
			
				while (rs.next()) {
					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
				}
				rs.close();
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDBusinessOwner,  Function : getCountryDB , Error : ", sqlex);
			}
			
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDBusinessOwner,  Function : getCountryDB , Error : ", e);
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
				String	query="select state_id,state_name from tb_states";
				rs=dbcon.con.createStatement().executeQuery(query);
		
				while (rs.next()) {
					arr.add(rs.getInt(1));
					arr.add(rs.getString(2));
				}
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDBusinessOwner,  Function : getStateDB , Error : ", sqlex);
			}
			
			finally
			{
				try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDBusinessOwner,  Function : getStateDB , Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		
		}
		return arr;
	}
	
	
	public int businessOwnerReg(cVBusinessOwner semp)
	{
		
		int res=0;
		int unflag=0;
		int emidflag=0;
		int bnameflag=0;
		int member_id=0;
		
		if (connected)
		{
			ResultSet emid = null;
			ResultSet bn = null;
			PreparedStatement pstmtUser = null;
			PreparedStatement pstmtBusiness = null;
			PreparedStatement pstmtSubscription = null;
			PreparedStatement pstmtRole = null;
			try
			{							
				String queryusername="select * from tb_users where user_name='"+semp.getUsername()+"' ";
				ResultSet un = dbcon.con.createStatement().executeQuery(queryusername);
		
				if(un.next())
				{
					unflag=1;
					res=1;		//Username already exists
					cBLogger.error("Username already exixts");
				}
					
				String queryemailid="select * from tb_users where email_id='"+semp.getEmail()+"' ";
				emid = dbcon.con.createStatement().executeQuery(queryemailid);
				
				if(emid.next())
				{
					emidflag=1;
					cBLogger.error("Email Id already exixts");
					if(unflag==1)
					{
						res = 12;	//Username and Email id both exists already
					}
					else
					{
						res=2;		//Email Id already exixts
						
					}
				}
					
				String querybusinessname="select * from tb_business where business_name='"+semp.getBissname()+"' ";
				bn = dbcon.con.createStatement().executeQuery(querybusinessname);
				if(bn.next())
				{						
					bnameflag=1;
					cBLogger.error("Business already exixts");
					if(unflag==1)
					{
						res = 31;		//Username and Business name both exists already
						
					}
					else if(emidflag==1)
					{
						res = 32;		//Emai Id and Business name both exists already
						
					}
					else
					{
						res=3;			//Business already exixts
						
					}
				}
				
               if(StringUtils.isEmpty(semp.getMemberid())){
            	   member_id = 1;
					res = 34;
			   }
               else{
					String sql ="select * from tb_users where membership_id='"+semp.getMemberid()+"'";
					ResultSet mem = dbcon.con.createStatement().executeQuery(sql);
					if(mem.next()){
						member_id = 1;
						res = 33;
					}
                }
               
				pstmtUser = dbcon.con.prepareStatement("INSERT into tb_users values(?,?,AES_ENCRYPT(?,1),?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmtUser.setString(1,null);
				pstmtUser.setString(2, semp.getUsername());
				pstmtUser.setString(3, semp.getPass1());
				pstmtUser.setString(4, semp.getFname());
				pstmtUser.setString(5, semp.getMname());
				pstmtUser.setString(6, semp.getLname());
				pstmtUser.setString(7, semp.getEmail());
				pstmtUser.setString(8, semp.getContact());
				pstmtUser.setString(9, semp.getAdd1());
				pstmtUser.setString(10, semp.getAdd2());
				pstmtUser.setString(11, semp.getCity());
				pstmtUser.setString(12, semp.getZipcode());
				pstmtUser.setInt(13, Integer.parseInt(semp.getState()));
				pstmtUser.setInt(14, Integer.parseInt(semp.getCountry()));
				pstmtUser.setString(15, semp.getMemberid());
				pstmtUser.setString(16, "Inactive");
			
				
				pstmtBusiness = dbcon.con.prepareStatement("INSERT into tb_business values(?,(select user_id from tb_users where user_name=?),?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmtBusiness.setString(1, null);
				pstmtBusiness.setString(2, semp.getUsername());
				pstmtBusiness.setString(3, semp.getBissname());
				pstmtBusiness.setString(4, semp.getBissowner());
				pstmtBusiness.setString(5, semp.getBissstart());
				pstmtBusiness.setString(6, semp.getBissend());
				pstmtBusiness.setString(7, semp.getBisscategory());
				pstmtBusiness.setString(8, semp.getBissadd1());
				pstmtBusiness.setString(9, semp.getBissadd2());
				pstmtBusiness.setString(10, semp.getBisscity());
				pstmtBusiness.setString(11, semp.getBisszipcode());
				pstmtBusiness.setString(12, semp.getBissstate());
				pstmtBusiness.setString(13, semp.getBisscountry());
				pstmtBusiness.setString(14, semp.getBissdesc());
				
				
				pstmtSubscription = dbcon.con.prepareStatement("INSERT into tb_user_subscription values((select user_id from tb_users where user_name=?),?)");
				pstmtSubscription.setString(1, semp.getUsername());
				pstmtSubscription.setString(2, semp.getBisssubscription());
				
				
				pstmtRole = dbcon.con.prepareStatement("INSERT into tb_userrole values((select user_id from tb_users where user_name=?),(select role_id from tb_role where role_name=?))");
				pstmtRole.setString(1, semp.getUsername());
				pstmtRole.setString(2, semp.getUrole());
				
				
				try
				{
					if(unflag==0 && emidflag==0 && bnameflag==0 && member_id==0)
					{	
						pstmtUser.executeUpdate();
						pstmtBusiness.executeUpdate();
						pstmtSubscription.executeUpdate();
						pstmtRole.executeUpdate();
									
						res=4;
						
					}
				}
				catch (Exception se)
				{
				
					cBLogger.error("class Name : cDBusinessOwner,  Function : businessOwnerReg , Error : ", se);
					dbcon.con.rollback();
				}
			}
			catch (Exception e)
			{
				cBLogger.error("class Name : cDBusinessOwner,  Function : businessOwnerReg , Error : ", e);
				
			}
			finally
			{
				try {
					if(emid!=null)
						emid.close();
					if(bn!=null)
						bn.close();
					if(pstmtUser!=null)
						pstmtUser.close();
					if(pstmtBusiness!=null)
						pstmtBusiness.close();
					if(pstmtSubscription!=null)
						pstmtSubscription.close();
					if(pstmtRole!=null)
						pstmtRole.close();
				} catch (Exception e) {
					cBLogger.error("class Name : cDBusinessOwner,  Function : businessOwnerReg , Error : ", e);
				}
				
				objConnMan.closeConnection(dbcon.index);
			}
		}
		else
		{
			cBLogger.error("class Name : cDBusinessOwner,  Function : businessOwnerReg ,Database Not Connected");
		}
	
		return res;
	}
	
	
	public int getAvailability(String ava_name)
	{

		int val=0;
		if (connected) 
		{
			try	{	
				String	query="select user_name from tb_users where user_name='"+ava_name+"' ";
		
				ResultSet rs=dbcon.con.createStatement().executeQuery(query);
				if(rs.next()) {
					val=0;
				}
				else{
					val=1;
				}
					
			}
			catch (SQLException sqlex) {
				cBLogger.error("class Name : cDBusinessOwner,  Function : getAvailability , Error : "
				, sqlex);
			}
			finally
			{
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return val;
	}
	
}