package data;

public enum Category {
	POLITICS,ECONOMY,SOCIETY,EDUCATION;
	
	@Override
	public String toString() {
		switch(this) {
			case POLITICS :
				return "정치";
			case ECONOMY :
				return "경제";
			case SOCIETY :
				return "사회";
			case EDUCATION :
				return "교육";
			default :
				return null;
		}
	}
}