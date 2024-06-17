package action;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import svc.CarSearchService;
import vo.ActionForward;
import vo.BookVO;
import vo.CarVO;

public class CarSearchAction implements Action{
   
   public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
      ActionForward forward = null;
      CarVO carvo = new CarVO();
      JSONArray jsonArray = new JSONArray();
      BookVO bookvo = new BookVO();
      HttpSession session=request.getSession();
      CarSearchService carsearchservice = new CarSearchService();
      
      String dateString = request.getParameter("CAR_DATE");
      String[] dateParts = dateString.split(" - ");
      String bookDate = dateParts[0].trim();
      String returnDate = dateParts[1].trim();
      
      
      session.setAttribute("bookDate", bookDate);
      session.setAttribute("returnDate", returnDate);
      
      bookvo.setBookDate(bookDate);
      bookvo.setReturnDate(returnDate);
      
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
      Date book = dateFormat.parse(bookvo.getBookDate());
      Date return2 = dateFormat.parse(bookvo.getReturnDate());

      long differenceMillis = return2.getTime() - book.getTime();

      long differenceDays = differenceMillis / (1000 * 60 * 60 * 24);
      
      session.setAttribute("differenceDays", differenceDays);
      
      
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
      
      String savePath="C:\\jspwork\\rental\\src\\main\\webapp\\upload";
      
      File fileSaveDir = new File(savePath);
      File[] files = fileSaveDir.listFiles();
      
      JSONArray fileList = null;
      
      if(carNumberParam == null) {
         carNumberParam = "0";
      }
      
      if (files != null && files.length > 0) {
          fileList = new JSONArray();
          for (File file : files) {
              if (file.getName().startsWith(carNumberParam)) {
                  fileList.add(file.getName());
              }
          }
      }
      jsonArray = carsearchservice.carsearch(carvo, bookvo);

      
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
