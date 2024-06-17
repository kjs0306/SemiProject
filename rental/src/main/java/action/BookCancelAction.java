package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BookCancelService;
import vo.ActionForward;
import vo.BookVO;

import java.io.PrintWriter;

public class BookCancelAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String bookNum = request.getParameter("bookNum");
        
        BookVO book = new BookVO();
        book.setBookNum(bookNum);
        
        BookCancelService bookCancelService = new BookCancelService();
        boolean isCancelSuccess = bookCancelService.cancelBook(book);
        
        ActionForward forward = null;
        
        if (isCancelSuccess) {
            forward = new ActionForward();
            forward.setRedirect(true); 
            
            PrintWriter out = response.getWriter();            
            forward.setPath("mypage.jsp?tab=mybook;"); 
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('예약 취소 실패');");
            out.println("history.back();");
            out.println("</script>");
        }
        return forward;
    }
}