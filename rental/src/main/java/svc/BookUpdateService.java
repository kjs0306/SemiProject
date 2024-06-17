package svc;

import java.sql.Connection;
import dao.BookDAO;
import static db.JdbcUtil.*;
import vo.BookVO;

public class BookUpdateService {

    public boolean updateBook(BookVO book) {
        Connection con = getConnection();
        BookDAO bookDAO = BookDAO.getInstance();
        bookDAO.setConnection(con);
        
        boolean isUpdateSuccess = false;
        
        try {
            int count = bookDAO.bookUpdate(con, book);

            if (count > 0) { 
                commit(con);
                isUpdateSuccess = true;
            } else {
                rollback(con);
            }
        } catch (Exception e) {
            rollback(con);
            e.printStackTrace();
        } finally {
            close(con);
        }
        
        return isUpdateSuccess;
    }
}