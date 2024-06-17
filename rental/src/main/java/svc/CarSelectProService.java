package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONArray;

import dao.CarDAO;
import vo.CarVO;

public class CarSelectProService {

	public JSONArray selectCar(CarVO carvo) {
		Connection con = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		JSONArray jsonArray = new JSONArray();
		carDAO.setConnection(con);
		
		jsonArray = carDAO.selectCar(carvo);
		
		
		if(jsonArray == null || jsonArray.isEmpty()) {
	        System.out.println("검색 결과가 없습니다.");
	    }
		close(con);
		return jsonArray;
	}
	
}
