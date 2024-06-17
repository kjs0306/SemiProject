package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberLoginService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberLoginAction implements Action{
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
       throws Exception{
       
          HttpSession session=request.getSession();
          MemberVO member=new MemberVO();
            member.setMemberId(request.getParameter("memberId"));
            member.setMemberPassword(request.getParameter("memberPassword"));
            
            
            MemberLoginService memberLoginService = new MemberLoginService();
            boolean loginResult = memberLoginService.login(member);
            ActionForward forward = null;
            if(loginResult){ 
                forward = new ActionForward();
               session.setAttribute("memberPhone", member.getMemberPhone());
               session.setAttribute("memberId", request.getParameter("memberId"));
               session.setAttribute("memberName", member.getMemberName());
               session.setAttribute("memberStatus", member.getMemberStatus());
               forward.setRedirect(true);
               forward.setPath("./index.jsp");
            }
            else{
              response.setContentType("text/html;charset=UTF-8");
              PrintWriter out=response.getWriter();
              out.println("<script>");
              out.println("alert('아이디 또는 비밀번호가 다릅니다.');");
              out.println("location.href='./sub/loginhome.jsp';");
              out.println("</script>");
            }
            return forward;
   }
}