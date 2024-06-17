package svc;

import vo.MemberVO;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.MemberDAO;

public class MemberJoinService {
	public boolean joinMember(MemberVO member) {
		boolean joinSuccess = false;
		MemberDAO memberDAO = MemberDAO.getInstance();
		Connection con = getConnection();
		memberDAO.setConnection(con);
		int insertCount = memberDAO.joinMember(member);
		if(insertCount > 0){
			joinSuccess = true;
			commit(con);
		}
		else{
			rollback(con);
		}
		close(con);
		return joinSuccess;
	}
}
