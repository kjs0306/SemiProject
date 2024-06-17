package svc;

import java.sql.Connection;
import java.util.ArrayList;
import dao.BookDAO;
import static db.JdbcUtil.*; 
import vo.BookVO;

public class BookSelectService {

    public ArrayList<BookVO> getBookList(int bookNum) {
        Connection con = null;
        ArrayList<BookVO> bookList = null;
        try {
            con = getConnection(); 
            BookDAO bookDAO = BookDAO.getInstance(); 
            bookDAO.setConnection(con); 

          
            bookList = bookDAO.userSelectBook(bookNum);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(con);
        }
        return bookList;
    }
}