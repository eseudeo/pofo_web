package publications;

import java.util.*;

import data.DatabaseAccess;
import data.PostColumn;

public class RecommendedPublication {
	DatabaseAccess dba;
	public RecommendedPublication() {
		dba = DatabaseAccess.getInstance();
	}
	public List<Map> getPublications(String category, int indexNum) {
		List values = new ArrayList();
		String condition = new StringBuilder("select * from ")
				.append(data.DBTable.POST).append(" where ")
				.append(PostColumn.CATEGORY).append(" = ?").toString();
		values.add(category);
		return dba.getData(condition,values).subList(0, indexNum);
	}
}
