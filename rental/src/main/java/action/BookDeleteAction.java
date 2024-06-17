package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BookDeleteService;
import vo.ActionForward;
import vo.BookVO;

public class BookDeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String bookNum = request.getParameter("bookNum");

        BookVO book = new BookVO();
        book.setBookNum(bookNum);

        BookDeleteService bookDeleteService = new BookDeleteService();
        boolean isDeleteSuccess = bookDeleteService.deleteBook(book);

        ActionForward forward = null ;

        if (isDeleteSuccess) {
        	forward = new ActionForward();
            forward.setRedirect(true);
            forward.setPath("./adminDashBoard.jsp");
        } else {
        	PrintWriter out = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('예약 삭제 실패');");
            out.println("history.back();");
            out.println("</script>");
        }
        return forward;
    }
}