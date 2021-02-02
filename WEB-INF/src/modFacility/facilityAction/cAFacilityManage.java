package modFacility.facilityAction;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modAppointment.appointmentBo.cBFixAppointment;
import modCommon.commonBo.sendingMail;
import modFacility.facilityBo.cBFacilityManage;
import modFacility.facilityVo.cVFacilityManage;


public class cAFacilityManage extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		cVFacilityManage objVoAddFacility = (cVFacilityManage) form;
		cBFacilityManage objBoAddFacility=new cBFacilityManage();
		HttpSession session = req.getSession();
		int x = 0;boolean ackm=false;
		if(objVoAddFacility.getCheckvalue()==1){
					x=objBoAddFacility.updateAppointmentDetails(objVoAddFacility);	
					if(x == 1 && objVoAddFacility.getAppointment_status().equals("Cancelled")){
						cBFixAppointment cbus = new  cBFixAppointment();
						String username=(String) session.getAttribute("logedusername");
						List<String> details=cbus.getUserEmailId(objVoAddFacility.getUserid_hidden());
						String emailId =null;
						if(details.size()>0){
							emailId = details.get(0);
							username = details.get(1);
						}
						sendingMail mail=new sendingMail();
						ackm=mail.sendCancelAppointmentEmail(emailId,username,objVoAddFacility);
					}
					if (x == 1){
						session.setAttribute("message", "Appointment Status Changed Successfully ");
						return mapping.findForward("status-success");
					}
					if (x == 2){
						session.setAttribute("errorMessage", "Error while changing Appointment Status");
						return mapping.findForward("failure");
					}
					else{
						return mapping.findForward("failure");
					}
				
		}else{
			 if(Integer.parseInt(objVoAddFacility.getFacid_hidden())==0){		
				 int schoolId = session.getAttribute("schoolId") != null ? Integer.valueOf((String) session.getAttribute("schoolId")) : 0;
				x=objBoAddFacility.insertFacilityDetails(objVoAddFacility,schoolId);
				
				if (x == 1){
					session.setAttribute("errorMessage", "Appointment Event Name already exists.Please enter another");	
					return mapping.findForward("facility_exist");
				}
				if(x==2){				
					session.setAttribute("message", "Your Appointment Event Created Successfully,Please Contact Admin To Make It Active");
					return mapping.findForward("insert_success");
				}
				else{
					session.setAttribute("errorMessage", "Error while Creating Appointment Event");
					return mapping.findForward("insert_failure");
					}
				}
			
			
			else {		
				
				x=objBoAddFacility.updateFacilityDetails(objVoAddFacility);			
				if (x == 1){
					session.setAttribute("errorMessage", "Appointment Event already exists.Please enter another");
					return mapping.findForward("facility_exist");
				}
				if (x == 3){
					session.setAttribute("errorMessage", "Error while updating Appointment Event information");
					return mapping.findForward("update_failure");
				}
				if (x == 4){
					session.setAttribute("errorMessage", "Appointment Event cannot be updated as there are appointments for this Appointment Event");
					return mapping.findForward("facility_exist");
				}
				if (x == 2){
					
			    	   if(session.getAttribute("logedroleid").equals(1))
				       {
			    		    session.setAttribute("message", "Appointment Event details updated Successfully");
							return mapping.findForward("update_successfully");
			    		   
				       }else{
				    	   session.setAttribute("message", "Appointment Event details updated Successfully");
							return mapping.findForward("update_success");
				       }
					
				}
				else{
					return mapping.findForward("update_failure");
				}
			}
		}
		
			
	}
}