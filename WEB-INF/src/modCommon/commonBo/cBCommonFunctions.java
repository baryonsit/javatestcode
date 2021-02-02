package modCommon.commonBo;

import java.text.SimpleDateFormat;

//import com.sun.java_cup.internal.parse_action;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import modCommon.commonDo.cDCommon;
import modCommon.commonDo.cDGetValues;
import modLogger.cBLogger;

public class cBCommonFunctions {
	public int canFixAppointment(String fac_id, String bid_id, String role_id, String user_id) {
		int result = 0;
		try {
			cDGetValues objDogetstateandcity = new cDGetValues();
			result = objDogetstateandcity.checkCanFixAppointment(fac_id, bid_id, role_id, user_id);
		} catch (Exception ex) {
			cBLogger.error("class name : cBCommonFunctions, Function : canFixAppointment ,Error : ", ex);
			result = 0;
		}
		return result;
	}

	public ArrayList searchFromDB() {
		cDCommon objDosearchFromDB = new cDCommon();
		return objDosearchFromDB.getCategoryFromDB();
	}

	public ArrayList getCountryDetails() {
		cDGetValues objDogetstateandcity = new cDGetValues();
		ArrayList countrylist = new ArrayList();
		countrylist = objDogetstateandcity.getCountryDB();
		return countrylist;
	}

	public ArrayList getStateDetails() {
		cDGetValues objDogetstateandcity = new cDGetValues();
		ArrayList statelist = new ArrayList();
		statelist = objDogetstateandcity.getStateDB();
		return statelist;
	}

	public ArrayList getCountryCommon() {
		cDGetValues objDogetstateandcity = new cDGetValues();
		ArrayList selectedcountry = new ArrayList();
		selectedcountry = objDogetstateandcity.getCountry();
		return selectedcountry;
	}

	public ArrayList getCountryForBu() {
		cDGetValues objDogetstateandcity = new cDGetValues();
		ArrayList selectedcountryByBo = new ArrayList();
		selectedcountryByBo = objDogetstateandcity.getCountryForBu();
		return selectedcountryByBo;
	}

	public ArrayList getStatesForBu() {
		cDGetValues objDogetstateandcity = new cDGetValues();
		ArrayList statesforbu = new ArrayList();
		statesforbu = objDogetstateandcity.getStatesForBu();
		return statesforbu;
	}

	public ArrayList getBusinessForBu() {
		cDGetValues objDogetstateandcity = new cDGetValues();
		ArrayList businessforbu = new ArrayList();
		businessforbu = objDogetstateandcity.getBusinessForBu();
		return businessforbu;
	}

	public ArrayList getCurrencies() {
		cDGetValues objDogetcurrency = new cDGetValues();
		ArrayList currencies = new ArrayList();
		currencies = objDogetcurrency.getCurrenciesDB();
		return currencies;
	}

	public int hasPermission(String permission, HttpServletRequest req) {
		if (permission != "") {

			HttpSession session;
			session = req.getSession();
			ArrayList functionnames = new ArrayList();
			functionnames = (ArrayList) session.getAttribute("functionname");
			session.getAttribute("logedroleid");
			for (int i = 0; i < functionnames.size(); i++) {
				if (functionnames.get(i).equals(permission)) {
					return 1;
				}
			}
			return 0;
		}
		return 0;
	}

	public String getCurrentTime() {
		String TIME_FORMAT_NOW = "H:mm:ss";
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(TIME_FORMAT_NOW);
		return sdf.format(cal.getTime());
	}

	public ArrayList getBusinessOfCategory(String categoryName) {
		cDCommon objBusiness = new cDCommon();
		ArrayList businessList = new ArrayList();
		businessList = objBusiness.getBusinessOfCategory(categoryName);
		return businessList;
	}

	public ArrayList getDays() {
		cDCommon objBusiness = new cDCommon();
		ArrayList Days = new ArrayList();
		Days = objBusiness.getDays();
		return Days;
	}

	public ArrayList searchFromDB(String searchWord, String countryid, String role_id, String user_id) {
		ArrayList search = new ArrayList();
		cDCommon objsearchBusiness = new cDCommon();
		search = objsearchBusiness.searchFromDB(searchWord, countryid, role_id, user_id);
		return search;
	}

	public String contryval(String contryid) {
		String c_val = "";
		cDCommon objsearchBusiness = new cDCommon();
		c_val = objsearchBusiness.contryvalDB(contryid);
		return c_val;
	}

	public String getRoleName(String RoleName) {
		cDCommon objBusiness = new cDCommon();
		String Role = "";
		Role = objBusiness.getRoleName(RoleName);
		return Role;

	}
	// Method to get city list by stateid
	/*
	 * public ArrayList getCityDetails(String stateId) { cDGetValues
	 * objDogetstateandcity =new cDGetValues(); ArrayList citylist = new
	 * ArrayList(); citylist = objDogetstateandcity.getCityDB(stateId); return
	 * citylist; }
	 */

	// Method to get category list
	public ArrayList getCategoryDetails() {
		cDGetValues objDogetstateandcity = new cDGetValues();
		ArrayList categorylist = new ArrayList();
		categorylist = objDogetstateandcity.getCategoryDB();
		return categorylist;
	}

	// Method to get country list
	public ArrayList getCountries() {
		cDGetValues objDogetcountrylist = new cDGetValues();
		ArrayList countryList = new ArrayList();
		countryList = objDogetcountrylist.getCountryList();
		return countryList;
	}

	// fuction to get the default locations
	public String getdefault_locations(String type) {
		cDGetValues objCommon = new cDGetValues();
		String defaul_location = objCommon.getdefault_locationsDB(type);
		return defaul_location;
	}

	public ArrayList getStates(String def_country) {
		cDGetValues objCommon = new cDGetValues();
		ArrayList States;
		States = objCommon.getStates(def_country);
		return States;
	}

	public ArrayList getCities(String def_state) {
		cDGetValues objCommon = new cDGetValues();
		ArrayList Cities;
		Cities = objCommon.getCities(def_state);

		return Cities;
	}

	// Method to get status list
	public ArrayList getstatusList() {
		cDGetValues objDogetstateandcity = new cDGetValues();
		ArrayList statuslist = new ArrayList();
		statuslist = objDogetstateandcity.getStatusList();
		return statuslist;
	}

	// Method To Convert Date Format to String Format Format Business Layer
	public String getDateFormatter(String date) {
		cDCommon obj = new cDCommon();
		String dateFormatter = "";
		dateFormatter = obj.getDateFormatterToDB(date);
		return dateFormatter;
	}

	// function to get school details
	public ArrayList getSchoolDetails(String schoolId) {
		cDCommon obj = new cDCommon();
		ArrayList schoolDetails = new ArrayList();
		schoolDetails = obj.fetchSchoolDetails(schoolId);
		return schoolDetails;
	}

	// function to get the roles list
	@SuppressWarnings("rawtypes")
	public ArrayList getInstituteDetails(String instituteId) {
		cDCommon obj = new cDCommon();
		ArrayList instituteDetails;
		instituteDetails = obj.fetchInstitutesDetails(instituteId);
		return instituteDetails;
	}
}
