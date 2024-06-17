package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.CarDAO;
import vo.CarVO;

public class CarInsertProService {

	public boolean insertCar(CarVO carvo) {
		boolean isCarInsert = false;
		int insertChk;
		
		Connection con = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(con);
		
		insertChk = carDAO.insertCar(carvo);
				
		if(insertChk > 0){
			isCarInsert=true;
		}
		close(con);
		
		return isCarInsert;
	}
	
}
