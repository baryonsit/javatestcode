package modUser.userDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;
import modUser.userVo.cVChangePassword;

public class cDChangePassword {
	
	HttpSession session;
	ArrayList arr=new ArrayList();
	ResultSet r3=null,r1=null,r2 = null;
	
	/*int x = 0;
	Connection dbcon = null;
	boolean connected = true ;
	cDConnectionManager objConnMan;*/
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	public cDChangePassword() {
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
			cBLogger.error("class Name : cDChangePassword, Constructor : cDChangePassword, Error : ", e);
		}
	}
	
	
	public int hereChangePassword(cVChangePassword semp)
	{
		int y = 0;
		if (connected){
			ResultSet r1=null;
			try
			{
					String query="select * from tb_users where user_name='"+semp.getUname()+"' and passward=AES_ENCRYPT('"+semp.getCurrpass()+"',1) ";
					r1 = dbcon.con.createStatement().executeQuery(query);
					if(r1.next())
					{
						if(semp.getNewpass().equals(semp.getConfpass()))
						{
							String query1="update tb_users set passward=AES_ENCRYPT('"+semp.getNewpass()+"',1) where user_name='"+semp.getUname()+"' ";
							dbcon.con.createStatement().executeUpdate(query1);
							//JOptionPane.showMessageDialog(null,"Password Is Updated Sucessfully");
							y=1;	//password changed successsfuly	
						}
						else
						{
							y=2;	//newpassword and confirm password doesnot match
						}
					}
					else
					{
						y=3;
					}
			}
			catch (Exception e)
			{
				cBLogger.error("class Name : cDChangePassword, Function : hereChangePassword, Error : ", e);
				y = 0;
			}
			finally
			{
				try {
					if(r1!=null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDChangePassword, Function : hereChangePassword, Error : ", e);
				}
				
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return y;
		
	}
	
}