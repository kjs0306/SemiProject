package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberUpdateService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberUpdateAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
	 	HttpSession session=request.getSession();
   		MemberVO member=new MemberVO(); 
   		
   		member.setMemberId((String) session.getAttribute("id"));
   		member.setMemberPassword(request.getParameter("memberPassword"));
   		
   		MemberUpdateService memberUpdateService = new MemberUpdateService(); 
   		boolean idResult = memberUpdateService.update(member); 
   		ActionForward forward = null;
   		
   		if(idResult){ 
   		response.setContentType("text/html;charset=UTF-8");
   		PrintWriter out=response.getWriter();
   		
   		session.setAttribute("MemberNo", member.getMemberNo());
   	    session.setAttribute("MemberId", member.getMemberId());
   	    session.setAttribute("MemberName", member.getMemberName());
   	    session.setAttribute("MemberBirth", member.getMemberBirth());
   	    session.setAttribute("MemberEmail", member.getMemberEmail());
   	    session.setAttribute("MemberPhone", member.getMemberPhone());
   	    session.setAttribute("MemberAddress", member.getMemberAddress());
   	    session.setAttribute("MemberAge", member.getMemberAge());
   	    session.setAttribute("MemberGender", member.getMemberGender());
   	    
   	    out.println("<script>");
   	    out.println("alert('정보가 확인되었습니다.');"); 
   	    out.println("location.href='update.jsp';"); 
   	    out.println("</script>");
   		}
   		else{
   			response.setContentType("text/html;charset=UTF-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('비밀번호가 다릅니다.');");
	   		out.println("location.href='updateCheck.jsp';");
	   		out.println("</script>");
   		}
   		return forward;
	}
}