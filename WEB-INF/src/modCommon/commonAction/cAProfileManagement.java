package modCommon.commonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import modCommon.commonBo.cBProfileManagement;
import modCommon.commonVo.cVProfileManagement;


public class cAProfileManagement extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession session = req.getSession();
			
		cVProfileManagement semp= (cVProfileManagement) form; 
		cBProfileManagement cbes = new cBProfileManagement();
		
		if(cbes.updateUserProfile(semp,req)==1){
			session.setAttribute("message", "Your Profile is updated successfully.");
			return mapping.findForward("success");
	    }
		else{
			session.setAttribute("errorMessage", "Error in Updation.");
			return mapping.findForward("failure");
	    }
		
		
	}
	
}



