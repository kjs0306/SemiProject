package action;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import svc.CarSelectProService;
import svc.MemberListService;
import vo.ActionForward;
import vo.CarVO;

public class CarSelectProAction implements Action{
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = null;
		CarVO carvo = new CarVO();
		JSONArray jsonArray = new JSONArray();
		
		CarSelectProService carselectproservice = new CarSelectProService();
		
		/*
		 * 사용자에게 입력받은 조건들을 CarVO에 담아 전달하고
		 * 결과값을 ArrayList<CarVO> 로 받아옵니다.
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
		
		
		String carLowPriceParam = request.getParameter("CAR_LOWPRICE"); // 파라미터는 스트링으로만 반환하니까
		boolean carLowPrice = "true".equalsIgnoreCase(carLowPriceParam); // 입력값이 true일때만 boolean 값을 true로 바꿔줌.
		carvo.setCarLowPrice(carLowPrice);
		
		String savePath="C:\\jspwork\\rental\\src\\main\\webapp\\upload";
		
		File fileSaveDir = new File(savePath);
		File[] files = fileSaveDir.listFiles();
		
		JSONArray fileList = null;
		
		if(carNumberParam == null) {
			carNumberParam = "0";
		}
		
		String chk = carNumberParam +"_"+ carName;
		
		if (files != null && files.length > 0) {
		    fileList = new JSONArray();
		    for (File file : files) {
		        if (file.getName().startsWith(chk)) {
		            fileList.add(file.getName());
		        }
		    }
		}
		
		jsonArray = carselectproservice.selectCar(carvo);
		
		if(jsonArray == null){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('검색실패');");
			out.println("history.back()");
			out.println("</script>");
		} else {
			response.setContentType("application/x-json; charset=utf-8");
			JSONObject responseData = new JSONObject();
			responseData.put("carList", jsonArray);
		    responseData.put("fileList", fileList);

		    response.getWriter().print(responseData);
			
		}
		
		return forward;
	}

}
