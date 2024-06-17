package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginBookService;
import vo.ActionForward;
import vo.BookVO;

public class LoginBookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Action 클래스 접근");
    	String bookNum = request.getParameter("bookNum");
    	HttpSession session = request.getSession();
    	String memberId = (String)session.getAttribute("memberId");
    	
        BookVO book = new BookVO();
        book.setBookNum(bookNum);
        
        LoginBookService LB = new LoginBookService();
        boolean isLoginSuccess = LB.LoginBook(book, memberId);
        
        ActionForward forward = null;
        
        if (isLoginSuccess) {
            forward = new ActionForward();
            forward.setRedirect(true); 
            
            forward.setPath("mypage/mypage.jsp?tab=mybook");
            
        } else {
            
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('해당 번호로 예약된 정보가 없습니다.');");
            out.println("history.back();");
            out.println("</script>");
            out.close(); 
            return null; 
        }
        return forward;
	}

}