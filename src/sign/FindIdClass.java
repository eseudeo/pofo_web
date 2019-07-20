package sign;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import data.DBTable;
import data.DatabaseAccess;
import data.PostColumn;
import data.User;

public class FindIdClass {
	   private DatabaseAccess dba;
	   
	   public FindIdClass() {
	      dba = DatabaseAccess.getInstance();
	   }
	   
	   public List<Map> findId(String name, String email) {
	      List values = new ArrayList();
	      String condition = new StringBuffer("select id from ")
	            .append(DBTable.USER_MANAGEMENT).append(" where name = ? and email = ?").toString();
	      values.add(name);
	      values.add(email);
	      return dba.getData(condition, values);
	   }
	   
	   public List<Map> findPw(String id, String name, String email) {
	       List values = new ArrayList();
	       String condition = new StringBuffer("select pw from ")
	             .append(DBTable.USER_MANAGEMENT).append(" where id =? and name = ? and email = ?").toString();
	       values.add(id);
	       values.add(name);
	       values.add(email);
	       return dba.getData(condition, values);
	    }
	}