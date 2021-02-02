package modCommon.commonAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modCommon.commonBo.cBSendMail;
import modCommon.commonVo.cVSendMail;

public class cASendMail extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();	
	
			
		cVSendMail cvmail=(cVSendMail) form;
			cBSendMail cbSendMail= new cBSendMail();
			boolean ack = cbSendMail.sendInvites(cvmail);

			if(ack){
				session.setAttribute("message", "Invites Send By Mail Successfully");		
				return mapping.findForward("success");
			}else{
				session.setAttribute("message", "Invites Send By Mail Not Successful");
				return mapping.findForward("fail");
			}
		}
	
}

