package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberJoinService;
import vo.ActionForward;
import vo.MemberVO;

// 멤버 리스트 조회
public class MemberJoinAction implements Action{
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
       throws Exception{
          HttpSession session = request.getSession();
          MemberVO member=new MemberVO();
            
            
            String memberEmail_1 = request.getParameter("memberEmail_1");
            String memberEmail_2 = request.getParameter("memberEmail_2");
            String memberAddress_1 = request.getParameter("memberAddress_1");
            String memberAddress_2 = request.getParameter("memberAddress_2");
            String memberAddress_3 = request.getParameter("memberAddress_3");
            String memberAddress_4 = request.getParameter("memberAddress_4");
            String memberAge = request.getParameter("memberAge");
            memberAddress_4 = memberAddress_4 == null ? "" : memberAddress_4;
            String memberEmail =  memberEmail_1+"@"+memberEmail_2;
            String memberAddress = "우편번호: " + memberAddress_1 + " 주소: "+memberAddress_2
                  + " 상세주소: " + memberAddress_3 + " 참고항목 :" + memberAddress_4;
            
            member.setMemberId(request.getParameter("memberId"));
            member.setMemberPassword(request.getParameter("memberPassword"));
            member.setMemberName(request.getParameter("memberName"));
            member.setMemberBirth(request.getParameter("memberBirth"));
            member.setMemberPhone(request.getParameter("memberPhone"));
            member.setMemberGender(request.getParameter("memberGender"));
            member.setMemberAge(Integer.parseInt(memberAge));
            member.setMemberEmail(memberEmail);
            member.setMemberAddress(memberAddress);
            
            MemberJoinService memberJoinService = new MemberJoinService();
            
            boolean joinResult = memberJoinService.joinMember(member);
            ActionForward forward = null;
            
            if(joinResult==false){
               response.setContentType("text/html;charset=UTF-8");
               PrintWriter out = response.getWriter();
               out.println("<script>");
               out.println("alert('회원등록실패')");
               out.println("location.href='index.jsp';");
               out.println("</script>");
            }else{
               response.setContentType("text/html;charset=UTF-8");
               PrintWriter out = response.getWriter();
               out.println("<script>");
               out.println("alert('회원가입에 성공하였습니다.')");
               out.println("location.href='./sub/loginhome.jsp';");
               out.println("</script>");
            }
            return forward;
   }
}