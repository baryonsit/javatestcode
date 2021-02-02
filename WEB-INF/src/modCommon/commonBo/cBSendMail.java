package modCommon.commonBo;

import modCommon.commonDo.cDCommon;
import modCommon.commonVo.cVSendMail;

public class cBSendMail
{
   
	public boolean sendInvites(cVSendMail cvmail)
	{
		cDCommon objInserDetails = new cDCommon();
		sendingMail mail=new sendingMail();
		boolean ackm=false;
		 
		String details=cvmail.getDetails();
		
		String[] temp;
		String[] temp1;
		
		temp=null;
		temp1=null;
		
		String delimeter = "%";	
		String delimeter1 = "_";	/* delimeter */
		/* given string will be splitted by the argument delimeter provided. */
		
		temp=details.split(delimeter);
		
		for(int i =1; i < temp.length ; i++)
		{
				
				temp1=temp[i].split(delimeter1);
				objInserDetails.insertInviteDetails(cvmail,temp1);
				
				try{
					ackm=mail.mailAck(cvmail,temp1[2]);
				}
			catch (Exception e) 
			{
				
			}
		}
		
		return ackm;
	}
	
	
	public int  sendInviteSms(cVSendMail cvmail)
	{
		cDCommon objInserDetails = new cDCommon();
		
		String smsdetails=cvmail.getSmsdetails();
		
			String[] temp;
			String[] temp1;
			
			temp=null;
			temp1=null;
			
			String delimeter = "%";	
			String delimeter1 = "_";	/* delimeter */
			/* given string will be splitted by the argument delimeter provided. */
			
			temp=smsdetails.split(delimeter);
			
			for(int i =1; i < temp.length ; i++)
			{
					temp1=temp[i].split(delimeter1);
					if(objInserDetails.insertInviteDetailsSms(cvmail,temp1)==1){
						return 1;
					}
					else{
						return 0;
					}
			}

	return 1;	
	}

}