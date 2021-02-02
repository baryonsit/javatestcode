package modFacility.facilityBo;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import modAdmin.adminDo.cDBusinessList;
import modAdmin.adminVo.cVBusinessList;
import modCommon.commonBo.sendingMail;
import modFacility.facilityDo.cDFacilityManage;
import modFacility.facilityVo.cVFacilityManage;
import modLogger.cBLogger;

public class cBFacilityManage {
	//cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
	Hashtable hashtable = new Hashtable();

	public int insertFacilityDetails(cVFacilityManage objVoAddFacility,int schoolId) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		int result=objDoInsertFacDtl.insertDetailsDB(objVoAddFacility,schoolId);
		return result;

	}

	public int updateFacilityDetails(cVFacilityManage objVoAddFacility) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		int updateResult=objDoInsertFacDtl.updateDetailsDB(objVoAddFacility) ;
		return updateResult;
	}

	public int deleteFacility(cVFacilityManage objVoAddFacility) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		int deleteResult=0;
		String[] temp;
		String delimeter = "_";
		temp = objVoAddFacility.getSelected_ids().split(delimeter);
		for (int i = 1; i < temp.length; i++) {
			cBLogger.error("Did not found facility IDS" + temp[i]);
			int deleteResultDB=objDoInsertFacDtl.deleteFacilityDB(temp[i]); 
			if (deleteResultDB == 1) {
				deleteResult=1;			//cannot be deleted . There are fixed appoinments
			}
			else if(deleteResultDB == 2){
				deleteResult=2;			//facility deleted
			}
			else{
				deleteResult=0;
			}
		}
		return deleteResult;		
	}

	public ArrayList getFacilityList(String facilitytype,String search_by_facname,String userid,int schoolId) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		ArrayList FacilityListarr = new ArrayList();
		FacilityListarr = objDoInsertFacDtl.getFacilityList(facilitytype,search_by_facname,userid,schoolId);
		return FacilityListarr;
	}
	
	public String getBusinessId(String userid) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		String businessid = "";
		businessid = objDoInsertFacDtl.getBusinessId(userid);
		return businessid;
	}

	
	public ArrayList getFacilityDetails(int facility_id) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		ArrayList FacilityDeatailsarr = new ArrayList();
		FacilityDeatailsarr = objDoInsertFacDtl.getFacilityDetails(facility_id);
		return FacilityDeatailsarr;
	}
	
	public ArrayList getBusinessAddress(String user_id) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		ArrayList BusinessAddrsarr = new ArrayList();
		BusinessAddrsarr = objDoInsertFacDtl.getBusinessAddress(user_id);
		return BusinessAddrsarr;
	}
	public int Addoptholiday(String date,String desc,int facilityid,String function){
		cDFacilityManage objDoInsertholidayDtl = new cDFacilityManage();
		int flag=0;
		flag = objDoInsertholidayDtl.Addoptholiday(date,desc,facilityid,function);
		return flag;
	}
	public ArrayList getholidaydetail(int facilityid) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		ArrayList holidaydetail = new ArrayList();
		holidaydetail = objDoInsertFacDtl.getholidaydetail(facilityid);
		return holidaydetail;
	}
	public ArrayList getfacility_id(){
		cDFacilityManage objDogetfacility_id = new cDFacilityManage();
		ArrayList facility_id= new ArrayList();
		facility_id = objDogetfacility_id.getfacility_id();
		return facility_id;
	}
	public Boolean getBusinnesstoUserDet(String fac_id,String business_id,String user_id,String role_id){
		cDFacilityManage objBusinnesstoUserDet = new cDFacilityManage();
		boolean Det= false;
		Det = objBusinnesstoUserDet.getBusinnesstoUserDet(fac_id,business_id,user_id,role_id);
		return Det;
	}
	public int insert_user_to_business(String user_id,String business_id){
		int flag= 0;
		cDFacilityManage objaddUsertoBusinness = new cDFacilityManage();
		flag = objaddUsertoBusinness.insert_user_to_business(user_id,business_id);
		return flag;
	}
	//update appointment status
	public int updateFacilityStatus(cVFacilityManage objVoAddFacility)
	{
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		int x=0;
		x=objDoInsertFacDtl.hereUpdateAppointmentStatus(objVoAddFacility) ;
		return x;
	}

	// update appointment details
	public int updateAppointmentDetails(cVFacilityManage objVoAddFacility) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		int updateResult = objDoInsertFacDtl.updateAppointmentDetails(objVoAddFacility);
		return updateResult;
	}
	
	// update appointment details
	public List<String> getCountryNameById(String countryId, String stateId, String cityId, String categoryId) {
		cDFacilityManage objDoInsertFacDtl = new cDFacilityManage();
		return objDoInsertFacDtl.getCountryNameById(countryId, stateId, cityId, categoryId);

	}
}