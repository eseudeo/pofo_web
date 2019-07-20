package data;

public enum ProfileColumn {
	ID,NAME,USER_IMAGE,EMAIL,BIRTHDAY,INTRO,CAREER;
	@Override
	public String toString() {
		switch(this) {
			case ID :
				return "id";
			case NAME :
				return "name";
			case USER_IMAGE :
				return "user_img";
			case EMAIL :
				return "email";
			case BIRTHDAY :
				return "bday";
			case INTRO :
				return "intro";
			case CAREER :
				return "career";
			default :
				return null;
		}
	}
}
