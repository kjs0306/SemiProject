package svc;

import java.sql.Connection;
import dao.BookDAO;
import static db.JdbcUtil.*;
import vo.BookVO;

public class BookCancelService {

    
    public boolean cancelBook(BookVO book) {
        boolean isCancelSuccess = false; 
        Connection con = null;
        try {
            con = getConnection();
            BookDAO bookDAO = BookDAO.getInstance(); 
            bookDAO.setConnection(con); 

            int updateCount = bookDAO.cancel(book); 

            if (updateCount > 0) { 
                commit(con);
                isCancelSuccess = true;
            } else { 
                rollback(con);
            }
        } catch (Exception e) {
            rollback(con); 
            e.printStackTrace();
        } finally {
            close(con); 
        }
        return isCancelSuccess; 
    }
}