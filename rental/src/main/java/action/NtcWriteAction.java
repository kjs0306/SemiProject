package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import svc.NtcWriteSvc;
import vo.ActionForward;

public class NtcWriteAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = null;

        NtcWriteSvc ntcWriteSvc = new NtcWriteSvc();
        boolean isWriteSuccess = ntcWriteSvc.insertArticle(request);

        if (!isWriteSuccess) {
            
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('등록 실패');");
            out.println("history.back();");
            out.println("</script>");
        } else {
        	JSONObject job = new JSONObject();
			job.put("msg", "ok");
			response.setContentType("application/x-json;charset=UTF-8");
			response.getWriter().print(job);
        }
        return forward;
    }
}