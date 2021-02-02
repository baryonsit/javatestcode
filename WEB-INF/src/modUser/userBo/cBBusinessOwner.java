package modUser.userBo;


import java.util.ArrayList;

import modCommon.commonBo.sendingMail;
import modLogger.cBLogger;
import modUser.userDo.cDBusinessOwner;
import modUser.userVo.cVBusinessOwner;

public class cBBusinessOwner
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
		cDBusinessOwner objDogetstateandcity =new cDBusinessOwner();
		ArrayList statelist = new ArrayList();
		statelist = objDogetstateandcity.getStateDB();

		return statelist;
	}
	
	
	public int checkAvailability(String ava_name)
	{

		cDBusinessOwner objDogetstateandcity =new cDBusinessOwner();
		int result=0;
		result = objDogetstateandcity.getAvailability(ava_name);
		return result;
	}
	
	public int regBusinessOwner(cVBusinessOwner semp)
	{

		
		cDBusinessOwner cc = new cDBusinessOwner();
		
		int value = cc.businessOwnerReg(semp);
		
		if(value==1){
			value = 1;			//Username already exists
		}
		else if(value==2){
			value = 2;			//Email id already exists
		}
		else if(value==12){
			value = 12;			//Username and Email id already exists
		}
		else if(value==3){
			value = 3;			//Business already exists
		}
		else if(value==31){
			value = 31;			//Username and Business name both exists already
		}
		else if(value==32){
			value = 32;			//Emai Id and Business name both exists already
		}
		else if(value==33){
			value = 33;			//membershipid exists already
		}
		else if(value==34){
			value = 34;			//enter membershipid 
		}
		else if(value==4)
		{
			String mailid=semp.getEmail();
			String subject="User Registration in ezAppointment";
			String message="Welcome. \n Your Registration has been done successfully. \n Your username is '"+semp.getUsername()+"' and password is '"+semp.getPass1()+"'" ;
			sendingMail sendMail=new sendingMail();
			try
			{
				sendMail.fireEmail(mailid,message,subject);
				value = 4;	//Registered successfuly
			}
			catch(Exception e){
				cBLogger.error("Class Name : cBBusinessOwner , Function : regBusinessOwner , Error :", e);
			}
		}
		else{
			value=0;
		}
		return value;
	}
	

}










