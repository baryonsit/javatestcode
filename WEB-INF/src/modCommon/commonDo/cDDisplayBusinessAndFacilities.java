package modCommon.commonDo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modLogger.cBLogger;

public class cDDisplayBusinessAndFacilities {
	ResultSet r3 = null, r1 = null, r2 = null;
	ArrayList arr = new ArrayList();
	ArrayList arrSub = new ArrayList();
	ArrayList arrBusiness = new ArrayList();
	int i, j;
	/*
	 * int x = 0; Connection dbcon = null; boolean connected = true ;
	 * cDConnectionManager objConnMan;
	 */

	cDConnectionManager objConnMan = null;
	indexConnection dbcon = null;
	boolean connected = false;

	public cDDisplayBusinessAndFacilities() {
		try {
			objConnMan = cDConnectionManager.getObjHandle();
			dbcon = objConnMan.openConnection();

			if (dbcon.con == null)
				connected = false;
			else
				connected = true;
		} catch (Exception e) {
			cBLogger.error(
					"class Name : cDDisplayBusinessAndFacilities, Constructor : cDDisplayBusinessAndFacilities, Error :  ",
					e);
		}
	}

	// Display list of all business in a category
	public ArrayList getBusinessByCategory(String c_id, String c_name, String searchkey) {
		if (connected) {
			ResultSet rs = null;
			try {
				String query = "";
				String query1 = "";
				if (searchkey.equals("ALL")) {
					query = "select a.business_id,a.business_name,a.business_desc from tb_business a JOIN tb_users AS b ON a.user_id = b.user_id where b.status='Active' and a.business_categoty='"
							+ c_name + "' ";
					rs = dbcon.con.createStatement().executeQuery(query);
					while (rs.next()) {
						arr.add(rs.getInt(1));
						arr.add(rs.getString(2));
						arr.add(rs.getString(3));
					}
				} else {
					query1 = "select a.business_id,a.business_name,a.business_desc,a.owner_name from tb_business a JOIN tb_users AS b ON a.user_id = b.user_id where b.status='Active' and a.business_categoty='"
							+ c_name + "'and a.business_city='" + searchkey + "'";

					rs = dbcon.con.createStatement().executeQuery(query1);
					while (rs.next()) {
						arr.add(rs.getInt(1));
						arr.add(rs.getString(2));
						arr.add(rs.getString(3));
						arr.add(rs.getString(4));
					}
				}
			}

			catch (SQLException sqlex) {
				cBLogger.error(
						"class Name : cDDisplayBusinessAndFacilities, Function : getBusinessByCategory , Error :  ",
						sqlex);

			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error(
							"class Name : cDDisplayBusinessAndFacilities, Function : getBusinessByCategory , Error :  ",
							e);
				}
				objConnMan.closeConnection(dbcon.index);

			}
		}
		return arr;
	}

	public ArrayList getBusinessDetails(String business_id) {
		if (connected) {
			ResultSet rs = null;

			try {
				String query = "select b.business_id,b.business_name,b.owner_name,b.business_add1,b.business_add2,b.business_city,b.business_zipcode,s.state_name,c.country_name,b.business_desc from tb_business b,tb_states s,tb_country c where b.business_id='"
						+ business_id + "' and b.business_stateid=s.state_id and b.business_countryid=c.country_id ";
				rs = dbcon.con.createStatement().executeQuery(query);

				while (rs.next()) {
					arr.add(rs.getInt(1)); // business_id
					arr.add(rs.getString(2)); // business_name
					arr.add(rs.getString(3)); // business owner_name
					arr.add(rs.getString(4)); // business add1
					arr.add(rs.getString(5)); // business add2
					arr.add(rs.getString(6)); // business city
					arr.add(rs.getString(7)); // business zipcode
					arr.add(rs.getString(8)); // business state
					arr.add(rs.getString(9)); // business country
					arr.add(rs.getString(10)); // business desc
				}
			} catch (SQLException sqlex) {
				cBLogger.error("class Name : cDDisplayBusinessAndFacilities, Function : getBusinessDetails , Error :  ",
						sqlex);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error(
							"class Name : cDDisplayBusinessAndFacilities, Function : getBusinessDetails , Error :  ",
							e);
				}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return arr;
	}

	public ArrayList getFacilitiesByBusiness(String c_id,int schoolId) {
		if (connected) {
			ResultSet rs = null;
			try {

				String query = "select facility_id,facility_name,facility_desc,facility_type,facility_status from tb_facilities  where facilitycategory='"
						+ c_id + "' and facility_status='1' and school_id="+schoolId+"";
				rs = dbcon.con.createStatement().executeQuery(query);

				while (rs.next()) {
					arr.add(rs.getInt(1)); // facility_id
					arr.add(rs.getString(2)); // facility_name
					arr.add(rs.getString(3)); // facility_desc
					arr.add(rs.getString(4)); // facility_type
					arr.add(rs.getString(5)); // facility_type
				}

			} catch (SQLException sqlex) {
				cBLogger.error(
						"class Name : cDDisplayBusinessAndFacilities, Function : getFacilitiesByBusiness , Error :  ",
						sqlex);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error(
							"class Name : cDDisplayBusinessAndFacilities, Function : getFacilitiesByBusiness , Error :  ",
							e);
				}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return arr;
	}

	public ArrayList getFacilitiesDetails(String fac_id) {
		if (connected) {
			ResultSet rs = null;
			try {
				String query = "select f.facility_id,f.facility_business_id,f.facility_name,f.facility_type,f.facility_from_date,f.facility_to_date,f.facility_from_time,f.facility_to_time,f.time_per_slot,f.members_per_slot,f.facility_desc,f.facility_add1,f.facility_add2,f.facility_city,f.facility_zip_code,f.facility_contact_no,f.facility_status,f.facility_state_id,s.state_name,f.facility_country_id,c.country_name from tb_facilities f,tb_states s,tb_country c where f.facility_id='"
						+ fac_id + "' and f.facility_state_id=s.state_id and f.facility_country_id=c.country_id ";
				rs = dbcon.con.createStatement().executeQuery(query);
				try {
					while (rs.next()) {
						arr.add(rs.getInt(1)); // facility_id
						arr.add(rs.getInt(2)); // facility_business_id
						arr.add(rs.getString(3)); // facility_name
						arr.add(rs.getString(4)); // facility_type
						arr.add(rs.getString(5)); // facility_from_date
						arr.add(rs.getString(6)); // facility_to_date
						arr.add(rs.getString(7)); // facility_from_time
						arr.add(rs.getString(8)); // facility_to_time
						arr.add(rs.getString(9)); // time_per_slot
						arr.add(rs.getInt(10)); // members_per_slot
						arr.add(rs.getString(11)); // facility desc
						arr.add(rs.getString(12)); // facility add1
						arr.add(rs.getString(13)); // facility add2
						arr.add(rs.getString(14)); // facility_cityfacility_zip_code
						arr.add(rs.getString(15)); // facility_zip_code
						arr.add(rs.getString(16)); // facility_contact_no
						arr.add(rs.getString(17)); // facility_status
						arr.add(rs.getInt(18)); // facility_state_id
						arr.add(rs.getString(19)); // facility_state_name
						arr.add(rs.getInt(20)); // facility_country_id
						arr.add(rs.getString(21)); // facility_country_name
					}
				} catch (Exception e) {
					cBLogger.error("No Such Facility.");
				}

			} catch (SQLException sqlex) {
				cBLogger.error(
						"class Name : cDDisplayBusinessAndFacilities, Function : getFacilitiesDetails , Error :  ",
						sqlex);
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					cBLogger.error(
							"class Name : cDDisplayBusinessAndFacilities, Function : getFacilitiesDetails , Error :  ",
							e);
				}
				objConnMan.closeConnection(dbcon.index);
			}

		}
		return arr;
	}
}