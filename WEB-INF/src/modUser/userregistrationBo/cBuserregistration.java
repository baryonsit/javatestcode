package modUser.userregistrationBo;

import java.sql.SQLException;

import modUser.userDo.cDUserLogin;

public class cBuserregistration {

	public int userdetails(String uname, String pass, String fname, String email, String phn, String roleid)
			throws SQLException {
		cDUserLogin reg = new cDUserLogin();
		int result = 0, id, result1 = 0;
		id = Integer.parseInt(roleid);
		result1 = reg.insertuserdetails(uname, pass, fname, email, phn);
		if (result1 > 0) {
			result = reg.insertuserrole(id, email);

		}
		return result;

	}
}