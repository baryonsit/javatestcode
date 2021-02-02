package modUser.userAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modUser.userBo.cBChangePassword;
import modUser.userVo.cVChangePassword;

public class cAChangePassword extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		
		cVChangePassword semp= (cVChangePassword) form;
		cBChangePassword cbes = new cBChangePassword();
		
		int result=0;
		result = cbes.changePassword(semp,req);
		
		if(semp.getCurrpass().equals("") && semp.getNewpass().equals("") && semp.getConfpass().equals("")){
			session.setAttribute("message", "<font color='red'>Enter Password </font>");
	    	return mapping.findForward("failure");
		}
		
		if(result==1){
	    	
	    	session.setAttribute("message", "Your Password Has Been Changed Successfully");
	    	return mapping.findForward("success");
	    }
		if(result==2){
	    	
	    	session.setAttribute("message", "New Password and Confirm Password Doesnot match");
	    	return mapping.findForward("failure");
	    }
		else if(result==3){			
			session.setAttribute("message", "Incorrect Password. Please enter your current password correctly.");
			return mapping.findForward("failure");
		}
		else{
			
			session.setAttribute("message", "Error due to technical failure.");
			return mapping.findForward("failure");
		}
		
	}
	
	
}
