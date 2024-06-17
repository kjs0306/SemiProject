package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberVO;

public class MemberUpdateService {
	public boolean update(MemberVO member) { 
		
		Connection con = getConnection(); 
		MemberDAO memberDAO = MemberDAO.getInstance(); 
		memberDAO.setConnection(con); 
		boolean loginResult = false;
		String loginId = memberDAO.Update(member);
		if(loginId != null){
			loginResult = true;
		}
		
		close(con);
		return loginResult;
	}
}
