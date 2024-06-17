package svc;

import javax.servlet.http.HttpServletRequest;
import dao.NtcDAO;
import static db.JdbcUtil.*; // getConnection, close, commit, rollback 메소드를 사용하기 위해 추가

import java.sql.Connection;

import vo.NtcVo;

public class NtcWriteSvc {

    public boolean insertArticle(HttpServletRequest request) throws Exception {
        boolean isWriteSuccess = false;
        Connection con = null;
        try {
            con = getConnection();
            NtcDAO nDAO = NtcDAO.getInstance();
            nDAO.setConnection(con);
            
            request.setCharacterEncoding("utf-8");
            String NOTICENAME = "admin";
            String NOTICETITLE = request.getParameter("NOTICETITLE");
            String NOTICECONTENT = request.getParameter("NOTICECONTENT");

            NtcVo ntcVo = new NtcVo();
            ntcVo.setNOTICENAME(NOTICENAME);
            ntcVo.setNOTICETITLE(NOTICETITLE);
            ntcVo.setNOTICECONTENT(NOTICECONTENT);
            
            int insertCount = nDAO.insertArticle(ntcVo);

            if (insertCount > 0) { 
                commit(con);
                isWriteSuccess = true; 
            } else { 
                rollback(con); 
            }
        } catch (Exception e) {
            rollback(con);
            throw new RuntimeException("insertArticle Error: " + e.getMessage(), e);
        } finally {
            close(con);
        }
        return isWriteSuccess;
    }
}