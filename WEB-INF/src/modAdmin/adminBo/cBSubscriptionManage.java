package modAdmin.adminBo;

//import com.sun.java_cup.internal.parse_action;
import java.util.ArrayList;

import modAdmin.adminDo.cDAdminFunctions;
import modAdmin.adminVo.cVGlobalSettingByBusinessOwner;
import modAdmin.adminVo.cVSubscription;
import modLogger.cBLogger;

public class cBSubscriptionManage
{
	
	public ArrayList getSubscriptionList(String sub_name)
	{
		cDAdminFunctions objDoSubscription = new cDAdminFunctions();
		ArrayList SubcListarr = new ArrayList();
		SubcListarr = objDoSubscription.getSubscriptionList(sub_name);
		return SubcListarr;
	}
	
	public int insertSubscriptionDetails(cVSubscription objVoSubscription)
	{
		cDAdminFunctions objDoSubscription = new cDAdminFunctions();
		int insertResult=objDoSubscription.insertDetailsDB(objVoSubscription);
		if (insertResult == 1) {			//subscription name already exist
			insertResult=1;
		} 
		else if(insertResult == 2) {
			insertResult=2;				//subscription added successfully
		}
		else{
			insertResult=0;
		}
		return insertResult;
	}
	
	public int updateSubscriptionDetails(cVSubscription objVoSubscription)
	{
		cDAdminFunctions objDoSubscription = new cDAdminFunctions();
	int updateResult=objDoSubscription.updateDetailsDB(objVoSubscription);		
	if (updateResult == 1) {			//subscription name already exist
		updateResult=1;
	} 
	else if(updateResult == 2) {			//subscription updated successfully
		updateResult=2;
	}
	else if(updateResult == 3) {			//Subscription cannot be updated. its in use
		updateResult=3;
	}
	else{
		updateResult=0;
	}
	return updateResult;	
	
	}
	
	public ArrayList getSubscriptionDetails(int subscription_id)
	{
		cDAdminFunctions objDoSubscription = new cDAdminFunctions();
		ArrayList SubcDtlarr = new ArrayList();
		SubcDtlarr =objDoSubscription.getSubDetails(subscription_id) ;
		return SubcDtlarr;
	}
	
	public int deleteSubscription(cVSubscription objVoSubscription)
	{
		cDAdminFunctions objDoSubscription = new cDAdminFunctions();
		String[] temp;
		String delimeter = "_";
		temp = objVoSubscription.getSelected_ids().split(delimeter);
		for (int i = 1; i < temp.length; i++) {
			cBLogger.error("Did not get Subscription IDS" + temp[i]);
			if (objDoSubscription.deleteSubscriptionDB(temp[i]) == 3) {
				return 3;
			}
		}
		return 1;
	}
	public ArrayList getGlobalSettings(){
		cDAdminFunctions objDoGlobalSetting = new cDAdminFunctions();
		ArrayList GlobalSet = new ArrayList();
		GlobalSet=objDoGlobalSetting.getGlobalSettings();
		return GlobalSet;
	}
	
	public ArrayList getSettedCurrency(){
		cDAdminFunctions objDoGlobalSetting = new cDAdminFunctions();
		ArrayList currency = new ArrayList();
		currency=objDoGlobalSetting.getSettedCurrency() ;
		return currency;
	}
	
	public int updateGlobalSettings(cVSubscription objVoSubscription)
	{
		cDAdminFunctions objDoSubscription = new cDAdminFunctions();
		if (objDoSubscription.updateGlobalSettings(objVoSubscription) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
	public int updateGlobalSettingsByBo(cVGlobalSettingByBusinessOwner objVoGlobalSetting)
	{
		cDAdminFunctions objDoSubscription = new cDAdminFunctions();
		if (objDoSubscription.updateGlobalSettingsByBo(objVoGlobalSetting) == 1) {
			return 1;
		} else {
			return 0;
		} 
		
	}
	

}