package post;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import data.Constants;
import data.DatabaseAccess;
import data.DBTable;
import data.PostColumn;
import data.UserColumn;

public class PostClass {
	private DatabaseAccess dba;

	public PostClass() {
		dba = DatabaseAccess.getInstance();
	}

	//占쌉쏙옙占쏙옙 占쏙옙 占쏙옙占�
	public boolean write(String title, String id, Date date, String category, String content, String post_img, int post_ipt) {
		List values = new ArrayList();
		String condition = new StringBuffer("insert into ")
				.append(DBTable.POST).append("(")
				.append(PostColumn.TITLE).append(",")
				.append(PostColumn.ID).append(",")
				.append(PostColumn.DATE).append(",")
				.append(PostColumn.CATEGORY).append(",")
				.append(PostColumn.CONTENT).append(",")
				.append(PostColumn.POST_IMG).append(",")
				.append(PostColumn.POST_IPT).append(") values(?,?,?,?,?,?,?)").toString();
		values.add(title);
		values.add(id);
		values.add(date);
		values.add(category);
		values.add(content);
		values.add(post_img);
		values.add(post_ipt);

		return dba.setData(condition, values);
	}
	
	public boolean modify(String title, String id, Date date, String category, String content, String post_img, int post_ipt, int post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("update ")
				.append(DBTable.POST).append(" set ")
				.append(PostColumn.TITLE).append(" = ").append("?, ")
				.append(PostColumn.ID).append(" = ").append("?, ")
				.append(PostColumn.DATE).append(" = ").append("?, ")
				.append(PostColumn.CATEGORY).append(" = ").append("?, ")
				.append(PostColumn.CONTENT).append(" = ").append("?, ")
				.append(PostColumn.POST_IMG).append(" = ").append("?, ")
				.append(PostColumn.POST_IPT).append(" = ").append("?")
				.append(" where ").append(PostColumn.POST_NUM).append(" = ").append(" ? ").toString();
		values.add(title);
		values.add(id);
		values.add(date);
		values.add(category);
		values.add(content);
		values.add(post_img);
		values.add(post_ipt);
		values.add(post_num);
		return dba.setData(condition, values);
	}

	//占쌉쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
	public List<Map> view(int post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" where ")
				.append(PostColumn.POST_NUM).append(" = ?").toString();
		values.add(post_num);
		return dba.getData(condition,values);
	}

	//占쌉쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
	public boolean delete(int post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("delete from ")
				.append(DBTable.POST).append(" where ")
				.append(PostColumn.POST_NUM).append(" = ?").toString();

		values.add(post_num);
		return dba.setData(condition, values);
	}

	//占쌉쏙옙占쏙옙 占쏙옙 占쏙옙占� -> 占쌜뱄옙호 占쏙옙占쏙옙
	public List<Map> postList(String LoginId) {
		List values = new ArrayList();
		values.add(LoginId);
		
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" where id = ?").append(" order by ").append(PostColumn.POST_NUM).append(" DESC").toString();
		return dba.getData(condition,values);
	}
	
	//占쏙옙占쏙옙 占쏙옙占�
	public List<Map> userList() {
		List values = new ArrayList();
		
		String condition = new StringBuffer("select id from ")
				.append(DBTable.USER_MANAGEMENT).toString();
		return dba.getData(condition,values);
	}
	
	public List<Map> getFavoriteList(String id) {
		List values = new ArrayList();
		
		values.add(id);
		String condition = new StringBuffer("select f_list from ")
				.append(DBTable.USER_MANAGEMENT).append(" where id = ?").toString();
		return dba.getData(condition,values);
	}
	
	

	//date占쏙옙 占쌀뤄옙占쏙옙占쏙옙 占쌨소듸옙 - 占싫억옙占쏙옙
	public List<Map> getDate(int Post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("select from_unixtime(unix_timestamp(")
				.append(Constants.DATE).append(", '%Y-%m-%d' ) FROM '")
				.append(DBTable.POST).toString();
		return dba.getData(condition,values);
	}
	
	public boolean addFavorite(String id, String writerId) {
		List values = new ArrayList();
		String s = new StringBuffer(",").append(writerId).toString();
		String condition = new StringBuffer("update ")
				.append(DBTable.USER_MANAGEMENT).append(" set ")
				.append(UserColumn.FAVORITEMEMBERS).append(" = CONCAT( ifnull(").append(UserColumn.FAVORITEMEMBERS).append(", '') , ? )")
				.append(" where ").append(UserColumn.ID).append(" = ").append(" ? ").toString();
		//UPDATE favorite SET like_list = CONCAT( like_list, ', 38' ) WHERE id = 'newlhh';
		//														?					?
		values.add(s);
		values.add(id);
		return dba.setData(condition, values);
	}
	
	public boolean unFavorite(String id, String writerId) {
		List values = new ArrayList();
		String s = new StringBuffer(",").append(writerId).toString();
		String condition = new StringBuffer("update ")
				.append(DBTable.USER_MANAGEMENT)
				.append(" set ").append(UserColumn.FAVORITEMEMBERS)
				.append(" = replace(").append(UserColumn.FAVORITEMEMBERS)
				.append(", ?, '') where ").append(UserColumn.ID).append(" = ").append(" ? ").toString();
		//UPDATE User_Management SET f_list = REPLACE(f_list, ?, '') WHERE id= ?;
		values.add(s);
		values.add(id);
		
		return dba.setData(condition, values);
	}
	public boolean hasFavoriteUser(String id, String writerId) {
		List values = new ArrayList();
		List<Map> list;
		List<String> f_list; 
		String condition = "select f_list from User_Management where id = ?";
		values.add(id);
		list = dba.getData(condition, values);
		if(list.size() > 0) {
			f_list = Constants.splitComma(list.get(0).get(UserColumn.FAVORITEMEMBERS.toString()).toString());
			if(f_list.contains(writerId)) return true;
			else return false;
		}
		return false;
	}
	
	public boolean hit(int post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("update ")
				.append(DBTable.POST).append(" set ")
				.append(PostColumn.POST_HIT).append(" = ").append(PostColumn.POST_HIT).append("+ 1 ")
				.append(" where ").append(PostColumn.POST_NUM).append(" = ?").toString();
		//UPDATE favorite SET like_list = CONCAT( like_list, ', 38' ) WHERE id = 'newlhh';
		//														?					?
		values.add(post_num);
		return dba.setData(condition, values);
	}
	
	public List<Map> getLikeList(int post_num) {
		List values = new ArrayList();
		
		values.add(post_num);
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" where post_num = ?").toString();
		return dba.getData(condition,values);
	}

	public boolean reco(String id, int post_num) {
		List values = new ArrayList();
		String s = new StringBuffer(",").append(id).toString();
		String condition = new StringBuffer("update ")
				.append(DBTable.POST).append(" set ")
				.append(PostColumn.POST_LIKE_USER).append(" = CONCAT( ifnull(").append(PostColumn.POST_LIKE_USER).append(", '') , ? )")
				.append(" where ").append(PostColumn.POST_NUM).append(" = ").append(" ? ").toString();
		//UPDATE post SET post_like_user = CONCAT( post_like_user, ',id' ) WHERE post_num = 'post_num';
		//														?					?
		values.add(s);
		values.add(post_num);
		
		return dba.setData(condition, values);
	}
	
	public boolean unreco(String id, int post_num) {
		List values = new ArrayList();
		String s = new StringBuffer(",").append(id).toString();
		String condition = new StringBuffer("update ")
				.append(DBTable.POST)
				.append(" set ").append(PostColumn.POST_LIKE_USER)
				.append(" = replace(").append(PostColumn.POST_LIKE_USER)
				.append(", ?, '') where ").append(PostColumn.POST_NUM).append(" = ").append(" ? ").toString();
		//UPDATE post SET post_like_user = REPLACE(post_like_user, ',babo', '') WHERE post_num=101;
		values.add(s);
		values.add(post_num);
		
		return dba.setData(condition, values);
	}
	
	public boolean like(int post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("update ")
				.append(DBTable.POST).append(" set ")
				.append(PostColumn.POST_LIKE).append(" = ").append(PostColumn.POST_LIKE).append("+ 1 ")
				.append(" where ").append(PostColumn.POST_NUM).append(" = ?").toString();

		values.add(post_num);
		return dba.setData(condition, values);
	}
	public boolean hasPost_like_user(String id, int post_num) {
		List values = new ArrayList();
		List<Map> list;
		List<String> post_like_userList; 
		String condition = "select post_like_user from Post where post_num = ?";
		values.add(post_num);
		list = dba.getData(condition, values);
		if(list.size() > 0) {
			post_like_userList = Constants.splitComma(list.get(0).get(PostColumn.POST_LIKE_USER.toString()).toString());
			if(post_like_userList.contains(id)) return true;
			else return false;
		}
		return false;
	}
	public boolean unlike(int post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("update ")
				.append(DBTable.POST).append(" set ")
				.append(PostColumn.POST_LIKE).append(" = ").append(PostColumn.POST_LIKE).append("- 1 ")
				.append(" where ").append(PostColumn.POST_NUM).append(" = ?").toString();

		values.add(post_num);
		return dba.setData(condition, values);
	}





}
