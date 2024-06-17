package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.LoginBookAction;
import vo.ActionForward;

@WebServlet("*.check")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        ActionForward forward = null;
        LoginBookAction action = null;

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("memberId") == null) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();

            out.println("<script type='text/javascript'>");
            out.println("alert('로그인이 필요한 서비스 입니다.');");
            out.println("window.location='" + request.getContextPath() + "/sub/loginhome.jsp';");
            out.println("</script>");

            return;
            
        } else {

                action = new LoginBookAction();
                try {
                    forward = action.execute(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                request.getRequestDispatcher(forward.getPath()).forward(request, response);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}