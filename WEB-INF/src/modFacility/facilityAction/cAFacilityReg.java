package modFacility.facilityAction;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modFacility.facilityBo.cBFacilityManage;
import modFacility.facilityVo.cVFacilityReg;


public class cAFacilityReg extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		cVFacilityReg objVoFacilityReg = (cVFacilityReg) form;
		cBFacilityManage objBoFacilityReg =new cBFacilityManage();
		
		HttpSession session = req.getSession();
		int x = 0;
		String userid = objVoFacilityReg.getUserid_hidden(); 
		String bid=objVoFacilityReg.getFacid_buis_hidden();
		x=objBoFacilityReg.insert_user_to_business(userid,bid);
		
		if(x==1){
			session.setAttribute("message", "You Are Registered Succeessfully To The Facility");
			return mapping.findForward("success");
		}
		else{
			session.setAttribute("message", "Unable To Register The Facility ");
			return mapping.findForward("failure");
		}
	}		
}
