package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.*;
import vo.ActionForward;
import vo.MemberVO;
import dao.MemberDAO;

public class MemberReUpdateAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
	 	HttpSession session=request.getSession();
   		MemberVO member=new MemberVO(); 
   		
   		member.setMemberId(request.getParameter("memberId"));
   		member.setMemberAddress(request.getParameter("memberAddress"));
   		member.setMemberPassword(request.getParameter("memberPassword"));
   		member.setMemberBirth(request.getParameter("memberBirth"));
   		member.setMemberEmail(request.getParameter("memberEmail"));
   		member.setMemberPhone(request.getParameter("memberPhone"));
   		member.setMemberName(request.getParameter("memberName"));
   		
   		MemberReUpdateService memberReUpdateService = new MemberReUpdateService();
   		boolean idResult = memberReUpdateService.ReUpdate(member); 
   		ActionForward forward = null;
   		
   		if(idResult){ 
   		response.setContentType("text/html;charset=UTF-8");
   		PrintWriter out=response.getWriter();
   		out.println("<script>");
   		out.println("alert('회원정보가 변경 되었습니다.');");
   		out.println("location.href='mainpage.jsp';"); // 
   		out.println("</script>");
   	}
   		else{
   			response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('회원정보 변경 실패');");
	   		out.println("location.href='updateCheck.jsp';"); // 
	   		out.println("</script>");
   		}
   		return forward;
	}
}


