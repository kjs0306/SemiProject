package svc;

import vo.MemberVO;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.MemberDAO;

public class MemberOutService {

	public boolean out(MemberVO member) {
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		boolean loginResult = false;
		int cnt = memberDAO.memberOut(member);
		if(cnt > 0){
			loginResult = true;
			commit(con);
		}
		close(con);
		return loginResult;
	}

}
