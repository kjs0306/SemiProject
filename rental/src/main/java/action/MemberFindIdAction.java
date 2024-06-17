package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import svc.MemberFindIdService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberFindIdAction implements Action{
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
       throws Exception{
       HttpSession session=request.getSession();
          MemberVO member=new MemberVO();
            
            member.setMemberName(request.getParameter("name"));
            member.setMemberEmail(request.getParameter("email"));
            MemberFindIdService memberfindservice = new MemberFindIdService();
            boolean result = memberfindservice.findId(member);
            String id = member.getMemberId();
            
            JSONObject jObject = new JSONObject(); 
            jObject.put("id", id);
            
            response.setContentType("application/x-json; charset=utf-8");
            response.getWriter().print(jObject);
            
            ActionForward forward = null;
            
            return forward;
    }
}