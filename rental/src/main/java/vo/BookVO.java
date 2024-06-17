package vo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class BookVO {
	
	private String bookNum;
    private int bookMember;
    private int carNumber;
    private String carName;
    private String memberName;
    private String today; 
    private String bookDate;
    private String returnDate;
    private String bookStatus;
    private String returnStatus;
	public String getBookNum() {
		return bookNum;
	}
	public void setBookNum(String bookNum) {
		this.bookNum = bookNum;
	}
	public int getBookMember() {
		return bookMember;
	}
	public void setBookMember(int bookMember) {
		this.bookMember = bookMember;
	}
	public int getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(int carNumber) {
		this.carNumber = carNumber;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getBookDate() {
		return bookDate;
	}
	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getBookStatus() {
		return bookStatus;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}
	public String getReturnStatus() {
		return returnStatus;
	}
	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}
    
    
	
    
	
}