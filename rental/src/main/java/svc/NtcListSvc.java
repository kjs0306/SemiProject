package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONArray;

import dao.NtcDAO;
import vo.NtcVo;

public class NtcListSvc {

	public int getListCount() throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		NtcDAO ntcDAO = NtcDAO.getInstance();
		ntcDAO.setConnection(con);
		listCount = ntcDAO.selectListCount();
		close(con);
		return listCount;

	}

	public JSONArray getArticleList(int page, int limit) throws Exception {

		JSONArray articleList = null;
		Connection con = getConnection();
		NtcDAO ntcDAO = NtcDAO.getInstance();
		ntcDAO.setConnection(con);
		articleList = ntcDAO.selectArticleList(page, limit);
		close(con);
		return articleList;

	}
	
	public JSONArray getArticleConditionedList(String sql) throws Exception {
		
		JSONArray articleList = null;
		Connection con = getConnection();
		NtcDAO ntcDAO = NtcDAO.getInstance();
		ntcDAO.setConnection(con);
		articleList = ntcDAO.selectConditionedArticleList(sql);
		close(con);
		return articleList;
		
	}

}
