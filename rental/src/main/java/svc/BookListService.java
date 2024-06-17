package svc;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import dao.BookDAO;
import static db.JdbcUtil.*;

import vo.BookVO;

public class BookListService {
	public ArrayList<HashMap<String, Object>> getBookList(String sql) {
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		ArrayList<HashMap<String, Object>> bookList = bookDAO.bookList(sql);
		close(con);
		return bookList;
	}

}
