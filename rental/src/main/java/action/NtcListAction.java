package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import svc.NtcListSvc;
import vo.ActionForward;

public class NtcListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		JSONArray articleList = new JSONArray();
		
		String ntcSearch = request.getParameter("ntcSearch");
		String searchValue = request.getParameter("searchValue");
	
		String sql = "select * from notice where 1=1";
		
		if (!(searchValue ==null || searchValue.equals(""))){
			if(ntcSearch.equals("none")) {
				
			}else if(ntcSearch.equals("noticenum")) {
				sql = sql + " and noticenum='"+ searchValue+"'";
			}else if(ntcSearch.equals("noticetitle")) {
				sql = sql + " and noticetitle='"+ searchValue+"'";
				
			}else if(ntcSearch.equals("noticename")) {
				sql = sql + " and noticename='"+ searchValue+"'";
				
			}
		}
		NtcListSvc ntclistSvc = new NtcListSvc();
		articleList = ntclistSvc. getArticleConditionedList(sql);

		JSONObject jObject = new JSONObject();
	      jObject.put("articleList", articleList);
	    
	      response.setContentType("application/x-json; charset=utf-8");
	      
	      response.getWriter().print(jObject);

		ActionForward forward = null;

		return forward;

	}

}