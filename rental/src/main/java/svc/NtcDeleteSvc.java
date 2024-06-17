package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.NtcDAO;
import vo.NtcVo;

public class NtcDeleteSvc {
    
    public boolean deleteArticle(int noticenum) throws Exception {
        boolean isDeleteSuccess = false;
        Connection con = null;
        try {
            con = getConnection(); 
            NtcDAO ntcDAO = NtcDAO.getInstance();
            ntcDAO.setConnection(con);
            int deleteCount = ntcDAO.deleteArticle(noticenum);

            if (deleteCount > 0) {
                commit(con); 
                isDeleteSuccess = true;
            } else {
                rollback(con);
            }
        } catch(Exception e) {
            rollback(con);
            throw new Exception("공지사항 삭제 중 오류 발생", e);
        } finally {
            close(con);
        }
        return isDeleteSuccess;
    }
}