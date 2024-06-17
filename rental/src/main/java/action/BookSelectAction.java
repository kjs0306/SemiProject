package action;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.BookDAO;
import svc.BookListService;
import vo.ActionForward;
import vo.BookVO;

public class BookSelectAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = null;
      
      BookDAO bdao = BookDAO.getInstance();
      Connection con = getConnection();
      bdao.setConnection(con);
      BookVO bvo = new BookVO();
      
      String sql = "SELECT * FROM BOOK WHERE 1=1";
      String bookNum = request.getParameter("bookNum");
      String memberName = request.getParameter("memberName");
      String bookStatus = request.getParameter("bookStatus");
      
      bvo.setBookNum(bookNum);
      bvo.setMemberName(memberName);
      
      if(!bookNum.equals("")) {
         sql = sql + " and bookNum='"+bookNum+"'";
      }
      
      if(!memberName.equals("")) {
         sql = sql + " and memberName ='"+memberName+"'";
         
      }
      
      if (bookStatus.equals("booking")) {
         sql = sql + " and bookStatus = '예약중'";
      }else if (bookStatus.equals("cancel")) {
         sql = sql + " and bookStatus = '예약취소'";
      }
       
      BookListService BookSelectService = new BookListService();      
      ArrayList<HashMap<String, Object>> bookList = BookSelectService.getBookList(sql);
      
      JSONObject jObject = new JSONObject();
      jObject.put("bookList", bookList);
   
      response.setContentType("application/x-json; charset=utf-8");
      response.getWriter().print(jObject);
      
      return forward;
    }
}