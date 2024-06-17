package action;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberOutService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberOutAction implements Action{
 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
    throws Exception{
    
       HttpSession session = request.getSession();
       
       MemberVO member=new MemberVO();
       String id=(String) session.getAttribute("memberId");
       member.setMemberId(id);
         
       MemberOutService memberoutservice = new MemberOutService();
       boolean loginOut = memberoutservice.out(member);
         ActionForward forward = null;
         if(loginOut){ 
        	    response.setContentType("text/html;charset=UTF-8");
        	    PrintWriter out = response.getWriter();
        	    session.invalidate(); // 세션 무효화

        	    // 페이지 리다이렉트를 위한 ActionForward 객체 사용
        	    forward = new ActionForward();
        	    forward.setRedirect(true); // 리다이렉트 방식으로 설정
        	    forward.setPath(request.getContextPath() + "/index.jsp"); // 이동할 경로 설정
        	}
        	else{
        	    response.setContentType("text/html;charset=UTF-8");
        	    PrintWriter out = response.getWriter();
        	    out.println("<script>");
        	    out.println("alert('회원탈퇴 처리가 실패했습니다.');");
        	    out.println("location.href='" + request.getContextPath() + "/index.jsp';");
        	    out.println("</script>");
        	}
         
//         	if(forward != null){
//        	    if(forward.isRedirect()){
//        	        response.sendRedirect(forward.getPath());
//        	    } else {
//        	        RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
//        	        dispatcher.forward(request, response);
//        	    }
//        	}
        	return forward;
 }
}
