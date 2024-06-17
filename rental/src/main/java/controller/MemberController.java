package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.*;
import vo.ActionForward;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doProcess(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      String RequestURI = request.getRequestURI();
      String contextPath = request.getContextPath();
      String command = RequestURI.substring(contextPath.length());
      ActionForward forward = null;
      Action action = null;
      
      if (command.contains("/memberJoin.member")) {
         action = new MemberJoinAction();
      } else if (command.contains("/memberList.member")) {
         action = new MemberListAction();
      } else if (command.contains("/MemberUpdate.member")) {
         action = new MemberUpdateAction();
      } else if (command.contains("/MemberReUpdate.member")) {
         action = new MemberReUpdateAction();
      } else if (command.contains("/memberLoginAction.member")) {
         action = new MemberLoginAction();
      }else if(command.contains("/findid.member")) {
         action = new MemberFindIdAction();
      }else if(command.contains("/repassword.member")) {
         action = new MemberRePasswordAction();
         
      } 
      else if (command.contains("/FindMemberAction.member")) {
         action = new FindMemberAction();
      }
      else if (command.contains("/MemberResetPassAction.member")) {
         action = new MemberResetPassAction();
      }
      else if (command.contains("/MemberUpdateAdminAction.member")) {
    	  action = new MemberUpdateAdminAction();
      }
      else if (command.contains("/MemberGetMyinfoAction.member")) {
    	  action = new MemberGetMyinfoAction();
      }
      else if (command.contains("/MemberUpdateMyinfoAction.member")) {
    	  action = new MemberUpdateMyinfoAction();
      }
      
      else if (command.contains("/MemberOutAction.member")) {
    	  action = new MemberOutAction();
      }
      
      try {
         forward = action.execute(request, response);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      if (forward != null) {
         if (forward.isRedirect()) {
            response.sendRedirect(forward.getPath());
         } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
            dispatcher.forward(request, response);
         }
      }
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doProcess(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      doProcess(request, response);
   }

}