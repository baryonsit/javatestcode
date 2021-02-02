package modUser.userAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modUser.userBo.cBBusinessUser;
import modUser.userVo.cVBusinessUser;


public class cABusinessUserReg extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		
				
		cVBusinessUser semp= (cVBusinessUser) form; 
		cBBusinessUser cbes = new cBBusinessUser();
		
		int result = cbes.regBusinessUser(semp);
		
		if(result==1){
	    	
	    	session.setAttribute("message", "The Username you entered already exists. Please check availability.");
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
	    	session.setAttribute("message", "This business is not Active. You can not register to this business yet.");
	    	return mapping.findForward("failure");
	    }
	    else if(result==5){
	    	session.setAttribute("message", "Please Enter Membership Id ");
	    	return mapping.findForward("failure");
	    }
	    else if(result==6){
	    	session.setAttribute("message", "Membership Id exists Already");
	    	return mapping.findForward("failure");
	    }
	    else if(result==4){
	    	session.setAttribute("message", "Registration is Successfull and details sent to mailid");
	    	return mapping.findForward("success");
	    }
	    else{
	    	session.setAttribute("message", "Error due to technical problem");	
	    	return mapping.findForward("failure");
	    }
						
	}
}

