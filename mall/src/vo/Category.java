package vo;

public class Category {
	private int categoryId;		// 카테고리 고유번호
	private String categoryName;	// 카테고리 이름
	private String categoryPic;	// 카테고리 이미지
	private String categoryCk;	// 추천 카테고리
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryPic() {
		return categoryPic;
	}
	public void setCategoryPic(String categoryPic) {
		this.categoryPic = categoryPic;
	}
	public String getCategoryCk() {
		return categoryCk;
	}
	public void setCategoryCk(String categoryCk) {
		this.categoryCk = categoryCk;
	}
	
	
}
