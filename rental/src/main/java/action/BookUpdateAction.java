package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BookUpdateService;
import vo.ActionForward;
import vo.BookVO;

public class BookUpdateAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	request.setCharacterEncoding("utf-8");
    	String bookNum = request.getParameter("bookNum");
        System.out.println(bookNum);
        String memberName = request.getParameter("memberName");
        String bookDate = request.getParameter("bookDate");
        String returnDate = request.getParameter("returnDate");

        BookVO book = new BookVO();
        book.setBookNum(bookNum);
        book.setMemberName(memberName);
        book.setBookDate(bookDate);
        book.setReturnDate(returnDate);

        BookUpdateService bookUpdateService = new BookUpdateService();
        boolean isUpdateSuccess = bookUpdateService.updateBook(book);

        ActionForward forward = null;

        if (!isUpdateSuccess) { 
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('예약 업데이트에 실패했습니다.');");
            out.println("history.back();");
            out.println("</script>");
        } else { 
        	
            forward = new ActionForward();
            forward.setPath("./adminDashBoard.jsp"); 
        }

        return forward;
    }
}