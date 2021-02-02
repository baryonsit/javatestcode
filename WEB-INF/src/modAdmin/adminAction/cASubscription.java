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


public class cASubscription extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		cVSubscription objVoSubscription = (cVSubscription) form;
		cBSubscriptionManage objBoAddSubscription=new cBSubscriptionManage();
		HttpSession session = req.getSession();
		
		int x = 0;
		
		 if(Integer.parseInt(objVoSubscription.getSubid_hidden())==0){
			
			x=objBoAddSubscription.insertSubscriptionDetails(objVoSubscription);
			if (x == 1){
				session.setAttribute("message", "Subscription already exists.Please enter another");	
				return mapping.findForward("Subscription_exist");
			}
			if(x == 2){				
				session.setAttribute("message", "Subscription Details inserted Successfully");
				return mapping.findForward("insert_success");
			}
			else{
				return mapping.findForward("insert_failure");
			}
		}
		
		 else {	
				x=objBoAddSubscription.updateSubscriptionDetails(objVoSubscription);				
				if (x == 3){	
					session.setAttribute("message", "Subscription cannot be Updated. Its already in use");	
					return mapping.findForward("update_success");
				}
				if (x == 1){
					session.setAttribute("message", "Subscription already exists.Please enter another");	
					return mapping.findForward("Subscription_exist");
				}
				if(x==2){
					session.setAttribute("message", "Subscription details updated");
					return mapping.findForward("update_success");
				}
				if(x==4){
						session.setAttribute("message", "Failure in updating subscription");
						return mapping.findForward("update_failure");
				}
				if(x==0){
					session.setAttribute("message", "Database connection problem");
					return mapping.findForward("update_failure");
				}
				else{
					return mapping.findForward("update_failure");
				}
			}
		
			
	}
}