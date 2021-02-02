package modUser.userBo;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import modCommon.commonBo.sendingMail;
import modUser.userDo.cDForgotPassword;
import modUser.userVo.cVForgotPassword;


public class cBForgotPassword
{
	//cDBusinessOwner objDogetstateandcity =new cDBusinessOwner();
	HttpSession session;
	
	public int forgotPassword(cVForgotPassword semp, HttpServletRequest req) {
		int y=0;
		cDForgotPassword cc = new cDForgotPassword();
		
			String mailid=semp.getPassemail();
			//String mailid="nandini@baryons.in";

			/******************* Generate random password*************/
			Random rand = new Random();
			int generated_pass = 10 + rand.nextInt(900000);	
			
			/*********** *********************/
		
			String subject="Password Recovery";
			String message="Your new password is '"+generated_pass+"'";
			sendingMail sendMail=new sendingMail();
					try
					{
						
						if((cc.reset_password(mailid,generated_pass))==1)
						{	
							//update password in database before sending
							boolean val=sendMail.fireEmail(mailid,message,subject);
							y=1;
						}
						else if((cc.reset_password(mailid,generated_pass))==2)
						{	
							//email id does not match
							y=2;
						}
						else
						{
							y=0;
						}
					}
					catch(Exception e){
					y=0;
					}
					return y;
		}
	}

