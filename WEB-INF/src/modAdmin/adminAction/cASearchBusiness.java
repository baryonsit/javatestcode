package modAdmin.adminAction;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modCommon.commonBo.cBDisplayBusinessAndFacilities;


public class cASearchBusiness extends Action {
	HttpSession session;
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {
		String cID= req.getParameter("cID");
 		String cNAME=req.getParameter("cNAME");
		String searchkey=req.getParameter("busCityList");
		String country_id=req.getParameter("county_id");
		String state_id=req.getParameter("countryid");
		ArrayList arr;
		cBDisplayBusinessAndFacilities objBoSearch=new cBDisplayBusinessAndFacilities();
		arr = objBoSearch.fetchBusinessByCategory(cID,cNAME,searchkey);
		req.setAttribute("country_id", country_id);
		req.setAttribute("category_id","100");
		req.setAttribute("category_name",cNAME);
		req.setAttribute("busCityList",searchkey);
		req.setAttribute("searchkey","NOTALL");
		req.setAttribute("search1", arr);
		req.setAttribute("state_id", state_id);
		
		
		if (arr.size() > 0){
			return mapping.findForward("success");
			}
		
		else
		{
		    return mapping.findForward("failure");
		}
		
	}
	
}