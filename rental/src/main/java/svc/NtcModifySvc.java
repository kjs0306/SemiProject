package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import dao.NtcDAO;
import vo.NtcVo;

public class NtcModifySvc {

 public boolean updateArticle(HttpServletRequest request) throws Exception {
    boolean isWriteSuccess = false;
    Connection con = null;
    try {
        con = getConnection();
        NtcDAO nDAO = NtcDAO.getInstance();
        nDAO.setConnection(con); 
        
        request.setCharacterEncoding("utf-8");
        String NOTICENAME = request.getParameter("NOTICENAME");
        String NOTICETITLE = request.getParameter("NOTICETITLE");
        String NOTICECONTENT = request.getParameter("NOTICECONTENT");
        String NOTICENUM = request.getParameter("NOTICENUM");
        
        NtcVo ntcVo = new NtcVo();
        ntcVo.setNOTICENAME(NOTICENAME);
        ntcVo.setNOTICETITLE(NOTICETITLE);
        ntcVo.setNOTICECONTENT(NOTICECONTENT);
        ntcVo.setNOTICENUM(Integer.parseInt(NOTICENUM));
        
        int updateCount = nDAO.upDateArticle(ntcVo);

        if (updateCount > 0) { 
            commit(con);
            isWriteSuccess = true; 
        } else { 
            rollback(con);
        }
    } catch (Exception e) {
        rollback(con);
        throw new RuntimeException("upDateArticle Error: " + e.getMessage(), e);
    } finally {
        close(con); 
    }
    return isWriteSuccess;
}

}






























