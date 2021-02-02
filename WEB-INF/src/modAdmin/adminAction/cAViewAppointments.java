package modAdmin.adminAction;


import java.util.ArrayList;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modAdmin.adminBo.cBViewAppointments;
import modAdmin.adminVo.cVViewAppointments;
import modFacility.facilityVo.cVFacilityManage;


public class cAViewAppointments extends Action {
	HttpSession session;
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		cVViewAppointments objVoSearch=(cVViewAppointments)form;
		cBViewAppointments objBoSearch=new cBViewAppointments();
		
		Hashtable<String,ArrayList<String>> arr;
		arr = objBoSearch.searchUserByAdmin(objVoSearch, req);
		
		req.setAttribute("search1", arr);
		
		
		if (arr.size() <= 0){
			return mapping.findForward("failure");
		}else{
			return mapping.findForward("success");
		}
	}
	
}