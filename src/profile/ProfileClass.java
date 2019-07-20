package profile;

import data.*;
import java.util.*;

public class ProfileClass {
	private DatabaseAccess dba;
	private Profile profile;
	
	public ProfileClass(String id) throws Exception {
		dba = DatabaseAccess.getInstance();
		List values = new ArrayList();
		List<Map> indexList;
		List<String> careers;
		String intro;
		Map index;
		String sql = new StringBuilder("SELECT ")
					.append(UserColumn.USERNAME).append(", ")
					.append(ProfileColumn.CAREER).append(", ") 
					.append(ProfileColumn.USER_IMAGE).append(", ")
					.append(UserColumn.EMAIL).append(", ")
					.append(UserColumn.BIRTHDAY).append(", ")
					.append(ProfileColumn.INTRO).append(" FROM ")
					.append(DBTable.PROFILE).append(",").append(DBTable.USER_MANAGEMENT).append(" WHERE ")
					.append(DBTable.PROFILE).append(".").append(ProfileColumn.ID).append("= ? AND ")
					.append(DBTable.USER_MANAGEMENT).append(".").append(UserColumn.ID).append("= ?").toString();
		//selectname, career, user_img,email, bday, intro FROM Profile,User_Management WHERE Profile.id = ? AND User_Management.id = ?
		values.add(id);
		values.add(id);
		indexList = dba.getData(sql, values);
		if(indexList.size() < 1) throw new Exception("맞는 유저가 없음");
		index = indexList.get(0);
		if(index.get(ProfileColumn.INTRO.toString()) == null) intro = "";
		else intro = index.get(ProfileColumn.INTRO.toString()).toString();
		if(index.get(ProfileColumn.CAREER.toString()) == null) careers = new ArrayList();
		else careers = Constants.splitComma(index.get(ProfileColumn.CAREER.toString()).toString());
		profile = new Profile(id, index.get(ProfileColumn.NAME.toString()).toString(),
						index.get(ProfileColumn.USER_IMAGE.toString()).toString(), index.get(ProfileColumn.EMAIL.toString()).toString(), 
						index.get(ProfileColumn.BIRTHDAY.toString()).toString(), intro, careers);
	}
	public Profile getProfile() {
		return this.profile;
	}
	public boolean updateProfile(Profile profile) {
		List<String> values = new ArrayList();
		String career = String.join(",",profile.getCareer());
		String sql = new StringBuilder("UPDATE ").append(DBTable.PROFILE).append(", ").append(DBTable.USER_MANAGEMENT).append(" SET ")
					.append(ProfileColumn.NAME).append("= ?,")
					.append(ProfileColumn.CAREER).append("= ?,")
					.append(ProfileColumn.USER_IMAGE).append("= ?,")
					.append(ProfileColumn.EMAIL).append("= ?,")
					.append(ProfileColumn.BIRTHDAY).append("= ?,")
					.append(ProfileColumn.INTRO).append("= ? WHERE ")
					.append(DBTable.PROFILE).append(".").append(ProfileColumn.ID).append("= ? AND ")
					.append(DBTable.USER_MANAGEMENT).append(".").append(UserColumn.ID).append("= ?").toString();

		values.add(profile.getName());
		values.add(career);
		values.add(profile.getUser_img());
		values.add(profile.getEmail());
		values.add(profile.getBday());
		values.add(profile.getIntro());
		values.add(profile.getId());
		values.add(profile.getId());
		return dba.setData(sql, values);
	}
}
