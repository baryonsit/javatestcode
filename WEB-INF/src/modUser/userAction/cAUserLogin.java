package modUser.userAction;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modUser.userBo.cBUserLogin;
import modUser.userVo.cVUserLogin;

//Action class for Login functionality

public class cAUserLogin extends Action {
		
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		
	    String user_name = req.getParameter("username");
		HttpSession session = req.getSession();
		
		Principal userCAS = req.getUserPrincipal();
		
		cVUserLogin semp= (cVUserLogin) form; 
		cBUserLogin cbes = new cBUserLogin();
		int value = cbes.userLogin(semp,req);
		// we are commented this,because it checking the old login details(username & password)
		
		/*if(semp.getLoginpwd().equals("") && semp.getLoginun().equals("")){
		session.setAttribute("message", "<font color='red'>Enter User name and Password </font>");
    	return mapping.findForward("failure");
		}*/
		
		
		// here we are checking the result of value generated from userlogin(semp,req)
		
		if(value == 2){
	    	session.setAttribute("message", "Welcome To Appointment System.");
	    	return mapping.findForward("success");
	    }
		else if(value == 3){
			session.setAttribute("message", "<font color='red'>Your Business Is not active. You can not login untill your business gets activated.</font>");
	    	return mapping.findForward("failure");
		}
		else if(value == 1 ){
			session.setAttribute("message", "<font color='red'>Username and Password Does not Match.</font>");
	    	return mapping.findForward("failure");
	    }
		else if(value == 4 ){
			session.setAttribute("message", "<font color='red'> This User is associated with any School. Please Contact Admin </font>");
	    	return mapping.findForward("institutefailure");
	    } else if(value == 5 ){
			session.setAttribute("message", "<font color='red'> Logged In User Not Authorized To This Application </font>");
	    	return mapping.findForward("institutefailure");
	    }
		else{
	    	session.setAttribute("message", "<font color='red'>LOGIN ERROR.</font>");
	    	return mapping.findForward("failure");
	    }
		
	}
}