package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.NtcDeleteSvc;
import vo.ActionForward;

public class NtcDeleteAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = null;
        int noticenum = Integer.parseInt(request.getParameter("NOTICENUM"));
        System.out.println(noticenum);
        
        NtcDeleteSvc ntcDeleteSvc = new NtcDeleteSvc();
        boolean isDeleteSuccess = ntcDeleteSvc.deleteArticle(noticenum);

        if (!isDeleteSuccess) { // 삭제 실패시
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('삭제 실패');");
            out.println("history.back();");
            out.println("</script>");
        } else { // 삭제 성공시
            forward = new ActionForward();
            forward.setRedirect(true);
            forward.setPath("dashBoardInclude/announceboardmng.jsp");
        }
        return forward;
    }
}