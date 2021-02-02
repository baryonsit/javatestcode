package modCommon.commonBo;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import modCommon.commonDo.cDDisplayBusinessAndFacilities;


public class cBDisplayBusinessAndFacilities
{
	HttpSession session;
	
	//Fetch all the business present in a particular category 
	public ArrayList fetchBusinessByCategory(String c_id, String c_name,String searchkey)
	{
		cDDisplayBusinessAndFacilities objDocategory =new cDDisplayBusinessAndFacilities();
		ArrayList listofbusiness = new ArrayList();			
		listofbusiness = objDocategory.getBusinessByCategory(c_id,c_name,searchkey);
		return listofbusiness;
	}
	
	//get the details of a business
	public ArrayList fetchBusinessDetails(String business_id)
	{
		cDDisplayBusinessAndFacilities objDocategory =new cDDisplayBusinessAndFacilities();		
		ArrayList businessdetails = new ArrayList();			
		businessdetails = objDocategory.getBusinessDetails(business_id);
		return businessdetails;
	}
	
	
	//fetch all the facilities under a business
	public ArrayList fetchFacilitiesByBusiness(String c_id,int schoolId)
	{
		cDDisplayBusinessAndFacilities objDocategory =new cDDisplayBusinessAndFacilities();		
		ArrayList listofcategories = new ArrayList();			
		listofcategories = objDocategory.getFacilitiesByBusiness(c_id,schoolId);
		return listofcategories;
	}
	
	
	public ArrayList fetchFacilitiesDetails(String fac_id)
	{		
		cDDisplayBusinessAndFacilities objDocategory =new cDDisplayBusinessAndFacilities();
		ArrayList facility_details = new ArrayList();			
		facility_details = objDocategory.getFacilitiesDetails(fac_id);
		return facility_details;
	}
	
}