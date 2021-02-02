package modAppointment.appointmentBo;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import modAppointment.appointmentDo.cDFixAppointment;
import modAppointment.appointmentVo.cVFixAppointment;
import modCommon.commonBo.sendingMail;
import modFacility.facilityVo.cVFacilityManage;
import modLogger.cBLogger;

public class cBFixAppointment {
	String mailEmailId;
	String mailUserName;
	cVFixAppointment appointObj;

	public int getFix(cVFixAppointment cvfa, HttpSession session) {
		cDFixAppointment cdfa = new cDFixAppointment();
		int flag = cdfa.getFix(cvfa);
		if (flag == 1) {
			try {
				appointObj = cvfa;
				String username = (String) session.getAttribute("logedusername");
				List<String> details = getUserEmailId(session.getAttribute("logeduserid").toString());
				String emailId = null;
				if (details.size() > 0) {
					emailId = details.get(0);
					username = details.get(1);
				}
				mailEmailId = emailId;
				mailUserName = username;
				// Asynchronous call to send mail Details .

				new Thread(new Runnable() {
					public void run() {
						sendingMail mail = new sendingMail();
						mail.sendAppointmentSuccessfulEmailToStudent(mailEmailId, mailUserName, appointObj);
					}
				}).start();

			} catch (Exception e) {
				cBLogger.error("class Name : cBFixAppointment, Function : cancelAppointment , Error : ", e);
			}
		}
		return flag;
	}

	public ArrayList getAppointmentDetails(String user_id, String facid, String dateFromTo) {
		cDFixAppointment cdfa = new cDFixAppointment();
		ArrayList FacilityDeatailsarr = new ArrayList();
		FacilityDeatailsarr = cdfa.getAppointmentDetails(user_id, facid, dateFromTo);
		return FacilityDeatailsarr;
	}

	public int cancelAppointment(cVFixAppointment cvfa) {
		cDFixAppointment cdfa = new cDFixAppointment();

		if (cdfa.cancelAppontmentDB(cvfa) == 1) {
			try {
				List<String> details = cdfa.getUserEmailByAppointmentId(cvfa.getAppid_hidden());
				sendingMail mail = new sendingMail();
				String username = details.get(4).toString();
				String emailId = details.get(0).toString();
				cVFacilityManage objVoAddFacility = new cVFacilityManage();
				objVoAddFacility.setFacilityname(details.get(1).toString());
				objVoAddFacility.setFacstartdate(details.get(2).toString());
				objVoAddFacility.setFacopentime(details.get(3).toString());
				mail.sendCancelAppointmentEmail(emailId, username, objVoAddFacility);
			} catch (Exception e) {
				cBLogger.error("class Name : cBFixAppointment, Function : cancelAppointment , Error : ", e);
			}
			return 1;
		} else {
			return 0;
		}
	}

	public List<String> getUserEmailId(String user_id) {
		cDFixAppointment cdfa = new cDFixAppointment();
		return cdfa.getUserEmailId(user_id);
	}

}
