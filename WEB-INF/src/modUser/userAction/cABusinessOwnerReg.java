package modUser.userAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modUser.userBo.cBBusinessOwner;
import modUser.userVo.cVBusinessOwner;

public class cABusinessOwnerReg extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
	
				
		cVBusinessOwner semp= (cVBusinessOwner) form; 
		cBBusinessOwner cbes = new cBBusinessOwner();

		int result = cbes.regBusinessOwner(semp);
		
		if(result==1){
			session.setAttribute("message", "The Username you entered already exists. Please ckeck availability.");
	    	return mapping.findForward("failure");
	    }
		else if(result==2){
	    	session.setAttribute("message", "The Email Id you entered already exists.");
	    	return mapping.findForward("failure");
	    }
		else if(result==12){
			session.setAttribute("message", "Username and Email Id you entered already exists.");
	    	return mapping.findForward("failure");
	    }
		else if(result==3){
			session.setAttribute("message", "This Appointment Name Already exists.");
	    	return mapping.findForward("failure");
	    }
		else if(result==31){
			session.setAttribute("message", "Username and Appointment name both exists already.");
	    	return mapping.findForward("failure");
	    }
		else if(result==32){
			session.setAttribute("message", "Emai Id and Appointment name both exists already.");
	    	return mapping.findForward("failure");
	    }
		else if(result==33){
			session.setAttribute("message", "Membership Id exist already.");
	    	return mapping.findForward("failure");
	    }
		else if(result==34){
			session.setAttribute("message", "Please Enter MemebershipId");
	    	return mapping.findForward("failure");
	    }
		else if(result==4){
	    	session.setAttribute("message", "Registration is Successfull and details sent to your mailid");
	    	return mapping.findForward("success");
	    }
	    else{
	    	session.setAttribute("message", "ERRORRRRRRRR");
	    	return mapping.findForward("failure");
	    }	
	}
}
