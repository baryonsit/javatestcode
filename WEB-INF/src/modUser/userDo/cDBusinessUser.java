package modUser.userDo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;
import modUser.userVo.cVBusinessUser;


public class cDBusinessUser {
	
	ArrayList arr=new ArrayList();
	ResultSet r3=null,r1=null,r2 = null;
	
	/*int x = 0;
	Connection dbcon = null;
	boolean connected = true ;
	cDConnectionManager objConnMan;*/
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	public cDBusinessUser() {
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
			cBLogger.error("class Name : cDBusinessUser, Constructor : cDBusinessUser, Error : ", e);
		}
	}
	
	public String checkMembership_Id(String member_id)
	{
		String count="0";
		if(connected)
		{
			ResultSet rs=null;
		try
		{
		     String query="select count(*) from tb_users where membership_id ='"+member_id+"'";
			 rs=dbcon.con.createStatement().executeQuery(query);
			 while(rs.next())
		     {
				 count=rs.getString(1);
			 }
		 }
		 catch(Exception ee)
	     {
		  cBLogger.error("class Name : cDBusinessUser, Function : checkMembership_Id, Error : ", ee);
	     }
		 finally{
			 try {
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
					  cBLogger.error("class Name : cDBusinessUser, Function : checkMembership_Id, Error : ", e);
				}
	      objConnMan.closeConnection(dbcon.index);
	      }
	      }
		return count;
     }
	
	
	public int businessUserReg(cVBusinessUser semp)
	{
		int res=0;
		int unflag=0;
		int emidflag=0;
		int bis_status=0;
		int member_id=0;
		
		if (connected)
		{
			ResultSet emid = null;
			ResultSet un = null;
			ResultSet r2 = null;
			ResultSet mem = null;
			PreparedStatement pstmtUser = null;
			PreparedStatement pstmtUsertoBiss = null;
			PreparedStatement pstmtRole = null;
		
			try
			{
				String queryusername="select * from tb_users where user_name='"+semp.getUsername()+"' ";
				un = dbcon.con.createStatement().executeQuery(queryusername);
				if(un.next())
				{
					unflag=1;
					cBLogger.error("Username already exixts");
					res=1;		//Username already exists
				}
					
				String queryemailid="select * from tb_users where email_id='"+semp.getEmail()+"' ";
				emid = dbcon.con.createStatement().executeQuery(queryemailid);
				if(emid.next())
				{
					emidflag=1;
					cBLogger.error("Email Id already exixts");
					if(unflag==1)
					{
						res = 12;
					}
					else
					{
						res=2;		//Email Id already exixts
					}
				}
				
				String statusQuery = "select u.status,u.user_id,b.business_id from tb_users u,tb_business b where b.business_id='"+semp.getBusid()+"' and b.user_id=u.user_id ";
				r2 = dbcon.con.createStatement().executeQuery(statusQuery);
				if(r2.next())
				{
					String busStatus = r2.getString(1);
					if(busStatus.equals("Inactive"))
					{
						bis_status=1;
						res=3;		//business is Inactive
						cBLogger.error("This business is not Active. You can not register to this business yet.");
					}
					else
					{
						bis_status=0;
					}
				}
				
				if(semp.getMemberid().equals("") && semp.getMemberid()==null){
	            	   member_id = 1;
						res = 5;
				   }
	               if(!semp.getMemberid().equals("")){
						String sql ="select * from tb_users where membership_id='"+semp.getMemberid()+"'";
						mem = dbcon.con.createStatement().executeQuery(sql);
						if(mem.next()){
							member_id = 1;
							res = 6;
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
				
				pstmtUsertoBiss = dbcon.con.prepareStatement("INSERT into tb_user_to_business_map values(?,(select user_id from tb_users where user_name=?),?)");
				pstmtUsertoBiss.setString(1, null);
				pstmtUsertoBiss.setString(2, semp.getUsername());
				pstmtUsertoBiss.setInt(3, semp.getBusinessid());//pstmtUsertoBiss.setString(3, semp.getBusid());
				
				pstmtRole = dbcon.con.prepareStatement("INSERT into tb_userrole values((select user_id from tb_users where user_name=?),(select role_id from tb_role where role_name=?))");
				pstmtRole.setString(1, semp.getUsername());
				pstmtRole.setString(2, semp.getUrole());
				
				try
				{
					if(unflag==0 && emidflag==0 && bis_status==0)
					{
						pstmtUser.executeUpdate();
						pstmtUsertoBiss.executeUpdate();
						pstmtRole.executeUpdate();
						res=4;		//registration successful
					}
				}
				catch (Exception se)
				{
					cBLogger.error("class Name : cDBusinessUser, Function : businessUserReg, Error : ", se);
					dbcon.con.rollback();
				}
					
			}
			catch (Exception e)
			{
				cBLogger.error("class Name : cDBusinessUser, Function : businessUserReg, Error : ", e);
			}
			finally
			{
				try {
					if(emid!=null)
						emid.close();
					if(un!=null)
						un.close();
					if(r2!=null)
						r2.close();
					if(mem!=null)
						mem.close();
					if(pstmtUser!=null)
						pstmtUser.close();
					if(pstmtUsertoBiss!=null)
						pstmtUsertoBiss.close(); 
					if(pstmtRole!=null)
						pstmtRole.close();
				} catch (SQLException e)
				{
					cBLogger.error("class Name : cDBusinessUser, Function : businessUserReg, Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return res;
	}
	
}
