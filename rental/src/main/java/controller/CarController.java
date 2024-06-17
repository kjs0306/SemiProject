package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CarDeleteProAction;
import action.CarInsertProAction;
import action.CarSearchAction;
import action.CarSelectProAction;
import action.CarUpdateProAction;
import vo.ActionForward;

/**
 * Servlet implementation class CarController
 */
@WebServlet("*.bo")
public class CarController extends HttpServlet {

   protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      String RequestURI=request.getRequestURI();
      String contextPath=request.getContextPath();
      String command=RequestURI.substring(contextPath.length());
      ActionForward forward=null;
      Action action=null;
      
      if (command.contains("/carInsertForm.bo")) {
         action = new CarInsertProAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
      }  else if (command.contains("/carUpdateForm.bo")) {
         action = new CarUpdateProAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
      } else if (command.contains("/carDeleteForm.bo")) {
         action = new CarDeleteProAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
      } else if (command.contains("/carSelectForm.bo")) {
         action = new CarSelectProAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
      } else if (command.contains("/carsearch.bo")) {
         action = new CarSearchAction();
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
            RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
            dispatcher.forward(request, response);
         }

      }
      
   }
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}