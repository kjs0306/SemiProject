package svc;

import vo.MemberVO;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.MemberDAO;

public class MemberLoginService {

	public boolean login(MemberVO member) {
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		boolean loginResult = false;
		String loginId = memberDAO.selectLoginId(member);
		if(loginId != null){
			loginResult = true;
		}
		close(con);
		return loginResult;
	}

}
