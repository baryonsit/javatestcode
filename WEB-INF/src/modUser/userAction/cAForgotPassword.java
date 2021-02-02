package modUser.userAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modUser.userBo.cBForgotPassword;
import modUser.userVo.cVForgotPassword;


public class cAForgotPassword extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
	
		
		cVForgotPassword semp= (cVForgotPassword) form; 
		cBForgotPassword cbes = new cBForgotPassword();
		
		if(cbes.forgotPassword(semp,req)==1){
			session.setAttribute("message", "Password has been sent to your Email Id.");	
	    	return mapping.findForward("success");
	    }
		else if(cbes.forgotPassword(semp,req)==2){
			session.setAttribute("message", "Incorrect Email Id. Please enter your email id carefully.");
			return mapping.findForward("failure");
		}
		else{
			session.setAttribute("message", "ERROR.");
			return mapping.findForward("failure");
		}
		
	}
	
}


