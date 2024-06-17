package svc;

import java.sql.Connection;
import dao.BookDAO;
import static db.JdbcUtil.*;
import vo.BookVO;

public class LoginBookService {

    // 예약 조회 메서드 호출
    public boolean LoginBook(BookVO book, String memberId) {
        boolean success = false; 

        Connection con = null;
        try {
            con = getConnection();
            BookDAO bookDAO = BookDAO.getInstance(); 
            bookDAO.setConnection(con);

            success = bookDAO.LoginBook(book, memberId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(con);
        }

        return success; 
    }
}