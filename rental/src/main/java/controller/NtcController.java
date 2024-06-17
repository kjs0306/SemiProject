package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.NtcDeleteAction;
import action.NtcDetailAction;
import action.NtcListAction;
import action.NtcModifyAction;
import action.NtcWriteAction;
import vo.ActionForward;

@WebServlet("*.no")
public class NtcController extends javax.servlet.http.HttpServlet {
   protected void doProcess (HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.setCharacterEncoding("UTF-8");
      String RequestURI = request.getRequestURI();
      String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
      String num = request.getParameter("NOTICENUM");
      ActionForward forward = null;
      Action action = null;

      if (command.equals("/ntcWriteForm.no")) {
         try {
            RequestDispatcher rd = request.getRequestDispatcher("/dashBoardInclude/dashannoboardwrite.jsp");
            rd.forward(request,response);
         } catch (Exception e) {
            e.printStackTrace();
         }

      } else if (command.equals("/ntcWrite.no")) {
         action = new NtcWriteAction();
         try {
            action.execute(request, response);
            
         } catch (Exception e) {
            e.printStackTrace();
         }

      }else if (command.equals("/ntcView.no")) {
         action = new NtcDetailAction();
         try {
            forward = action.execute(request, response);
	        RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
	        rd.forward(request,response);
         } catch (Exception e) {
            e.printStackTrace();
         }

      } else if (command.equals("/ntcList.no")) {
         action = new NtcListAction();
         try {
            action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }

      } else if (command.equals("/ntcModify.no")) {
         
         action = new NtcModifyAction();
         try {
            action.execute(request, response);
            
         } catch (Exception e) {
            e.printStackTrace();
         }
      } else if (command.contains("/ntcDelete.no")) {
         action = new NtcDeleteAction();
         try {
			forward = action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
			rd.forward(request,response);
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }

   protected void doPost (HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doProcess(request,response);
   }

   protected void doGet (HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doProcess(request,response);
   }
}