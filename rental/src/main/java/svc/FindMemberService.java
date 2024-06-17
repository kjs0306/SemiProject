package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberVO;

public class FindMemberService {
	public boolean findMember(MemberVO member) {
		boolean joinSuccess = false;
		MemberDAO memberDAO = MemberDAO.getInstance();
		Connection con = getConnection();
		memberDAO.setConnection(con);
		int insertCount = memberDAO.findMember(member);
		if(insertCount > 0){
			joinSuccess = true;
		}
		else{
		}
		close(con);
		return joinSuccess;
	}
}
