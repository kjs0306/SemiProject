package svc;

import java.sql.Connection;
import dao.NtcDAO;
import vo.NtcVo;
import static db.JdbcUtil.*;

public class NtcDetailSvc {

	public NtcVo getArticle(int NOTICENUM) throws Exception{
		
		NtcVo article = null;
		Connection con = getConnection();
		NtcDAO ntcDAO = NtcDAO.getInstance();
		ntcDAO.setConnection(con);
		int updateCount = ntcDAO.updateReadCount(NOTICENUM);
		
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = ntcDAO.selectArticle(NOTICENUM);
		close(con);
		return article;
		
	}

}
