package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import svc.FindMemberService;
import vo.ActionForward;
import vo.MemberVO;

public class FindMemberAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = new MemberVO();
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberEmail(request.getParameter("memberEmail"));
		System.out.println("==비밀번호찾기폼의 데이터 확인==");
		System.out.println("아이디 :"+member.getMemberId());
		System.out.println("이메일 :"+member.getMemberEmail());
		
		FindMemberService findMemberService = new FindMemberService();
		boolean result = findMemberService.findMember(member);
   		ActionForward forward = null;
	
   		JSONObject jObject = new JSONObject();
   		jObject.put("result", result);
   		jObject.put("memberId", member.getMemberId());
   		jObject.put("memberEmail", member.getMemberEmail());
   		
   		response.setContentType("application/x-json; charset=utf-8");
   		response.getWriter().print(jObject);
   		
		return forward;
	}

}
