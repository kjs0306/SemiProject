package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberUpdateAdminService;
import vo.ActionForward;

public class MemberUpdateAdminAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		
		String id = request.getParameter("memberId");
		String password = request.getParameter("memberPassword");
		String address =  "우편번호: " + request.getParameter("zipCode") + " 주소: "+request.getParameter("memberAddress2")
        + " 상세주소: " +request.getParameter("memberAddress3")+ " 참고항목 :" + request.getParameter("memberAddress4");
		String phone = request.getParameter("memberPhone");
		String email = request.getParameter("memberEmail1")+"@"+request.getParameter("memberEmail2_1");
		
		String sql = "update member set";
		if(!password.equals("")) {
			if(sql.endsWith("'")) {
				sql += ", ";
			}
			sql= sql + " memberPassword ='" +password+"'";
		}
		if(!address.equals("")) {
			if(sql.endsWith("'")) {
				sql += ", ";
			}
			sql= sql + " memberAddress ='" +address+"'";
		}
		if(!phone.equals("")) {
			if(sql.endsWith("'")) {
				sql += ", ";
			}
			sql= sql + " memberPhone='" +phone+"'";
		}
		if(!email.equals("")) {
			if(sql.endsWith("'")) {
				sql += ", ";
			}
			sql= sql + " memberEmail ='" +email+"'";
			
		}
		sql = sql + " where memberId='" +id+"'";
		MemberUpdateAdminService memberUpdateService = new MemberUpdateAdminService();
   		boolean idResult = memberUpdateService.Update(sql); 
   		ActionForward forward = new ActionForward();
   		forward.setPath("./adminDashBoard.jsp");
   		
		return forward;
		
	}
	
}
