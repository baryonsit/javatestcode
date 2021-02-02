package modAdmin.adminDo;

import modCommon.commonDo.cDConnectionManager;
import modCommon.commonDo.indexConnection;

import modAdmin.adminVo.*; //import modEmp.bisDo.*;
import modLogger.cBLogger;
import java.sql.*;

import java.util.*;

import org.apache.commons.lang3.StringUtils;

public class cDAdminFunctions {

	cDConnectionManager objConnMan=null;
	indexConnection dbcon = null;
	boolean connected = false ;
	
	int time_sheet_id = 0;
	ArrayList subFlds = new ArrayList();

	public cDAdminFunctions() {
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
			cBLogger.error("class name : cDAdminFunctions, Constructor : cDAdminFunctions ,error : ",e);
		}
	}
	
	public ArrayList getSubscriptionList(String sub_name) {
		ArrayList arr = new ArrayList();
		if (connected) {
			ResultSet r1=null;
			try {
				
				String selectQuery = "select * from tb_subscription";
				if(StringUtils.isNotEmpty(sub_name)){
				selectQuery+=" where subs_name like '%"+sub_name+"%'"; 
				}
				
				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				while (r1.next()) {
					arr.add(r1.getInt(1));  
					arr.add(r1.getString(2));
					arr.add(r1.getString(3));
					arr.add(r1.getFloat(4));
					arr.add(r1.getInt(5));
				

				}
			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT CDAddFacility.JAVA----",sqlex);
			}

			finally {
				try {
					if(r1!=null)
						r1.close();
				} catch (SQLException e) {
					cBLogger.error("class name : cDAdminFunctions, Constructor : getSubscriptionList ,error : ",e);
				}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}
	public int insertDetailsDB(cVSubscription objVoSubscription) {
		int insertFlag=0;
		int x=0;
		if (connected) {
			ResultSet rs1=null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt_sub = null;
			try {
				dbcon.con.setAutoCommit(false);
				
				pstmt = dbcon.con.prepareStatement("select * from tb_subscription where subs_name=?");
				pstmt.setString(1,objVoSubscription.getSubname());
				rs1 = pstmt.executeQuery();
				/*String checkSubscriptionUnique="select * from tb_subscription where subs_name='"+objVoSubscription.getSubname()+"'";
				ResultSet rs1=dbcon.con.createStatement().executeQuery(checkSubscriptionUnique);*/
				if(rs1.next()){
					cBLogger.error("Subscription name already exist" );
					insertFlag=1;
					x=1;
				}
				pstmt_sub = dbcon.con.prepareStatement("INSERT into tb_subscription values(?,?,?,?,?)");
				pstmt_sub.setString(1, null);
				pstmt_sub.setString(2,objVoSubscription.getSubname() );
				pstmt_sub.setString(3, objVoSubscription.getSubdesc());
				pstmt_sub.setFloat(4, objVoSubscription.getSubamount());					
				pstmt_sub.setInt(5, objVoSubscription.getDuration());			
				pstmt_sub.addBatch();

				try {
					if(insertFlag==0){
					// throw(new SQLException());						
						pstmt_sub.executeBatch();
					dbcon.con.commit();
					x=2;
					}else{
						
					}
					// dbcon.con.setAutoCommit(true);
				} catch (Exception se) {
					cBLogger.error("Subscription details not inserted in DB",se);
					dbcon.con.rollback();
					x=0;
				}

			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT CDAdminFunctions.JAVA in method insertDetailsDB()----",sqlex);
			}

			finally {
				
					try {
						if(rs1!=null)
							rs1.close();
						if(pstmt!=null)
							pstmt.close();
						if(pstmt_sub!=null)
							pstmt_sub.close();
						
					} catch (Exception e) {
						cBLogger.error("class name : cDAdminFunctions, Constructor : insertDetailsDB ,error : ",e);
					}
				
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return x;
	}
	
	public ArrayList getSubDetails(int subscription_id){
		
		if (connected) {
			ResultSet rs=null;
			try {
				subFlds.clear();
				String query="select * from tb_subscription where subs_id='"+subscription_id+"'";
				rs = dbcon.con.createStatement().executeQuery(query);
				while (rs.next()) {
					subFlds.add(rs.getInt(1));/* 0 sub id */
					subFlds.add(rs.getString(2));/* 1 sub name*/
					subFlds.add(rs.getString(3));/* 2 sub desc */
					subFlds.add(rs.getFloat(4));/* 3 sub amount */
					subFlds.add(rs.getInt(5));/* 4 sub duration */											
				}
			

			} catch (Exception e) {
				cBLogger.error("sql" , e);	
			} finally {
					try {
						if(rs!=null)
						rs.close();
					} catch (SQLException e) {
						cBLogger.error("class name : cDAdminFunctions, Constructor : getSubDetails ,error : ",e);
					}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return subFlds;
	
	}
	
	
	public int updateDetailsDB(cVSubscription objVoSubscription) {
		int updateFlag=0;
		int y=0;

	try{
		if (connected)
		{
			ResultSet check=null;
			ResultSet rr=null;
			ResultSet check1=null;
			ResultSet checkSubUniquenessrs=null;
			PreparedStatement pstmt1=null;
			PreparedStatement pstmt2=null;
			try
			{
			String checkSubscriptionUnique="select subs_name from tb_subscription where subs_id='"+objVoSubscription.getSubid_hidden()+"'";

			 check = dbcon.con.createStatement().executeQuery(checkSubscriptionUnique);
			if(check.next())
			{
				
				
				if(objVoSubscription.getSubname().equals(check.getString(1)))
				{
					String checkSubscription = "select * from tb_user_subscription where subs_id='"+objVoSubscription.getSubid_hidden()+"' ";
					rr=dbcon.con.createStatement().executeQuery(checkSubscription);
					if(rr.next()) {
						cBLogger.error("Subscription cannot be updated .Its in use" );
						y=3;
						
					}
					else{
											
						/*String updateQuery = "UPDATE tb_subscription set subs_name='"
							+ objVoSubscription.getSubname()
							+ "',subs_description='"
							+ objVoSubscription.getSubdesc()
							+ "',subs_amount="
							+ objVoSubscription.getSubamount() + ","
							+ "subs_duration='"
							+ objVoSubscription.getDuration()
							+ "' where subs_id="
							+ objVoSubscription.getSubid_hidden();*/
					/*String updateQuery = "UPDATE tb_subscription set subs_name='"+objVoSubscription.getSubname()+"',subs_description='"+objVoSubscription.getSubdesc()+"',subs_amount='"+objVoSubscription.getSubamount()+"',subs_duration='"+objVoSubscription.getDuration()+"' where subs_id='"+objVoSubscription.getSubid_hidden()+"' ";	
					dbcon.con.createStatement()1.executeUpdate(updateQuery);*/
					pstmt1 = dbcon.con.prepareStatement("UPDATE tb_subscription set subs_name=?,subs_description=?,subs_amount=?,subs_duration=? where subs_id='"+objVoSubscription.getSubid_hidden()+"'");
					pstmt1.setString(1,objVoSubscription.getSubname());
					pstmt1.setString(2,objVoSubscription.getSubdesc());
					pstmt1.setFloat(3,objVoSubscription.getSubamount());
					pstmt1.setInt(4,objVoSubscription.getDuration());
			
					pstmt1.executeUpdate();
					
					y = 2;
					}
				}	
				else
				{
					pstmt1 = dbcon.con.prepareStatement("select * from tb_subscription where subs_name=?");
					pstmt1.setString(1,objVoSubscription.getSubname());
					check1 = pstmt1.executeQuery();
					/*String checkSubUnique1="select * from tb_subscription where subs_name='"+objVoSubscription.getSubname()+"'";
					ResultSet check1=dbcon.con.createStatement().executeQuery(checkSubUnique1);*/
					if(check1.next())
					{
						cBLogger.error("Subscription name already exist for updation" );
						updateFlag=1;
						y=1;
					}
					else
					{
						pstmt2 = dbcon.con.prepareStatement("select * from tb_subscription where subs_name=?");
						pstmt2.setString(1,objVoSubscription.getSubname());
						checkSubUniquenessrs = pstmt2.executeQuery();
						/*String checkSubUniqueness="select * from tb_subscription where subs_name='"+objVoSubscription.getSubname()+"'";
						ResultSet checkSubUniquenessrs=dbcon.con.createStatement().executeQuery(checkSubUniqueness);*/
						if(checkSubUniquenessrs.next())
						{
							cBLogger.error("Subscription name already exist for updation" );
							updateFlag=1;
							y=1;
						}				
						else
						{
							String checkSubUsage = "select * from tb_user_subscription where subs_id='"+objVoSubscription.getSubid_hidden()+"' ";
							rr=dbcon.con.createStatement().executeQuery(checkSubUsage);
							
							if(rr.next()) {
								cBLogger.error("Subscription cannot be updated .Its in use" );
								y=3;
								
							}
							else
							{
								/*String updateQuery = "UPDATE tb_subscription set subs_name='"
									+ objVoSubscription.getSubname()
									+ "',subs_description='"
									+ objVoSubscription.getSubdesc()
									+ "',subs_amount="
									+ objVoSubscription.getSubamount() + ","
									+ "subs_duration='"
									+ objVoSubscription.getDuration()
									+ "' where subs_id="
									+ objVoSubscription.getSubid_hidden();
								dbcon.con.createStatement().executeUpdate(updateQuery);*/	
								PreparedStatement pstmt3 = dbcon.con.prepareStatement("UPDATE tb_subscription set subs_name=?,subs_description=?,subs_amount=?,subs_duration=? where subs_id='"+objVoSubscription.getSubid_hidden()+"'");
								pstmt3.setString(1,objVoSubscription.getSubname());
								pstmt3.setString(2,objVoSubscription.getSubdesc());
								pstmt3.setFloat(3,objVoSubscription.getSubamount());
								pstmt3.setInt(4,objVoSubscription.getDuration());
								pstmt3.executeUpdate();
								y = 2;
							}
						}
					}
				}
			}
		}
		catch(Exception updateclass)
		{
			cBLogger.error("Class Name :  cDAdminFunctions, Function : updateDetailsDB , Error : ", updateclass);	
			y = 3;		//error
		}
		finally
		{
			try{
			if(check!=null)
				check.close();
			if(rr!=null)
				rr.close();
			if(check1!=null)
				check1.close();
			if(checkSubUniquenessrs!=null)
				checkSubUniquenessrs.close();
			if(pstmt1!=null)
				pstmt1.close();
			if(pstmt2!=null)
				pstmt2.close();
			}catch(Exception e){
				cBLogger.error("Class Name :  cDAdminFunctions, Function : updateDetailsDB , Error : ", e);	
			}
			objConnMan.closeConnection(dbcon.index);
		}
	}
	}	
	catch(Exception db)
	{
		cBLogger.error("Class Name :  cDAdminFunctions, Function : updateDetailsDB , Error : Data Base Connection Problem",db);
		y = 0;		//Data Base Connection Problem
	}
		return y;
	}
	
	
	
	
	
	public int deleteSubscriptionDB(String temp) {
		int x=0;
		if (connected) {
			ResultSet rr=null;
			try {
				String check = "select * from tb_user_subscription where subs_id='"+temp+"' ";
				rr=dbcon.con.createStatement().executeQuery(check);
				
				if(rr.next()) {
					x=3;
					cBLogger.error("Subscription cannot be deleted .Its in use" );	
				}				
				else{
					String deleteQuery = "delete from tb_subscription where subs_id='"+ temp + "'";
					
					if (dbcon.con.createStatement().executeUpdate(deleteQuery) == 1) {
					x=1;
					} else {
					x=2;
					}
				}
				
			} catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT CDAdminFunctions.JAVA in method deleteSubscriptionDB()----",sqlex);
			}

			finally {
					try {
						if(rr!=null)
							rr.close();
					} catch (SQLException e) {
						cBLogger.error("Class Name :  cDAdminFunctions, Function : deleteSubscriptionDB , Error : ",e);
					}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return x;
	}
	
public ArrayList getGlobalSettings() {
		ArrayList arr = new ArrayList();
		if (connected) {
			ResultSet r1=null;
			try {
				
				String selectQuery = "select param_name,param_value from tb_global_settings";			
				r1 = dbcon.con.createStatement().executeQuery(selectQuery);
				while (r1.next()) {
					arr.add(r1.getString(1));  
					arr.add(r1.getString(2));
				}
				r1.close();
			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDAdminFunctions,  Function : getGlobalSettings , error :",sqlex);
			}

			finally {
					try {
						if(r1!=null)
							r1.close();
					} catch (SQLException e) {
						cBLogger.error("class Name : cDAdminFunctions,  Function : getGlobalSettings , error :",e);
					}
				objConnMan.closeConnection(dbcon.index);
			}
		}
		return arr;
	}


public ArrayList getSettedCurrency(){
	ArrayList arr = new ArrayList();
	if (connected) {
		ResultSet r1=null;
		try {
			
			String default_currency="default_currency";
			String selectQuery = "select currency_name from tb_currency where currency_id=(select param_value from tb_global_settings where param_name='"+default_currency+"')";			
			r1 = dbcon.con.createStatement().executeQuery(selectQuery);
			while (r1.next()) {
				arr.add(r1.getString(1));  
				
			}
		} catch (SQLException sqlex) {
			cBLogger.error("SQL EXCEPTION AT CDAdminFunctions.JAVA in method getSettedCurrency()----",sqlex);
		}

		finally {
			try {
				if(r1!=null)
					r1.close();
			} catch (SQLException e) {
				cBLogger.error("class Name : cDAdminFunctions,  Function : getSettedCurrency , error :",e);
			}
			objConnMan.closeConnection(dbcon.index);
		}
	}
	return arr;
}

	public int updateGlobalSettings(cVSubscription objVoSubscription){
	if (connected) {
			try {
				String default_country="default_country";
				String default_currency="default_currency";
				String updateQuery = "UPDATE tb_global_settings set param_value='"+ objVoSubscription.getDefaultcountry()+"' " +
						"where param_name='"+default_country+"'";
				String updateQuery1 = "UPDATE tb_global_settings set param_value='"+ objVoSubscription.getDefaultcurrency()+"' " +
				"where param_name='"+default_currency+"'";
			
			if ((dbcon.con.createStatement().executeUpdate(updateQuery) ==1 )&& (dbcon.con.createStatement().executeUpdate(updateQuery1)== 1)) {				
				return 1;
			} else {
				
				return 0;
			}
			}

			catch (SQLException sqlex) {
				cBLogger.error("SQL EXCEPTION AT CDAddFacility.JAVA in method updateGlobalSettings()----",sqlex);
			}

			finally {
				objConnMan.closeConnection(dbcon.index);
			}
			
	}
	return 1;
}
public int updateGlobalSettingsByBo(cVGlobalSettingByBusinessOwner objVoGlobalSetting){
		if (connected) {
				try {
					String default_country="default_country_by_bo";
					String updateQuery = "UPDATE tb_global_settings set param_value='"+ objVoGlobalSetting.getDefault_country_by_bo()+"' " +
							"where param_name='"+default_country+"'";
					
				
				if ((dbcon.con.createStatement().executeUpdate(updateQuery) ==1 )) {				
					return 1;
				} else {
					
					return 0;
				}
				}

				catch (SQLException sqlex) {
					cBLogger.error("SQL EXCEPTION AT CDAddFacility.JAVA in method updateGlobalSettings()----", sqlex);
				}

				finally {
					objConnMan.closeConnection(dbcon.index);
				}
		}
		return 1;
	}
}