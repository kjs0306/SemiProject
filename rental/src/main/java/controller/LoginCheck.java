package controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import static db.JdbcUtil.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDAO;
import vo.MemberVO;


@WebServlet("/sub/loginsameCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String str="";
		if(id.equals("")){
			str = "아이디를 입력해주세요.";
			}
		
		MemberVO member = new MemberVO();
		member.setMemberId(id);
	
		MemberDAO mDAO = MemberDAO.getInstance();
		Connection con = getConnection();
		mDAO.setConnection(con);
		boolean result = mDAO.checkSameId(member);
		

		if(!id.equals("")){
			if (result)
				str = "이미 사용중인 아이디입니다.";
			else 
				str = "사용 가능한 아이디입니다.";
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("str", str);
		map.put("id", id);
		JSONObject jObject = new JSONObject();
		jObject.put("map", map);

		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(jObject);
		
	}

}
