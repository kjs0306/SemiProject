package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BookDAO;
import vo.BookVO;
import vo.CarVO;
import vo.MemberVO;

public class BookInsertService {

    
    public boolean insertBook(BookVO bookVo, CarVO carVo, MemberVO memberVo) {
        boolean isInsertSuccess = false;
        Connection con = null;
        try {
            con = getConnection(); 
            BookDAO bookDAO = BookDAO.getInstance();
            bookDAO.setConnection(con);
            
            int insertCount = bookDAO.insertBook(bookVo, carVo, memberVo);

            if (insertCount > 0) { 
                commit(con);
                isInsertSuccess = true; 
            } else { 
                rollback(con); 
            }
        } catch (Exception e) {
        }finally {
            close(con); 
        }
		return isInsertSuccess;
        }
}

  