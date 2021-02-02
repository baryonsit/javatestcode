package modAdmin.adminAction;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modAdmin.adminBo.cBSubscriptionManage;
import modAdmin.adminVo.cVSubscription;


public class cADeleteSubscription extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		cVSubscription objVoSubscription = (cVSubscription) form;
		cBSubscriptionManage objBoAddSubscription=new cBSubscriptionManage();
		HttpSession session = req.getSession();
		
		int x = 0;		
			x=objBoAddSubscription.deleteSubscription(objVoSubscription);
			if(x==1){
			session.setAttribute("message", "Subscription deleted Successfully");
			return mapping.findForward("delete_success");
			}
			if(x==3){
				session.setAttribute("message", "Subscription is in use. Cannot delete.");
				return mapping.findForward("delete_failure");
			}
			else
			{
				return mapping.findForward("delete_failure");
			}
		}	
		
		
			
	}
