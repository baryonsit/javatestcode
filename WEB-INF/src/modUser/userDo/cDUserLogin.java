package modUser.userDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.EzAppointmentConstant;
import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;
import modLogger.cBLogger;

//Data class for Login functionality

public class cDUserLogin {
	
	ArrayList arr=new ArrayList();
	ResultSet r4=null,r3=null,r1=null,r2 = null;
	int x = 0;
	
	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	HttpSession session;
	
	public cDUserLogin() {
		try
		{
			objConnMan= cDConnectionManager.getObjHandle();
			dbcon = objConnMan.openConnection();
			
			if (dbcon.con==null)
				connected=false;
			else
				connected= true;	
		}
		catch(Exception e)
		{
			cBLogger.error("class Name : cDUserLogin, Constructor : cDUserLogin, Error : ", e);
		}
	}
	
	//Method for hereuserlogin, called from Business class
	
	public int hereUserLogin(String userCAS, HttpServletRequest req)
	{
		int val = 0;
		if (connected){
			ResultSet r = null, r1 = null, r2= null, r3= null,r4= null,r5= null,r6= null;
			try{
					
				  String loginCheck = "select * from tb_login where username='" + userCAS + "'";
                  r = this.dbcon.con.createStatement().executeQuery(loginCheck);
                  if(r.next()){
                  	 this.session = req.getSession();
                       String emp_id = r.getString(4);
                       String loginCheck1 = "select * from tb_login where username='" + userCAS + "' and login_status='1'"; 
                       r1 = this.dbcon.con.createStatement().executeQuery(loginCheck1);
                  if (r1.next()) {
                      this.session = req.getSession();
                      String emp_id1 = r1.getString(4);
                      String status_id = r1.getString(5);
                      String checkRoleid = "select t1.role_id,t1.role_name from tb_roles as t1,tb_empuserrole as "
                      		+ "t2 where t1.role_id=t2.userrole_id and t2.empid='" + emp_id + "'";
                      r2 = this.dbcon.con.createStatement().executeQuery(checkRoleid);
                      if (r2.next()) {
                          this.session.setAttribute("logedusername", (Object)r1.getString(2));
                          this.session.setAttribute("logeduserid", (Object)r1.getString(4));
                          this.session.setAttribute("logedroleid", (Object)r2.getString(1));
                          if (Arrays.asList(EzAppointmentConstant.SUPERADMIN,EzAppointmentConstant.INSTITUTEADMIN).contains(r2.getString(1))) {
								val = 4;
							} else if(Arrays.asList(EzAppointmentConstant.SCHOOLADMIN, EzAppointmentConstant.PRINCIPAL,EzAppointmentConstant.TEACHER).contains(r2.getString(1))){
                          String str = "select school_id  from tb_employee  where empid='" + r1.getString(4) + "'";
							r3 = dbcon.con.createStatement().executeQuery(str);
							if (r3.next()) {
								String sql = "select institute_id  from tb_school  where school_id='" + r3.getString(1) + "'";
								r4 = dbcon.con.createStatement().executeQuery(sql);
								if (r4.next()) {
									this.session.setAttribute("schoolId", r3.getString(1));
									this.session.setAttribute("instituteId", r4.getString(1));
									val = 2;
								} else {
									val = 5;
								}
							} else {
								val = 5;
							}
						}	else if (Arrays.asList(EzAppointmentConstant.STUDENT,EzAppointmentConstant.PARENT).contains(r2.getString(1))) {
							String str = "select school_id  from tb_student  where student_id='" + r1.getString(4) + "'";
							r5 = dbcon.con.createStatement().executeQuery(str);
							if (r5.next()) {
								String sql = "select institute_id  from tb_school  where school_id='" + r5.getString(1) + "'";
								r6 = dbcon.con.createStatement().executeQuery(sql);
								if (r6.next()) {
									this.session.setAttribute("schoolId", r5.getString(1));
									this.session.setAttribute("instituteId", r6.getString(1));
									val = 2;
								}
							} else {
								val = 4;
							}
						}
                         /* String str = "select institute_id  from tb_institute  where user_or_emp_id='" + r1.getString(4) + "'";
							r3 = dbcon.con.createStatement().executeQuery(str);
                          if (r3.next()) {
                          	this.session.setAttribute("instituteId", (Object)r3.getString(1));
							String sql = "select school_id  from tb_school_user_mapping  where institute_id='" + r4.getString(1) + "' and user_or_emp_id='"+userCAS+"'";
							r4 = dbcon.con.createStatement().executeQuery(sql);
							if (!r4.next()) {
								this.session.setAttribute("schoolId", "0");
							}
                          	val = 4;
                          }else{
                          	val=4;
                          }*/
                      } 
                  } else {
                      val = 3;
                  }
                  }else{
                  	val=1;
                  }
			/*	   	String loginCheck = "select * from tb_users where user_name='"+semp.getLoginun()+"' and passward = AES_ENCRYPT('"+semp.getLoginpwd()+"',1)";
				// Commented code for switch off Password check logic start
				
				//String loginCheck = "select * from tb_users where user_name='"+semp.getLoginun()+"' and passward = '"+semp.getLoginpwd()+"'";
				String loginCheck = "select * from tb_login where username='"+userCAS+"' ";
				r1 = dbcon.con.createStatement().executeQuery(loginCheck);
				if(r1.next())
				{
					
					                        	String query = "select u.user_id,r.role_id from tb_users u,tb_userrole r where u.user_id=r.user_id and u.user_name='"+semp.getLoginun()+"' and u.passward=AES_ENCRYPT('"+semp.getLoginpwd()+"',1)";
				// Commented code for switch off Password check logic start
					
				//	String query = "select u.user_id,r.role_id from tb_users u,tb_userrole r where u.user_id=r.user_id and u.user_name='"+semp.getLoginun()+"' and u.passward='"+semp.getLoginpwd()+"'";
					String query = "select u.user_id,r.role_id from tb_users u,tb_userrole r where u.user_id=r.user_id and u.user_name='"+userCAS+"' ";
					r2 = dbcon.con.createStatement().executeQuery(query);
					while(r2.next())
					{
						session = req.getSession();
						
						         //Super Administrator
						if(r2.getInt(2)==1 || r2.getInt(2)==2)
						{
								session.setAttribute("logeduserid", r2.getInt(1));
								session.setAttribute("logedroleid", r2.getInt(2));
								session.setAttribute("logedusername", userCAS);
								val=2;
						}
							
						        //Administrator (Business Owner)
						if(r2.getInt(2)==2)
						{
								
							String Statusquery = "select u.status,u.user_id from tb_users u,tb_business b where u.user_id=b.user_id and u.user_name='"+userCAS+"' ";
							r3 = dbcon.con.createStatement().executeQuery(Statusquery);
							if(r3.next())
							{	

								String status=r3.getString(1);
								String uid = r3.getString(2);
									
								if(status.equals("Active"))
								{
										session.setAttribute("logeduserid", r2.getInt(1));
										session.setAttribute("logedroleid", r2.getInt(2));
										session.setAttribute("logedusername", userCAS);
										
										String BusinessDetails = "select * from tb_business where user_id='"+uid+"' ";
										r4 = dbcon.con.createStatement().executeQuery(BusinessDetails);
										if(r4.next()) {
										              	session.setAttribute("businessName", r4.getString(3));
			   							             	session.setAttribute("ownerName", r4.getString(4));
								                      }
										val=2;
								}
								else if(status.equals("Inactive"))
								{
										val=3;
										
								}
							}
						}
							
						                  //Business Users
							
						if(r2.getInt(2)==3)
						{
								session.setAttribute("logeduserid", r2.getInt(1));
								session.setAttribute("logedroleid", r2.getInt(2));
								session.setAttribute("logedusername", userCAS);
								val=2;
						}
					  }
					}
					else
					{
						val = 1;		//username password doesnot match
					}
					*/
			}
			catch (Exception e){
				
				cBLogger.error("class Name : cDUserLogin,  Function  : hereUserLogin, Error : ", e);
				val = 1;
			}
			finally
			{
				try {
					if(r!=null)
						r.close();
					if(r1!=null)
						r1.close();
					if(r2!=null)
						r2.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDUserLogin,  Function  : hereUserLogin, Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}		
		return val;
	}
	
	
	
	
//Method for getting session of functionlist of role_id
	
	public ArrayList getFunctionList(String role_id)
	{
		ArrayList functionnames=new ArrayList();
		//int y=0;
		if (connected){
			ResultSet r1 = null;
			try{
					
					
					String query = "select f.function_name,f1.role_id,f1.function_id from tb_appointmentfunctions f,tb_function_permissions f1 where f1.role_id='"+role_id+"' and f1.function_id=f.function_id ";
					r1 = dbcon.con.createStatement().executeQuery(query);
					
					while(r1.next()){
						functionnames.add(r1.getString(1));
					}
			}
			catch (Exception e){
				
				cBLogger.error("class Name : cDUserLogin,  Function  : getFunctionList, Error : ", e);
				
			}
			finally
			{
				try {
					if(r1!=null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class Name : cDUserLogin,  Function  : getFunctionList, Error : ", e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return functionnames;
	}
	
	/* insert and update user details into the table */
	public int insertuserdetails(String uname, String pass, String fname, String email, String phno)
			throws SQLException {

		int r1 = 0;
		ResultSet rs = null;
		String sql = "select user_name from tb_users where email_id='" + email + "' or phone_no='" + phno + "'";
		rs = dbcon.con.createStatement().executeQuery(sql);
		if (rs.next()) {
			// update
			String query = "UPDATE tb_users set user_name='" + uname + "',passward='" + pass + "',first_name='" + fname
					+ "',phone_no='" + phno + "' where email_id='" + email + "'";
			r1 = dbcon.con.createStatement().executeUpdate(query);
		} else
			try {

				String query = "insert into tb_users(user_id,user_name,passward,first_name,middle_name,last_name,email_id,phone_no,address_line1,address_line2,city,zip_code,state_id,country_id,membership_id,status) values(NULL,'"
						+ uname + "','" + pass + "','" + fname + "','NA','NA','" + email + "','" + phno
						+ "','NA','NA','NA','NA',0,0,'NA','NA') ";
				r1 = dbcon.con.createStatement().executeUpdate(query);

			} catch (Exception e) {

				cBLogger.error("class Name : cDUserLogin,  Function  : getFunctionList, Error : ", e);

			} finally {

				objConnMan.closeConnection(dbcon.index);
			}

		return r1;

	}

	/* insert and update role details in user registration */
	public int insertuserrole(int role_id, String email_id) throws SQLException {

		int r1 = 0;
		ResultSet rs = null;
		ResultSet rs1 = null;
		String sql = "select * from tb_users as t1 join tb_userrole as t2 where t1.user_id=t2.user_id and email_id='"
				+ email_id + "'";
		rs = dbcon.con.createStatement().executeQuery(sql);
		if (rs.next()) {
			// update
			int user_id = rs.getInt(1);
			String query = "UPDATE tb_userrole set role_id='" + role_id + "' where user_id='" + user_id + "'";
			r1 = dbcon.con.createStatement().executeUpdate(query);
		} else
			try {

				String sqlquery = "select user_id from tb_users where email_id='" + email_id + "'";
				rs1 = dbcon.con.createStatement().executeQuery(sqlquery);
				if (rs1.next()) {

					int user_id = rs1.getInt(1);
					String query = "insert into tb_userrole(user_id,role_id) values(" + user_id + "," + role_id + ") ";
					r1 = dbcon.con.createStatement().executeUpdate(query);
				}

			} catch (Exception e) {

				cBLogger.error("class Name : cDUserLogin,  Function  : getFunctionList, Error : ", e);

			} finally {

				objConnMan.closeConnection(dbcon.index);
			}

		return r1;

	}
}