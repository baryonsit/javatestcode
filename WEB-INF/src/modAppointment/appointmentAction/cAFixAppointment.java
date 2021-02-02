package modAppointment.appointmentAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modAppointment.appointmentBo.cBFixAppointment;
import modAppointment.appointmentVo.cVFixAppointment;

public class cAFixAppointment extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();

		cVFixAppointment cvar = (cVFixAppointment) form;
		cBFixAppointment cbus = new cBFixAppointment();
		if (cvar.getFlag().equals("1")) {
			int flag = cbus.getFix(cvar, session);
			if (flag == 1) {
				session.setAttribute("message", "Your Appointment Is Fixed Sucessfully,Message Is Sent To Registered Email Id");
				return mapping.findForward("success");
			} else if (flag == 2) {

				session.setAttribute("errorMessage", "Appointments are not available for all the dates for the selected time slot.");
				return mapping.findForward("failure");
			} else {
				session.setAttribute("errorMessage", "Failure Accured While Fixing Your Appointment");
				return mapping.findForward("failure");
			}
		}
		if (cvar.getAppid_hidden() != 0 && !cvar.getFlag().equals("1")) {
			if (cbus.cancelAppointment(cvar) == 1) {
				session.setAttribute("message", "Appointment Status Changed Successfully");
				return mapping.findForward("cancel-sucess");
			} else {
				return mapping.findForward("cancel-failure");
			}
		}
		return mapping.findForward("failure");
	}
}