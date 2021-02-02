package modUser.userDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;


public class cDForgotPassword {
	
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
	
	public cDForgotPassword() {
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
			cBLogger.error("class Name : cDForgotPassword, Constructor : cDForgotPassword, Error : ", e);
		}
	}

	public int reset_password(String mailid,int password)
	{
		int x=0;
		if (connected)
		{
			ResultSet r1=null;
			try
			{
				String Checkquery="select * from tb_users where email_id='"+mailid+"' ";
				r1 = dbcon.con.createStatement().executeQuery(Checkquery);
				if(r1.next())
				{
					String query="update tb_users set passward= AES_ENCRYPT("+password+",1) where email_id='"+mailid+"'";
					if(dbcon.con.createStatement().executeUpdate(query)==1)
					{
						x=1;		//successful
					}
				}
				else
				{
					x=2;		//email id doesnot match
				}
				
			}
			catch (Exception e)
			{
				cBLogger.error("class Name : cDForgotPassword, Function : reset_password, Error : ", e);
				x=0;
			}
			finally
			{
				try {
					if(r1!=null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDForgotPassword, Function : reset_password, Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		
		}
		return x;
	
	}
}