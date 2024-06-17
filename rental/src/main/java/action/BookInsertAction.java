package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BookInsertService;
import vo.ActionForward;
import vo.BookVO;
import vo.CarVO;
import vo.MemberVO;

public class BookInsertAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		ActionForward forward = null;
		boolean isInsertSuccess = false;
		BookVO bookVo = new BookVO();
		CarVO carVo = new CarVO();
		MemberVO memberVo = new MemberVO();
		
		
		String id = (String) session.getAttribute("memberId");
		String carName = (String) session.getAttribute("carName");
        String name = (String) session.getAttribute("memberName");
        String date = (String) session.getAttribute("bookDate");
        String returnDate = (String) session.getAttribute("returnDate");
        
        bookVo.setBookDate(date);
        bookVo.setReturnDate(returnDate);
		memberVo.setMemberId(id);
		memberVo.setMemberName(name);
		carVo.setCarName(carName);
		
		
        BookInsertService bookInsertService = new BookInsertService();
		boolean loginResult = bookInsertService.insertBook(bookVo, carVo, memberVo);
		
		if(loginResult) {
			response.setContentType("text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();
            out.println("<script>");
            out.println("alert('예약이 정상적으로 처리되었습니다.');");
            out.println("location.href='index.jsp';");
            out.println("</script>");
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('예약을 실패했습니다.');");
			out.println("location.href='index.jsp';");
			out.println("</script>");
		}
		return forward;
	}

}