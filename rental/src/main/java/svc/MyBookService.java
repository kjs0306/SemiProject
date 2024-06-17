package svc;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import dao.BookDAO;
import static db.JdbcUtil.*;
import vo.BookVO;

public class MyBookService {
    public ArrayList<HashMap<String, Object>> getMyBooks(String Id) {
        Connection con = null;
        ArrayList<HashMap<String, Object>> Mybook = new ArrayList<>();

        try {
            con = getConnection(); 
            BookDAO bookDAO = BookDAO.getInstance(); 
            bookDAO.setConnection(con); 

            Mybook = bookDAO.myBook(Id); 
        } finally {
            close(con); 
        }

        return Mybook;
    }
}