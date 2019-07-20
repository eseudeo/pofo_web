package search;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import data.DBTable;
import data.DatabaseAccess;

public class SearchClass {
	private DatabaseAccess dba;

	public SearchClass() {
		dba = DatabaseAccess.getInstance();
	}
	
	public List<Map> searchTitle(String title) {
		List values = new ArrayList();
		
		String s = new StringBuffer("%").append(title).append("%").toString();
		values.add(s);
		
		//select * from post where title like ? 
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" where title like ?").toString();
		return dba.getData(condition,values);
	}
	
	public List<Map> searchDate(String date) {
		List values = new ArrayList();
		values.add(date);
		
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" where date = ?").toString();
		return dba.getData(condition,values);
	}
	
	public List<Map> searchWriter(String writer) {
		List values = new ArrayList();
		values.add(writer);
		
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" where id = ?").toString();
		return dba.getData(condition,values);
	}
	
	public List<Map> searchCategory(String category) {
		List values = new ArrayList();
		values.add(category);
		
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" where category = ?").toString();
		return dba.getData(condition,values);
	}
	
	public List<Map> searchTotal(String searchValue) {
		List values = new ArrayList();
		
		String s = new StringBuffer("%").append(searchValue).append("%").toString();
		values.add(s);
		values.add(searchValue);
		
		
		//select * from post where title like ? 
		//  or date like ? 
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" where title like ? or id = ?").toString();
		return dba.getData(condition,values);
	}
}
