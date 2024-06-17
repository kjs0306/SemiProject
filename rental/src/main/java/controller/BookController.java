package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BookCancelAction;
import action.BookDeleteAction;
import action.BookInsertAction;
import action.BookInsertNonDateAction;
import action.BookSelectAction;
import action.BookUpdateAction;
import action.MyBookAction;
import vo.ActionForward;

@WebServlet("*.bk")
public class BookController extends HttpServlet {
	static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;

		
		if(command.contains("/bookInsert.bk")) {
			action = new BookInsertAction();			
		}
		
		else if(command.contains("/bookUpdate.bk")) {
			action = new BookUpdateAction();
			
		}
		else if(command.contains("/bookSelect.bk")) {
			action = new BookSelectAction();
			
		}
		else if(command.contains("/bookCancel.bk")) {
			action = new BookCancelAction();
			
		}
		else if(command.contains("/bookDelete.bk")) {
			action = new BookDeleteAction();

		}
		else if(command.contains("/myBook.bk")) {
			action = new MyBookAction();
		}
		else if(command.contains("/bookInsertNonDate.bk")) {
			action = new BookInsertNonDateAction();
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
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}
}