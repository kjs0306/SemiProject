package action;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import svc.MemberListService;
import vo.ActionForward;

public class MemberGetMyinfoAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String id = request.getParameter("MemberId");
		String sql = "select * from member where memberId = '" + id + "'";
		MemberListService MemberSelectService = new MemberListService();
		ArrayList<HashMap<String, Object>> memberList = MemberSelectService.getMemberList(sql);
		HashMap<String, Object> member = memberList.get(0);
		JSONObject jObject = new JSONObject();
		jObject.put("member", member);

		response.setContentType("application/x-json; charset=utf-8");

		response.getWriter().print(jObject);
		return forward;

	}
}
