package modUser.userBo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import modUser.userDo.cDChangePassword;
import modUser.userVo.cVChangePassword;

public class cBChangePassword
{
	//cDBusinessOwner objDogetstateandcity =new cDBusinessOwner();
	HttpSession session;
	
	public int changePassword(cVChangePassword semp, HttpServletRequest req) {
	
		cDChangePassword cc = new cDChangePassword();
		
		int result=0;
		result = cc.hereChangePassword(semp);
		
		if(result==1){
			return 1;		//password changed successsfuly
		}
		else if(result==2){
			return 2;		//newpassword and confirm password doesnot match
		}
		else if(result==3){
			return 3;		//Incorrect Password.
		}
		else{
			return 0;
		}
		
	}
	

}