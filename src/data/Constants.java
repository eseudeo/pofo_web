package data;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Constants {
	public static String JDBC_DRIVER  = "com.mysql.cj.jdbc.Driver";
	public static String DB_NAME = "pofo";
	public static String DB_HOSTNAME = "db-11su3.pub-cdb.ntruss.com";
	public static String DB_PORT = "12345";
	public static String DB_URL = "jdbc:mysql://"+ DB_HOSTNAME +":" + DB_PORT + "/" + DB_NAME + "?serverTimezone=UTC";
	public static String DB_USER = "user";
	public static String DB_PASSWORD = "tkdydwk1*";
	public static String SERVER_URL = "106.10.34.86";
	public static String SERVER_PORT = "8011";
	public static String SERVER_USER = "BigMugari";
	public static String SERVER_PASSWORD = "eotjd0588@";
	public static String CURRENTUSER = "currentUser";
	public static String JSP_MAINPAGE = "jsp_main_form.jsp";
	public static String DATE = "date";
	public static String JSP_FINDID_FORM = "jsp_findid_form.jsp";
	public static String JSP_FINDPW_FORM = "jsp_findpw_form.jsp";
	public static String JSP_SIGNIN_SUCCESS = "jsp_signIn_success.jsp";
	public static String JSP_SIGNIN_FORM = "jsp_signIn_form.jsp";
	public static String JSP_SIGNUP_FORM = "jsp_signUp_form.jsp";
	public static String JSP_RECOMMENDED_CATEGORY = "jsp_reco_publication_category";
	public static String REDIRECTCAUSE = "redirectCause";
	public static String CATEGORY = "selected";
	
	
	public static List<String> splitComma(String original) {
		
		String[] members = original.split(",");
		return new ArrayList(Arrays.asList(members));
	}
}
