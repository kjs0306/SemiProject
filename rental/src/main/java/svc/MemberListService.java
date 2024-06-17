package svc;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import dao.MemberDAO;
import static db.JdbcUtil.*;

import vo.MemberVO;

public class MemberListService {
	public ArrayList<HashMap<String, Object>> getMemberList(String sql) {
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		ArrayList<HashMap<String, Object>> memberList = memberDAO.listMember(sql);
		close(con);
		return memberList;
	}

}
