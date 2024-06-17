package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import svc.MyBookService;
import vo.ActionForward;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MyBookAction implements Action {

    @SuppressWarnings("unchecked")
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String Id = request.getParameter("Id");

        MyBookService myBookService = new MyBookService();
        ArrayList<HashMap<String, Object>> myBooks = myBookService.getMyBooks(Id);

        JSONArray jsonArray = new JSONArray();
        for (HashMap<String, Object> book : myBooks) {
            JSONObject jsonBook = new JSONObject();
            for (Map.Entry<String, Object> entry : book.entrySet()) {
                jsonBook.put(entry.getKey(), entry.getValue());
            }
            jsonArray.add(jsonBook);
        }

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("MyBooks", jsonArray);

        response.setContentType("application/json; charset=utf-8");
        response.getWriter().print(jsonResponse);

        return null;
    }
}