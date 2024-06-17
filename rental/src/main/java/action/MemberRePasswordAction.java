package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberRePasswordService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberRePasswordAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       
	 	HttpSession session=request.getSession();
	 	
		MemberVO member=new MemberVO();
	 	
		member.setMemberPassword(request.getParameter("password"));
		member.setMemberRePassword(request.getParameter("repassword"));
		member.setMemberId((String)session.getAttribute("memberId"));
   		
   		MemberRePasswordService memberrepasswordservice = new MemberRePasswordService();
   		boolean loginResult = memberrepasswordservice.Repassword(member);
   		ActionForward forward = null;
   		
   		if(loginResult){ 
   			response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out=response.getWriter();
   			out.println("<script>");
   			out.println("alert('비밀번호 변경이 되었습니다.');");
   			out.println("location.href='mypage.jsp';");
   			out.println("</script>");
   		}
   		else{
   			response.setContentType("text/html;charset=UTF-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('현재 비밀번호가 다릅니다.');");
	   		out.println("location.href='mypage.jsp';");
	   		out.println("</script>");
   		}
   		return forward;
    }
}