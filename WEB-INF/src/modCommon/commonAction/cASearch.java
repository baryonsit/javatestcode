package modCommon.commonAction;

import java.util.ArrayList;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import modCommon.commonBo.cBSearch;
import modCommon.commonVo.cVSearch;

public class cASearch extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) {

			cVSearch objVoSearch=(cVSearch)form;
			cBSearch objBoSearch=new cBSearch();
			String countryid=req.getParameter("countryid");
			req.setAttribute("countryid", countryid);
			Hashtable<String,ArrayList<String>> arr;
			arr = objBoSearch.SearchBusiness(objVoSearch);
			req.setAttribute("search", arr);
			
			if (arr.size() <= 0){
				req.setAttribute("searchkey", "failure");
				return mapping.findForward("failure");
			}
			else{
				req.setAttribute("searchkey", "success");
				return mapping.findForward("success");
			}
			
		}
	
}
