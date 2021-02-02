package modAdmin.adminAction;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modAdmin.adminBo.cBBusinessList;
import modAdmin.adminVo.cVBusinessList;


public class cABusinessList extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		cVBusinessList objVoBusinessOpp = (cVBusinessList) form;
		cBBusinessList objBoBusinessOpp = new cBBusinessList();
		HttpSession session = req.getSession();
		if(objVoBusinessOpp.getTypeof_hidden().equals("updateUserStatus")){
			int x=0;
			x = objBoBusinessOpp.updateUserStatus(objVoBusinessOpp);
			if(x > 0){
				session.setAttribute("message", "Appointment Event status updated sucessfully");
				return mapping.findForward("update_success");
			}
			else{
				return mapping.findForward("update_failure");
			}
		}else{
			int x=0;
			x = objBoBusinessOpp.updateAppointmentStatus(objVoBusinessOpp);
			if(x > 0){
				session.setAttribute("message", "Appointment Event status updated sucessfully");
				return mapping.findForward("success");
			}
			else{
				return mapping.findForward("failure");
			}
		}
		
	}
	
}
