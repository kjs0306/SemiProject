package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import org.json.simple.JSONArray;

import dao.CarDAO;
import vo.BookVO;
import vo.CarVO;

public class CarSearchService {

	public JSONArray carsearch(CarVO carvo, BookVO bookvo) {
		Connection con = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(con);
		JSONArray jsonArray = new JSONArray();
		
		
		jsonArray = carDAO.carsearch(carvo, bookvo);
		System.out.println("jsonArray" + jsonArray);
		if(jsonArray == null || jsonArray.isEmpty()) {
	    }
		close(con);
		return jsonArray;
	}
	
}
