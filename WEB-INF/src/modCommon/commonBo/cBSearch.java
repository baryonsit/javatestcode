package modCommon.commonBo;

import java.util.ArrayList;
import java.util.Hashtable;

import org.apache.commons.lang.StringUtils;

import modCommon.commonDo.cDSearch;
import modCommon.commonVo.cVSearch;

public class cBSearch {

	
	public Hashtable<String,ArrayList<String>> SearchBusiness(cVSearch objVoSearch) {
	
		String search_key=objVoSearch.getSearchkey();
	//	String country_id=objVoSearch.getCountryid();
		String state_id=objVoSearch.getStateid();
		String category_name=objVoSearch.getCategoryname();	
		
		
		String string1 = "";
	
		
		if(StringUtils.isNotEmpty(search_key)){
			string1 = "business_name like '%" + search_key + "%'";
		}
		/*if(!country_id.equalsIgnoreCase("select_country")){
			if(string1==""){
				string1 = "business_countryid='" + country_id + "'";

			}
			else{
				string1=string1+" and business_countryid='" + country_id + "'";
			}
		}*/
		if(!state_id .equalsIgnoreCase("select_state")){
			if(StringUtils.isEmpty(string1)){
				string1 = "business_stateid= '" + state_id + "'";
			}
			else{
				string1=string1+" and business_stateid= '" + state_id + "'";
			}
		}
		if(!category_name.equalsIgnoreCase("select_category")){
			if(StringUtils.isEmpty(string1)){
				string1 = "business_categoty = '" + category_name + "'";
			}
			else{
				string1=string1+" and business_categoty = '" + category_name + "'";
			}
		}
		cDSearch objDosearch = new cDSearch();
		Hashtable<String, ArrayList<String>> arr;		
		arr = objDosearch.SearchBuisness(string1);	
		return arr;
	}
	public ArrayList getStateListForAdvanceSearch(String country_id) {
		ArrayList stateListForsearch = new ArrayList();
		cDSearch objSearch = new cDSearch();
		stateListForsearch = objSearch.getStateListForSearchDB(country_id);
		return stateListForsearch;
	}
	
	
	
}