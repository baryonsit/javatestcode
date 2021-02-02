package modUser.userregistrationAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;

import modUser.userregistrationBo.cBuserregistration;

public class cAuserregistration extends Action {
	Gson gson = new Gson();
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse res) throws SQLException {
		String user_name = req.getParameter("username");
		String password = req.getParameter("pass");
		String first_name = req.getParameter("fname");
		String email_id = req.getParameter("email");
		String ph_no = req.getParameter("phno");
		String role_id = req.getParameter("role_id");
		cBuserregistration cbreg = new cBuserregistration();
		int value = cbreg.userdetails(user_name, password, first_name, email_id, ph_no, role_id);
		HashMap<String,Integer> map = new HashMap();
		map.put("success",value);

				  String jsonString = gson.toJson(map);
				  res.setContentType("application/json");
				  try {
					res.getWriter().write(jsonString);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null;

	}
}
