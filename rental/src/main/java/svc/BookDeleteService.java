package svc;
import java.sql.Connection;
import dao.BookDAO;
import static db.JdbcUtil.*;
import vo.BookVO;
public class BookDeleteService {
	
    public boolean deleteBook(BookVO book) {
        boolean isDeleteSuccess = false; 
        Connection con = null;
        try {
            con = getConnection();
            BookDAO bookDAO = BookDAO.getInstance(); 
            bookDAO.setConnection(con); 

            int updateCount = bookDAO.Delete(book); 

            if (updateCount > 0) { 
                commit(con);
                isDeleteSuccess = true;
            } else { 
                rollback(con);
            }
        } catch (Exception e) {
            rollback(con); 
            e.printStackTrace();
        } finally {
            close(con); 
        }
        return isDeleteSuccess; 
    }
}


