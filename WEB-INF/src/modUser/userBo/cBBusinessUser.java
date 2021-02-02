package modUser.userBo;

import java.util.ArrayList;

import modCommon.commonBo.sendingMail;
import modLogger.cBLogger;
import modUser.userDo.cDBusinessOwner;
import modUser.userDo.cDBusinessUser;
import modUser.userVo.cVBusinessUser;


public class cBBusinessUser
{
	
	public ArrayList getCountryDetails()
	{
		cDBusinessOwner objDogetstateandcity =new cDBusinessOwner();
		ArrayList countrylist = new ArrayList();
		countrylist = objDogetstateandcity.getCountryDB();	
		return countrylist;
	}
	
	public ArrayList getStateDetails()
	{
;		cDBusinessOwner objDogetstateandcity =new cDBusinessOwner();
		ArrayList statelist = new ArrayList();
		statelist = objDogetstateandcity.getStateDB();
		return statelist;
	}
	public String getMembership_Id(String member_id)
	{
	   cDBusinessUser objDogetMembership_id=new cDBusinessUser();	
	   String memberlist=objDogetMembership_id.checkMembership_Id(member_id);
	   return memberlist;	
		
	}
	
	public int regBusinessUser(cVBusinessUser semp) {
		cDBusinessUser cc = new cDBusinessUser();
		
		int res=cc.businessUserReg(semp);
		
		if(res==1){
			res = 1;			//Username already exists
		}
		else if(res==2){
			res = 2;			//Email id already exists
		}
		else if(res==12){
			res = 12;			//Both Username and Email id already exists
		}
		else if(res==3){
			res = 3;			//Business is Inactive
		}
		else if(res==5){
			res = 5;			//membershipid null 
		}
		else if(res==6){
			res = 6;			//memberid exits already
		}
		else if(res==4){			//registration successful
			String mailid=semp.getEmail();
			String subject="Registration Sucessfull";
			String message="username is '"+semp.getUsername()+"' and password is '"+semp.getPass1()+"'" ;
			sendingMail sendMail=new sendingMail();
			try{
			sendMail.fireEmail(mailid,message,subject);
			res = 4;	
			}
			catch(Exception e){
				cBLogger.error("Class Name : cBBusinessUser , Funtion : regBusinessUser ,Error : ",e);
			}
			
		}
		else{
			res = 0;
		}
		
		return res;
	}
	

}



