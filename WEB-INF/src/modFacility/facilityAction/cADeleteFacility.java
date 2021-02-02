package modFacility.facilityAction;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modFacility.facilityBo.cBFacilityManage;
import modFacility.facilityVo.cVFacilityManage;


public class cADeleteFacility extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		cVFacilityManage objVoAddFacility = (cVFacilityManage) form;
		cBFacilityManage objBoAddFacility=new cBFacilityManage();
		
		HttpSession session = req.getSession();
		int x = 0;
		
		/*if(x==1){
			session.setAttribute("message", "Facility cannot be deleted.It has fixed appointments");
			return mapping.findForward("delete-failure");
		}
		if(x==2){			
			session.setAttribute("message", "Facility deleted  Successfully");	
			return mapping.findForward("delete-success");
		}
		else{
			return mapping.findForward("delete-failure");
		}*/
	/*	if(objVoAddFacility.getFacid_hidden().equals("delete"))
		{
			x=objBoAddFacility.deleteFacility(objVoAddFacility);
			
			if(x>0){
				if(x==1){
					session.setAttribute("message", "Facility cannot be deleted.It has fixed appointments");
					return mapping.findForward("delete-failure");
				}
				else if(x==2){
					session.setAttribute("message", "Facility deleted  Successfully");	
					return mapping.findForward("delete-success");
					}
			}
			else{
				return mapping.findForward("delete-failure");
			}
		}*/
		
		if(objVoAddFacility.getFacid_hidden().equals("update"))
		{
			
			x = objBoAddFacility.updateFacilityStatus(objVoAddFacility);
			
	
			if(x==1){
				session.setAttribute("message", "Appointment Event status updated sucessfully");
				return mapping.findForward("update-success");
			}
			else{
				return mapping.findForward("update-failure");
			}
		}
		else{
			x=objBoAddFacility.deleteFacility(objVoAddFacility);
			if(x==1){
				session.setAttribute("errorMessage", "Appointment Event  cannot be deleted.It has fixed appointments");
				return mapping.findForward("delete-failure");
			}
			if(x==2){			
				session.setAttribute("message", "Appointment Event  deleted  Successfully");	
				return mapping.findForward("delete-success");
			}
			else{
				return mapping.findForward("delete-failure");
			}
		}
	}		
}
