package svc;

import java.sql.Connection;

import static db.JdbcUtil.*;
import vo.CarVO;
import dao.CarDAO;

public class CarUpdateProService {


	public boolean updateCar(CarVO carvo) {
		boolean isCarUpdate = false;
		int updateChk;
		
		
		Connection con = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(con);
		
		updateChk = carDAO.updateCar(carvo);
			
		if(updateChk > 0){
			isCarUpdate=true;
		}
		close(con);
		return isCarUpdate;
	}
	
}