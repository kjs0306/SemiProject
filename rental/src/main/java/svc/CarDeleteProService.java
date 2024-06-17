package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.CarDAO;

public class CarDeleteProService {
	
	
	public boolean deleteCar(int carNum) {
		boolean isCarDelete = false;
		int deleteChk;
		
		Connection con = getConnection();
		CarDAO carDAO = CarDAO.getInstance();
		carDAO.setConnection(con);
		
		deleteChk = carDAO.deleteCar(carNum);
				
		if(deleteChk > 0){
			commit(con);
			isCarDelete=true;
		}
		else{
			rollback(con);
		}
		close(con);
		return isCarDelete;
	}

}
