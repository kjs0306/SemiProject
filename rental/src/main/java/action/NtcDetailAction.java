package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.NtcDetailSvc;
import vo.ActionForward;
import vo.NtcVo;

 public class NtcDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		int NOTICENUM=Integer.parseInt(request.getParameter("NOTICENUM"));
		NtcDetailSvc ntcDetailSvc = new NtcDetailSvc();
		NtcVo article = ntcDetailSvc.getArticle(NOTICENUM);
		
		ActionForward forward = new ActionForward();
	   	request.setAttribute("article", article);
	   	
	   	String view = request.getParameter("view");
	   	
	   	if(view == null || view.equals("")) {
	   		forward.setPath("/dashBoardInclude/dashannoboardedit.jsp");
	   	}else if(view.equals("ok")) {
	   		forward.setPath("/dashBoardInclude/dashannoboardread.jsp");
	   	}else if(view.equals("mainok")) {
	   		forward.setPath("/board/annoBoardRead.jsp");
	   	}else if(view.equals("userok")) {
		 forward.setPath("/board/annoBoardEdit.jsp");
	 }
//	   	forward = null;
   		return forward;

	 }
	 
}