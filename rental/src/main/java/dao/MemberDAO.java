package dao;

import static db.JdbcUtil.*;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;
import vo.MemberVO;

public class MemberDAO {
   public static MemberDAO instance;
   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   DataSource ds;
   int cnt;

   private MemberDAO() {
   }

   public static MemberDAO getInstance() {
      if (instance == null) {
         instance = new MemberDAO();
      }
      return instance;
   }

   public void setConnection(Connection con) {
      this.con = con;
   }

   public int joinMember(MemberVO member){
      String sql="INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?,?,?,?,?)";
      int insertCount=0;
      int memberNo= 0; // 변수 추기화
      String memberStatus;

      try{
         pstmt = con.prepareStatement("Select max(memberNo) from MEMBER");
         rs =pstmt.executeQuery();
         
         if(rs.next()) {   
            memberNo = rs.getInt(1);
            if(memberNo == 0) {
            memberNo = memberNo+1;
            memberStatus ="admin";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, memberNo);
            pstmt.setString(2, member.getMemberId());
            pstmt.setString(3, member.getMemberPassword());
            pstmt.setString(4, member.getMemberName());
            pstmt.setString(5, member.getMemberBirth());
            pstmt.setString(6, member.getMemberPhone());
            pstmt.setString(7, member.getMemberEmail());
            pstmt.setString(8, member.getMemberGender());
            pstmt.setInt(9, member.getMemberAge());
            pstmt.setString(10, member.getMemberAddress());
            pstmt.setString(11, memberStatus);
            
            insertCount=pstmt.executeUpdate();
            commit(con);
            }else if(memberNo > 0) {
               memberNo = rs.getInt(1)+1;
               memberStatus ="active";
               pstmt=con.prepareStatement(sql);
               pstmt.setInt(1, memberNo);
               pstmt.setString(2, member.getMemberId());
               pstmt.setString(3, member.getMemberPassword());
               pstmt.setString(4, member.getMemberName());
               pstmt.setString(5, member.getMemberBirth());
               pstmt.setString(6, member.getMemberPhone());
               pstmt.setString(7, member.getMemberEmail());
               pstmt.setString(8, member.getMemberGender());
               pstmt.setInt(9, member.getMemberAge());
               pstmt.setString(10, member.getMemberAddress());
               pstmt.setString(11, memberStatus);
               
               insertCount=pstmt.executeUpdate();
               commit(con);
            }
         }
         
      }catch(Exception ex){
         System.out.println("joinMember 에러: " + ex);         
      }finally{
    	 close(rs);
         close(pstmt);
      }
      
      return insertCount;
      }
   

   public boolean checkAdmin(MemberVO member) {
      if (member.getMemberStatus().equals("admin")) {
         return true;
      }
      return false;

   }

   public String searchId(MemberVO member) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "Select memberId From member where 1=1";
      String id = null;

      if (!member.getMemberPhone().equals("")) {
         sql = sql + "memberPhone ='" + member.getMemberPhone() + "'";

      } else if (member.getMemberEmail().equals("")) {
         sql = sql + "memberEmail ='" + member.getMemberEmail() + "'";
      } else {

      }
      return id;
   }

   // 아이디 중복 체크
   public boolean checkSameId(MemberVO member) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String idSQL = "Select memberId From member";
      ArrayList<String> idList = new ArrayList<String>();
      String id = member.getMemberId();

      try {
         pstmt = con.prepareStatement(idSQL);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            idList.add(rs.getString(1));
         }
      } catch (Exception ex) {
         System.out.println("getDetailMember 에러: " + ex);
      } finally {
         close(pstmt);
         close(rs);
      }
      if (idList.contains(id)) {
         return true; 
      }
      return false; 
   }

   // 조건 조회
   public String listtMemberCondition(String id, String status) {
      String sql = "SELECT * FROM MEMBER where 1=1";

      if ((id != null) && (status != null)) {
         sql += "memberID = '" + id + " memberStatus " + status + "'";
      } else if (status != null) {
         sql += " memberStatus " + status + "'";
      }
      return sql;
   }

   // 리스트 조회
   public ArrayList<HashMap<String, Object>> listMember(String sql) {

      ArrayList<HashMap<String, Object>> memberList = new ArrayList<HashMap<String, Object>>();
      MemberVO member = null;
      try {
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         while (rs.next()) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("MemberNo",rs.getInt("MemberNo"));
            map.put("MemberId",rs.getString("MemberId"));
            map.put("MemberPassword",rs.getString("MemberPassword"));
            map.put("MemberName",rs.getString("MemberName"));
            map.put("MemberBirth",rs.getString("MemberBirth"));
            map.put("MemberPhone",rs.getString("MemberPhone"));
            map.put("MemberEmail",rs.getString("MemberEmail"));
            map.put("MemberGender",rs.getString("MemberGender"));
            map.put("MemberAge",rs.getInt("MemberAge"));
            map.put("MemberAddress",rs.getString("MemberAddress"));
            map.put("MemberStatus",rs.getString("MemberStatus"));
            memberList.add(map);
         }
      } catch (Exception ex) {
         System.out.println("getDetailMember 에러: " + ex);
      } finally {
         close(rs);
         close(pstmt);
      }
      return memberList;
   }

   
      // 로그인
      public String selectLoginId(MemberVO member) {
         String loginId = null;
         String sql = "SELECT * FROM MEMBER WHERE MEMBERID=? AND MEMBERPASSWORD=?";
         String status = null;
         String name = null;
         
         try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member.getMemberId());
            pstmt.setString(2, member.getMemberPassword());
            rs = pstmt.executeQuery();

            if (rs.next()) {
               status = rs.getString("MEMBERSTATUS");
               name = rs.getString("memberName");
               if (status.equals("active")) {
                  loginId = rs.getString("MEMBERID");
                  String phone = rs.getString("memberPhone");
                  member.setMemberPhone(phone);
                  member.setMemberStatus(status);
                  member.setMemberName(name);
               }else if(status.equals("admin")) {
                  loginId = rs.getString("MEMBERID");
                  member.setMemberStatus(status);
                  member.setMemberName(name);
               }else if(status.equals("inactive")) {
                  return null;
               }
            }
         } catch (Exception ex) {
            System.out.println(" 에러: " + ex);
         } finally {
            close(rs);
            close(pstmt);
         }

         return loginId;
      }
   //  회원찾기(비밀번호 재설정 시 일치하는 회원 찾기)
   public int findMember(MemberVO member) {
      String id = member.getMemberId();
      String email = member.getMemberEmail();
      ResultSet rs=null;
      int cnt = 0;
      try {

         String sql = "select * from member where memberId=? and memberEmail=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, id);
         pstmt.setString(2, email);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            String status = rs.getString("memberStatus");
               if(status.equals("active")) {
                  cnt = 1;
               }else if(status.equals("inactive")) {
                  cnt = 0;
               }
         }else {
            cnt = 0;
         }
         
      } catch (Exception ex) {
         System.out.println(" 에러: " + ex);
      } finally {
         close(rs);
         close(pstmt);
      }
      return cnt;
   }
   
   // 비회원 상태에서 비밀번호 재설정하기
   public int resetPass(MemberVO member) {
      int cnt = 0;
      
      try {
         
         String sql = "update member set memberPassword = ? where memberId = ? and memberEmail = ?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, member.getMemberRePassword());
         pstmt.setString(2, member.getMemberId());
         pstmt.setString(3, member.getMemberEmail());
         
         cnt = pstmt.executeUpdate();
         if(cnt > 0) {
            cnt = 1;
         }else {
            cnt = 0;
         }
      }catch(Exception e){
         e.printStackTrace();
         System.out.println("비회원 비밀번호 재설정 오류");
      }finally {
    	  close(pstmt);
      }
      return cnt;
   }
   
   // 회원정보 수정 전 정보 조회
    public String Update(MemberVO member) {
         
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         String str = null;
         con = getConnection();
         String id = member.getMemberId();  
         String password = member.getMemberPassword(); 
         
         try {
         String sql = "select * from member where memberId=? and memberpassword=? ";
         pstmt= con.prepareStatement(sql);
         pstmt.setString(1, id );
         pstmt.setString(2, password);
         rs = pstmt.executeQuery();
         
         
         if(rs.next()) {
            str = rs.getString("memberId");
            member.setMemberNo(rs.getInt("MEMBERNO"));
            member.setMemberId(rs.getString("MEMBERID"));
            member.setMemberPassword(rs.getString("MEMBERPASSWORD"));
            member.setMemberName(rs.getString("MEMBERNAME"));
            member.setMemberBirth(rs.getString("MEMBERBIRTH"));
            member.setMemberPhone(rs.getString("MEMBERPHONE"));
            member.setMemberEmail(rs.getString("MEMBEREMAIL"));
            member.setMemberGender(rs.getString("MEMBERGENDER"));
            member.setMemberAge(rs.getInt("MEMBERAGE"));
            member.setMemberAddress(rs.getString("MEMBERADDRESS"));
         }
         
         }catch(Exception e) {
            e.printStackTrace();
         }finally{
        	 close(rs);
        	 close(pstmt);
        	 
         }
         return str;
      }
      
      //회원 정보 수정
      public int ReUpdate(MemberVO member) {
         try {
            String sql = "update member set MEMBERNAME=?, MemberEmail=?, MemberPhone=?, MemberAddress=?, MemberBirth=?,MemberPassword=?  where memberid= ?";
            pstmt= con.prepareStatement(sql);
            pstmt.setString(1, member.getMemberName());
            pstmt.setString(2, member.getMemberEmail());
            pstmt.setString(3, member.getMemberPhone());
            pstmt.setString(4, member.getMemberAddress());
            pstmt.setString(5, member.getMemberBirth());
            pstmt.setString(6, member.getMemberPassword());
            pstmt.setString(7, member.getMemberId());
            
            cnt = pstmt.executeUpdate();
            
            if(cnt > 0) {
               return cnt;
            }
            }catch(Exception e) {
               e.printStackTrace();
            }finally{
               close(pstmt);
            }
         return cnt;
      }
      // 마이페이지에서 회원정보 수정
      public int UpdateMyinfo(MemberVO member) {
         try {
            
            String sql = "update member set MemberEmail=?, MemberPhone=?, MemberAddress=? where memberid= ?";
            pstmt= con.prepareStatement(sql);
            pstmt.setString(1, member.getMemberEmail());
            pstmt.setString(2, member.getMemberPhone());
            pstmt.setString(3, member.getMemberAddress());
            pstmt.setString(4, member.getMemberId());
            
            cnt = pstmt.executeUpdate();
            
            if(cnt > 0) {
               return cnt;
            }
         }catch(Exception e) {
            e.printStackTrace();
         }finally{
            close(pstmt);
         }
         return cnt;
      }
      
      // 관리자페이지에서 수정
      public int UpdateAdmin(String sql) {
         try {
            pstmt= con.prepareStatement(sql);
            cnt = pstmt.executeUpdate();
         }catch(Exception e) {
            e.printStackTrace();
         }finally{
            close(pstmt);
         }
         return cnt;
      }
   
// 아이디 찾기
public int findId(MemberVO member) {
        String sql = "select * from member Where memberName=? and memberEmail=?";
        String status = null;
        int cnt = 0;
        try {
           
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, member.getMemberName());
         pstmt.setString(2, member.getMemberEmail());
         rs = pstmt.executeQuery();
         if(rs.next()) {
            status = rs.getString("memberStatus");
            
            if(status.equals("active")) {
               String id = rs.getString("memberId");
               member.setMemberId(id);
               cnt = 1;
            }else if(status.equals("inactive")) {
               cnt = 0;
            }
         }
         
        }catch(Exception e) {
           e.printStackTrace();
           System.out.println("에러 발생");
        }finally{
               close(rs);
               close(pstmt);
        }
        return cnt;
     }
     
   // 로그인 상태에서 비밀번호 재설정
     public int RepassUpdate(MemberVO member) {
        String sql = "update member set memberPassword =? where memberId=? and memberPassword=?";
        int cnt = 0;
        try {
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, member.getMemberRePassword());
           pstmt.setString(2, member.getMemberId());
           pstmt.setString(3, member.getMemberPassword());
           
           cnt = pstmt.executeUpdate();
           if(cnt > 0) {
              cnt = 1;
           }
        }catch(Exception e) {
           e.printStackTrace();
           System.out.println("비밀번호변경 에러");
        }finally {
        	close(pstmt);
        }
        return cnt;
     }
     
     
     
     public int memberOut(MemberVO member) {
         int cnt = 0;
         String sql = "update member set memberStatus ='inactive' where memberId = ?";
         
         try{
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, member.getMemberId());
         
         cnt = pstmt.executeUpdate();
         
         if(cnt > 0) {
            cnt = 1;
         }
         
         } catch(Exception e) {
            e.printStackTrace();
         } finally {
            close(pstmt);
         }
         return cnt;
      }
     
}