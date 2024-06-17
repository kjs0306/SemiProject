package dao;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import org.json.simple.JSONArray;

import vo.BookVO;
import vo.CarVO;

public class CarDAO {

	PreparedStatement pstmt;
	Connection con;
	private static CarDAO carDAO;

	// getInstance() 이외의 객체생성 차단
	private CarDAO() {
	}

	// svc의 클래스들은 모두 getInstance()로 접근해야함
	public static CarDAO getInstance() {
		if (carDAO == null) {
			carDAO = new CarDAO();
		}
		return carDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	/*
	 * [차량정보 추가기능] 관리자가 입력한 내용을 db에 담음
	 */
	public int insertCar(CarVO car) {
		String sql = "INSERT INTO CAR VALUES (?,?,?,?,?,?,?,?,?,?)";
		int insertCount = 0;
	

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, car.getCarNumber());
			pstmt.setString(2, car.getCarName());
			pstmt.setString(3, car.getCarCompany());
			pstmt.setInt(4, car.getCarYear());
			pstmt.setInt(5, car.getCarSeater());
			pstmt.setString(6, car.getCarType());
			pstmt.setInt(7, car.getCarInsuranceage());
			pstmt.setString(8, car.getCarFuel());
			pstmt.setInt(9, car.getCarPrice());
			pstmt.setString(10, car.getCarStatus());

			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("에러: " + ex);
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return insertCount;
	}

	/*
	 * [수정기능] 고유키인 CARNUMBER를 기준. 나머지 값들을 입력값들로 관리자가 갱신함.
	 */
	public int updateCar(CarVO carvo) {

		int chk = 0;
		String sql = "UPDATE CAR SET CARNAME = ?, CARCOMPANY = ?, CARYEAR = ?, CARSEATER = ?, CARTYPE = ?, CARINSURANCEAGE = ?, CARFUEL = ?, CARPRICE = ?, CARSTATUS = ? WHERE CARNUMBER = ?";

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, carvo.getCarName());
			pstmt.setString(2, carvo.getCarCompany());
			pstmt.setInt(3, carvo.getCarYear());
			pstmt.setInt(4, carvo.getCarSeater());
			pstmt.setString(5, carvo.getCarType());
			pstmt.setInt(6, carvo.getCarInsuranceage());
			pstmt.setString(7, carvo.getCarFuel());
			pstmt.setInt(8, carvo.getCarPrice());
			pstmt.setString(9, carvo.getCarStatus());
			pstmt.setInt(10, carvo.getCarNumber());

			chk = pstmt.executeUpdate();

			if (chk <= 0) {
				System.out.println("데이터 갱신 실패");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return chk;
	}

	
	/*
	 * [검색기능] 테이블 컬럼을 모두 채우지 않아도 검색됨 관리자, 사용자 모두 이용하는 기능
	 */
	@SuppressWarnings("null")
	public JSONArray selectCar(CarVO carvo) {
		Statement stmt = null;
		ResultSet rs = null;
		JSONArray jsonArray = new JSONArray();

		/*
		 * 사용자 입력이 부분적으로 제공되어도 검색될수 있게끔 갱신되는 쿼리문 예를들어 사용자가 번호, 연식만 입력하고 나머지를 비워두어도 사용자가
		 * 작성한 부분들만 "AND 조건=?" 식으로 연결되어 select문을 완성하고 그 sql문으로 select
		 * 
		 */

		String sql = "SELECT * FROM CAR WHERE 1 = 1";

		int carNumber = carvo.getCarNumber();
		String carName = carvo.getCarName();
		String carCompany = carvo.getCarCompany();
		int carYear = carvo.getCarYear();
		int carSeater = carvo.getCarSeater();
		String carType = carvo.getCarType();
		int carInsuranceage = carvo.getCarInsuranceage();
		String carFuel = carvo.getCarFuel();
		int carPrice = carvo.getCarPrice();
		String carStatus = carvo.getCarStatus();
		boolean carLowPrice = carvo.isCarLowPrice();
		

		if (carNumber != 0) {
			sql += " AND CARNUMBER =" + carNumber;
		}
		if (carName != null) {
			sql += " AND CARNAME =\'" + carName + "\'";
		}
		if (carCompany != null) {
			sql += " AND CARCOMPANY =\'" + carCompany + "\'";
		}
		if (carYear != 0) {
			sql += " AND CARYEAR <=" + carYear;
		}
		if (carSeater != 0) {
			sql += " AND CARSEATER <=" + carSeater;
		}
		if (carType != null) {
			sql += " AND CARTYPE =\'" + carType + "\'";
		}
		if (carInsuranceage != 0) {
			sql += " AND CARINSURANCEAGE <=" + carInsuranceage;
		}
		if (carFuel != null) {
			sql += " AND CARFUEL =\'" + carFuel + "\'";
		}
		if (carPrice != 0) {
			sql += " AND CARPRICE <=" + carPrice;
		}

		if (carStatus == null || carStatus.equals("전체")) {
			sql += " AND 1=1";
		} else {
			sql += " AND CARSTATUS =\'" + carStatus + "\'";
		}
		
		if (carLowPrice) {
			sql += " ORDER BY CARPRICE";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
	            // 각 행의 데이터를 Map에 저장
	            HashMap<String, Object> map = new HashMap<>();
	            map.put("CAR_NUMBER", rs.getInt(1));
	            map.put("CAR_NAME", rs.getString(2));
	            map.put("CAR_COMPANY", rs.getString(3));
	            map.put("CAR_YEAR", rs.getInt(4));
	            map.put("CAR_SEATER", rs.getInt(5));
	            map.put("CAR_TYPE", rs.getString(6));
	            map.put("CAR_INSURANCEAGE", rs.getInt(7));
	            map.put("CAR_FUEL", rs.getString(8));
	            map.put("CAR_PRICE", rs.getInt(9));
	            map.put("CAR_STATUS", rs.getString(10));

	            jsonArray.add(map);
	        }

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jsonArray;
	}

	/*
	 * [차량정보 삭제기능] PRIMARY KEY인 CARNUMBER의 입력을 받는다는 기준으로 작성
	 * 
	 */
	public int deleteCar(int carNum) {
		int chk = 0;
		
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM CAR WHERE CARNUMBER = ?";

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, carNum);

			chk = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return chk;
	}
	
	@SuppressWarnings("null")
	   public JSONArray carsearch(CarVO carvo, BookVO bookvo) {
	      Connection con = getConnection();
	      Statement stmt = null;
	      ResultSet rs = null;
	      JSONArray jsonArray = new JSONArray();
	      
	      String sql = "SELECT * FROM CAR left join book on car.carnumber = book.carnumber where 1=1 ";

	      int carNumber = carvo.getCarNumber();
	      String carName = carvo.getCarName();
	      String carCompany = carvo.getCarCompany();
	      int carYear = carvo.getCarYear();
	      int carSeater = carvo.getCarSeater();
	      String carType = carvo.getCarType();
	      int carInsuranceage = carvo.getCarInsuranceage();
	      String carFuel = carvo.getCarFuel();
	      int carPrice = carvo.getCarPrice();
	      String carStatus = carvo.getCarStatus();
	      
	      
	      String bookDate = bookvo.getBookDate();
	      String returnDate = bookvo.getReturnDate();

	      if (carNumber != 0) {
	         sql += " AND CARNUMBER =" + carNumber;
	      }
	   
	      if (carName != null) {
	         sql += " AND CARNAME =\'" + carName + "\'";
	      }
	      if (carCompany != null) {
	         sql += " AND CARCOMPANY =\'" + carCompany + "\'";
	      }
	      if (carYear != 0) {
	         sql += " AND CARYEAR <=" + carYear;
	      }
	      if (carSeater != 0) {
	         sql += " AND CARSEATER <=" + carSeater;
	      }
	      if (carType != null) {
	         sql += " AND CARTYPE =\'" + carType + "\'";
	      }
	      if (carInsuranceage != 0) {
	         sql += " AND CARINSURANCEAGE <=" + carInsuranceage;
	      }
	      if (carFuel != null) {
	         sql += " AND CARFUEL =\'" + carFuel + "\'";
	      }
	      if (carPrice != 0) {
	         sql += " AND CARPRICE <=" + carPrice;
	      }

	      if (carStatus == null || carStatus.equals("전체")) {
	         sql += " AND 1=1";
	      } else {
	         sql += " AND CARSTATUS =\'" + carStatus + "\'";
	      }
	      	      
	      if(bookDate != null && returnDate != null) {
	    	    sql += "AND car.CARNUMBER NOT IN (SELECT CARNUMBER FROM BOOK WHERE (BOOKDATE <= TO_DATE('"+returnDate+"') AND RETURNDATE >= TO_DATE('"+bookDate+"')))";
	      }
	      
	      try {
	         stmt = con.createStatement();
	         rs = stmt.executeQuery(sql);

	         while (rs.next()) {
	               // 각 행의 데이터를 Map에 저장
	               HashMap<String, Object> map = new HashMap<>();
	               map.put("CAR_NUMBER", rs.getInt(1));
	               map.put("CAR_NAME", rs.getString(2));
	               map.put("CAR_COMPANY", rs.getString(3));
	               map.put("CAR_YEAR", rs.getInt(4));
	               map.put("CAR_SEATER", rs.getInt(5));
	               map.put("CAR_TYPE", rs.getString(6));
	               map.put("CAR_INSURANCEAGE", rs.getInt(7));
	               map.put("CAR_FUEL", rs.getString(8));
	               map.put("CAR_PRICE", rs.getInt(9));
	               map.put("CAR_STATUS", rs.getString(10));

	               jsonArray.add(map);
	           }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            stmt.close();
	            con.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return jsonArray;
	   }	

}
