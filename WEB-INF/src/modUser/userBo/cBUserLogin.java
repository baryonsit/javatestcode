package modUser.userBo;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import modUser.userVo.cVBusinessOwner;
//import modUser.userDo.cDBusinessOwner;
import modLogger.cBLogger;
import modUser.userDo.cDUserLogin;
import modUser.userVo.cVUserLogin;

//Business class for Login functionality 

public class cBUserLogin
{
	//cDBusinessOwner objDogetstateandcity =new cDBusinessOwner();
	HttpSession session;
	
	// method for userlogin , called from Action class
		
	public int userLogin(cVUserLogin semp, HttpServletRequest req) {
		
		cDUserLogin cc = new cDUserLogin();
	
		ArrayList functionList = new ArrayList();
		
		session = req.getSession();
		            
		                // CAS server get userprinciple
		String userCAS = req.getUserPrincipal().toString();
		                                                         //System.out.println(userCAS);
		int result = 0;
		result = cc.hereUserLogin(userCAS,req);
				
		if(result == 1)
		{
			result =1;		//username password does not match
			cBLogger.debug("username password does not match");
		}
		else if(result == 3)
		{
			result = 3;		//Business is not Active
			cBLogger.debug("User is not Active");
		}
		else if(result == 2)
		{
			String role_id=session.getAttribute("logedroleid").toString();
			functionList = cc.getFunctionList(role_id);
			session.setAttribute("functionname",functionList);
			
			result =2;			//username password match
			cBLogger.debug("username password match");
		}
		else if(result == 4)
		{
			result =4;
			cBLogger.debug("user doesn't have institute");
		}
		else 
		{
			result = 0;
		}
	   //if (username == null)
		

		return result;
	}
	
	
}