package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import svc.MemberResetPassService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberResetPassAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = new MemberVO();
		
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberEmail(request.getParameter("memberEmail"));
		member.setMemberRePassword(request.getParameter("memberPassword"));
		
		
		MemberResetPassService memberResetPassService = new MemberResetPassService();
		boolean result = memberResetPassService.resetPass(member);
   		ActionForward forward = null;
   		
   		JSONObject jObject = new JSONObject();
        jObject.put("result", result);
        
        response.setContentType("application/x-json; charset=utf-8");
        response.getWriter().print(jObject);
		return forward;

	}

}