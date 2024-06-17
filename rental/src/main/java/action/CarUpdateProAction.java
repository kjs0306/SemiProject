package action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import svc.CarUpdateProService;
import vo.ActionForward;
import vo.CarVO;

public class CarUpdateProAction implements Action{
	public static int picNum;

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = null;
		boolean isModify = false;
		CarVO carvo = new CarVO();
		CarUpdateProService carupdateproservice = new CarUpdateProService();
		
		/*
		 * String 미입력시 null값, int 미입력시 0값으로 고정적으로 넣어줌.
		 */
		
		
		String carNumberParam = request.getParameter("CAR_NUMBER");
		if (carNumberParam != null && !carNumberParam.isEmpty()) {
		    carvo.setCarNumber(Integer.parseInt(carNumberParam));
		} else {
		    carvo.setCarNumber(0);
		}

		String carName = request.getParameter("CAR_NAME");
		carvo.setCarName(carName != null && !carName.isEmpty() ? carName : null);
		
		String carCompany = request.getParameter("CAR_COMPANY");
		carvo.setCarCompany(carCompany != null && !carCompany.isEmpty() ? carCompany : null);
		
		String carYearParam = request.getParameter("CAR_YEAR");
		if (carYearParam != null && !carYearParam.isEmpty()) {
		    carvo.setCarYear(Integer.parseInt(carYearParam));
		} else {
		    carvo.setCarYear(0);
		}
		String carSeaterParam = request.getParameter("CAR_SEATER");
		if (carSeaterParam != null && !carSeaterParam.isEmpty()) {
		    carvo.setCarSeater(Integer.parseInt(carSeaterParam));
		} else {
		    carvo.setCarSeater(0);
		}
		
		String carType = request.getParameter("CAR_TYPE");
		carvo.setCarType(carType != null && !carType.isEmpty() ? carType : null);
		
		
		String carInsuranceAgeParam = request.getParameter("CAR_INSURANCEAGE");
		if (carInsuranceAgeParam != null && !carInsuranceAgeParam.isEmpty()) {
		    carvo.setCarInsuranceage(Integer.parseInt(carInsuranceAgeParam));
		} else {
		    carvo.setCarInsuranceage(0);
		}
		
		String carFuel = request.getParameter("CAR_FUEL");
		carvo.setCarFuel(carFuel != null && !carFuel.isEmpty() ? carFuel : null);
		
		String carPriceParam = request.getParameter("CAR_PRICE");
		if (carPriceParam != null && !carPriceParam.isEmpty()) {
		    carvo.setCarPrice(Integer.parseInt(carPriceParam));
		} else {
		    carvo.setCarPrice(0);
		}
		
		String carStatus = request.getParameter("CAR_STATUS");
		carvo.setCarStatus(carStatus != null && !carStatus.isEmpty() ? carStatus : null);
		
		// 파일등록
		String savePath = "C:\\jspwork\\rental\\src\\main\\webapp\\upload";

		
		for (Part part : request.getParts()) {
			String fileName = extractFileName(part, request);
			if (fileName != null && !fileName.isEmpty()) {
				
				part.write(savePath + File.separator + fileName);
			}
		}
		picNum = 0;
		
		isModify = carupdateproservice.updateCar(carvo);

		if(!isModify){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패');");
			out.println("history.back()");
			out.println("</script>");
		} 
		
		
		return forward;
	}
	
	private String extractFileName(Part part, HttpServletRequest request) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        
        for (String item : items) {
            if (item.trim().startsWith("filename") && !item.trim().equals("filename=\"\"")) {
                return  request.getParameter("CAR_NUMBER") + "_" + request.getParameter("CAR_NAME")+ ++picNum + "번" + item.substring(item.length()-5, item.length() - 1);
            }
        }
        return null;
    }
}

