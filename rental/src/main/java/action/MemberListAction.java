// memverListAction.java
package action;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import svc.MemberListService;
import vo.ActionForward;
import vo.MemberVO;

public class MemberListAction implements Action {
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String sql = "select * from member where MemberStatus != 'admin'";
      ActionForward forward = null;
      
      String status = request.getParameter("status").trim();
      String condition = request.getParameter("searchCondition").trim();
      String conditionValue = request.getParameter("conditionValue").trim();
      
      if(condition.equals("memberId")) {
         sql = sql + "and memberId='"+conditionValue+"'";
      }else if(condition.equals("memberName")) {
         sql = sql + "and memberName='"+conditionValue+"'";   
      }
      
      if(status.equals("all")) {
         
      }else if (status.equals("active")) {
            sql = sql + "and memberStatus = 'active'";

      }else if (status.equals("inactive")) {
         sql = sql + "and memberStatus = 'inactive'";
      }
      
      MemberListService MemberSelectService = new MemberListService();
      ArrayList<HashMap<String, Object>> memberList = MemberSelectService.getMemberList(sql);
      
      JSONObject jObject = new JSONObject();
      jObject.put("memberList", memberList);
    
      response.setContentType("application/x-json; charset=utf-8");
      
      response.getWriter().print(jObject);
      return forward;
   }
}