package modCommon.commonBo;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;


import modCommon.commonDo.cDProfileManagement;
import modCommon.commonVo.cVProfileManagement;
import modLogger.cBLogger;



public class cBProfileManagement
{
	
	public int updateUserProfile(cVProfileManagement semp, HttpServletRequest req)
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		if(objDoprofile.doUpdateProfile(semp)==1){
			return 1;
		}
		else{
			return 0;
		}	
	}
	
	public ArrayList userProfileDetails(String qsuserid, String qsroleid)
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		ArrayList profilelist = new ArrayList();			
		profilelist = objDoprofile.getUserProfileDetails(qsuserid, qsroleid);
		return profilelist;
	}
	
	public ArrayList userBusinessDetails(String qsuserid, String qsroleid)
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		ArrayList businesslist = new ArrayList();			
		businesslist = objDoprofile.getUserBusinessDetails(qsuserid, qsroleid);
		return businesslist;
	}
	
	
	public ArrayList getSubscription()
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		ArrayList sublist = new ArrayList();			
		sublist = objDoprofile.getSubscriptionHere();
		return sublist;
	}
	
	public ArrayList getStates(String conty_id)
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		ArrayList states = new ArrayList();			
		states = objDoprofile.getStates(conty_id);
		return states;
	}
	
	public ArrayList getallBuscity(String contry_id)
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		ArrayList Buscitylist = new ArrayList();			
		Buscitylist = objDoprofile.getAllBuscitylist(contry_id);
		return Buscitylist;
	}
	
	public ArrayList getStatesforcountry(String category_id)
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		ArrayList Buscitylist = new ArrayList();			
		Buscitylist = objDoprofile.getStatesforcountry(category_id);
		return Buscitylist;
	}
	
	public ArrayList getCategories()
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		ArrayList catist = new ArrayList();			
		catist = objDoprofile.getCategoriesHere();
		return catist;
	}
	
	public ArrayList getCategoryonid(String user_id,String role_id)
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		ArrayList catist = new ArrayList();	
		catist = objDoprofile.getCategoryonidHere(user_id,role_id);
		return catist;
	}
	
	public ArrayList getStatesforSearch(String country_id)
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		ArrayList catist = new ArrayList();	
		catist = objDoprofile.getStatesfromDB(country_id);
		return catist;
	}
	//To get business_id by User_id
	public int getBusinessIdByUserId(String user_id,String c_id)
	{
		cDProfileManagement objDoprofile =new cDProfileManagement();
		int businessId = objDoprofile.getBusinessIdByUserId(user_id,c_id);
		return businessId;
	}
	// Getting  Appointment list by id
	public JSONArray getappointments(String userId,String roleid) {
		JSONArray appointmentList = new JSONArray();
		cDProfileManagement objDoprofile =new cDProfileManagement();
		appointmentList = objDoprofile.getappointments(userId,roleid);
		return appointmentList;
	}
}




