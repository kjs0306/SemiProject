package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.CarDeleteProService;
import vo.ActionForward;

public class CarDeleteProAction implements Action{

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = null;
		boolean isDelete = false;
		
		
		CarDeleteProService cardeleteproservice = new CarDeleteProService();
		
		/*
		 * String 미입력시 null값, int 미입력시 0값으로 고정적으로 넣어줌.
		 */
		
		String carNumberParamString = request.getParameter("CAR_NUMBER");
		int carNumberParam = 0; 

		if (carNumberParamString != null && !carNumberParamString.isEmpty()) {
		    carNumberParam = Integer.parseInt(carNumberParamString);
		}
		
		isDelete = cardeleteproservice.deleteCar(carNumberParam);

		if(!isDelete){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패');");
			out.println("history.back()");
			out.println("</script>");
		} else {
			//forward = new ActionForward();
			//forward.setRedirect(true);
			//forward.setPath
		}
		
		return forward;
	}
	
	
}
