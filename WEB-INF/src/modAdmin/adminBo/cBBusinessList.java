package modAdmin.adminBo;

import java.util.ArrayList;
import java.util.List;

import modAdmin.adminDo.cDBusinessList;
import modAdmin.adminVo.cVBusinessList;
import modCommon.commonBo.sendingMail;
import modLogger.cBLogger;

public class cBBusinessList {

	// To get All appointments list
	public List<String> getAppointmentsList(String searchKey,int schoolId) {
		cDBusinessList objDoBusinessList = new cDBusinessList();
		List<String> BusiListarr = new ArrayList();
		BusiListarr = objDoBusinessList.getAppointmentsList(searchKey,schoolId);
		return BusiListarr;
	}

	public ArrayList viewBusinessDetails1(String businessid) {
		cDBusinessList objDoBusinessList = new cDBusinessList();
		ArrayList BusiDetailsarr1 = new ArrayList();
		BusiDetailsarr1 = objDoBusinessList.hereBusinessDetails1(businessid);
		return BusiDetailsarr1;
	}

	public ArrayList viewBusinessDetails2(String businessid) {
		cDBusinessList objDoBusinessList = new cDBusinessList();
		ArrayList BusiDetailsarr1 = new ArrayList();
		BusiDetailsarr1 = objDoBusinessList.hereBusinessDetails2(businessid);
		return BusiDetailsarr1;
	}

	public int deleteBusiness(cVBusinessList objVoBusinessOpp) {
		cDBusinessList objDoBusinessList = new cDBusinessList();
		int res = 0;
		String[] temp;
		String delimeter = "_";
		temp = objVoBusinessOpp.getSelected_ids().split(delimeter);
		for (int i = 1; i < temp.length; i++) {
			if (objDoBusinessList.hereDeleteBusiness(temp[i]) == 0) {
				res = 0;
			} else if (objDoBusinessList.hereDeleteBusiness(temp[i]) == 2) {
				res = 2;
			} else if (objDoBusinessList.hereDeleteBusiness(temp[i]) == 1) {
				res = 1;
			}
		}
		return res;
	}

	public int updateUserStatus(cVBusinessList objVoBusinessOpp)
	{
		cDBusinessList objDoBusinessList = new cDBusinessList();
		int x=0;
		if (objDoBusinessList.hereUpdateUserStatus(objVoBusinessOpp) == 1) {
			String mailid=objVoBusinessOpp.getHidden_emailid();
			String subject="Business Status changed";
			String message="Your Business '"+objVoBusinessOpp.getHidden_busname()+"' is changed to the status '"+objVoBusinessOpp.getStatusname()+"'" ;
			sendingMail sendMail=new sendingMail();
			try{
			sendMail.fireEmail(mailid,message,subject);
			x=1;
			}
			catch(Exception e){
				cBLogger.error("class Name : cBBusinessList,  Function : updateUserStatus , Error : ",e);
			}
		}
		else{
			x=0;
		}
		return x;
	}

	// To get all users list
	public ArrayList getUsersList(String searchkey,int schoolId) {
		cDBusinessList objDoBusinessList = new cDBusinessList();
		ArrayList UserListarr = new ArrayList();
		UserListarr = objDoBusinessList.getUsersList(searchkey,schoolId);
		return UserListarr;
	}
	public int updateAppointmentStatus(cVBusinessList objVoBusinessOpp) {
		cDBusinessList objDoBusinessList = new cDBusinessList();
		return objDoBusinessList.hereUpdateAppointmentStatus(objVoBusinessOpp);
	}
}