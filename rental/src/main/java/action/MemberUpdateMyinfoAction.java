package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.*;
import vo.ActionForward;
import vo.MemberVO;
import dao.MemberDAO;

public class MemberUpdateMyinfoAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		ActionForward forward = null;
	 	HttpSession session=request.getSession();
   		MemberVO member=new MemberVO(); 
   		member.setMemberId(request.getParameter("memberId"));
   		
   		String address = "우편번호: " + request.getParameter("zipCode") + " 주소: "+request.getParameter("memberAddress2")
        + " 상세주소: " +request.getParameter("memberAddress3")+ " 참고항목 :" + request.getParameter("memberAddress4");
   		
   		member.setMemberAddress(address);
//   		member.setMemberPassword(request.getParameter("memberPassword"));
   		String email = request.getParameter("memberEmail1") + "@" + request.getParameter("memberEmail2");
   		
   		member.setMemberEmail(email);
   		member.setMemberPhone(request.getParameter("memberPhone"));
   		MemberUpdateMyinfoService memberReUpdateService = new MemberUpdateMyinfoService();
   		boolean idResult = memberReUpdateService.Update(member); 
   		
   		if(idResult){ 
   		response.setContentType("text/html;charset=UTF-8");
   		PrintWriter out=response.getWriter();
   		out.println("<script>");
   		out.println("alert('회원정보가 변경 되었습니다.');");
   		out.println("location.href='mypage.jsp';"); // 
   		out.println("</script>");
   	}
   		else{
   			response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('회원정보 변경 실패');");
	   		out.println("location.href='updateCheck.jsp';"); 
	   		out.println("</script>");
   		}
   		return forward;
	}
}


