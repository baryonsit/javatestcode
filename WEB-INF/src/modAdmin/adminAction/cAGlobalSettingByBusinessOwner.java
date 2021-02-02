package modAdmin.adminAction;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modAdmin.adminBo.cBSubscriptionManage;
import modAdmin.adminVo.cVGlobalSettingByBusinessOwner;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class cAGlobalSettingByBusinessOwner extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		cVGlobalSettingByBusinessOwner objVoGlobalSetting = (cVGlobalSettingByBusinessOwner) form;
		cBSubscriptionManage objBoGlobalSettings=new cBSubscriptionManage();
		HttpSession session = req.getSession();
		int x = 0;
		
		x=objBoGlobalSettings. updateGlobalSettingsByBo(objVoGlobalSetting);
			if(x>0){
			session.setAttribute("message", "Global Settings updated sucessfully");	
			return mapping.findForward("success");
			}
			else{
				return mapping.findForward("failure");	
			}
		}	
	}