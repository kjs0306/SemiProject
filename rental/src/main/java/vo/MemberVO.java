package vo;                
                
public class MemberVO {                
                
        private int memberNo;     
        private String memberId;     
        private String memberPassword;       
        private String memberName;       
        private String memberBirth;
        private String memberPhone;       
        private String memberEmail;    
        private String memberGender;     
        private int memberAge;        
        private String memberAddress;     
        private String memberStatus;
        private String memberRePassword;
        
                public int getMemberNo() {
                        return memberNo;
                }
                public void setMemberNo(int memberNo) {
                        this.memberNo = memberNo;
                }
                public String getMemberId() {
                        return memberId;
                }
                public void setMemberId(String memberId) {
                        this.memberId = memberId;
                }
                public String getMemberPassword() {
                        return memberPassword;
                }
                public void setMemberPassword(String memberPassword) {
                        this.memberPassword = memberPassword;
                }
                public String getMemberName() {
                        return memberName;
                }
                public void setMemberName(String memberName) {
                        this.memberName = memberName;
                }
                public String getMemberBirth() {
                        return memberBirth;
                }
                public void setMemberBirth(String memberBirth) {
                        this.memberBirth = memberBirth;
                }
                public String getMemberPhone() {
                        return memberPhone;
                }
                public void setMemberPhone(String memberPhone) {
                        this.memberPhone = memberPhone;
                }
                public String getMemberEmail() {
                        return memberEmail;
                }
                public void setMemberEmail(String memberEmail) {
                        this.memberEmail = memberEmail;
                }
                public String getMemberGender() {
                        return memberGender;
                }
                public void setMemberGender(String memberGender) {
                        this.memberGender = memberGender;
                }
                public int getMemberAge() {
                        return memberAge;
                }
                public void setMemberAge(int memberAge) {
                        this.memberAge = memberAge;
                }
                public String getMemberAddress() {
                        return memberAddress;
                }
                public void setMemberAddress(String memberAddress) {
                        this.memberAddress = memberAddress;
                }
                public String getMemberStatus() {
                        return memberStatus;
                }
                public void setMemberStatus(String memberStatus) {
                        this.memberStatus = memberStatus;
                }
                public String getMemberRePassword() {
                        return memberRePassword;
                }
                public void setMemberRePassword(String memberRePassword) {
                        this.memberRePassword = memberRePassword;
                }
                
				@Override
				public String toString() {
					return "MemberVO [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPassword="
							+ memberPassword + ", memberName=" + memberName + ", memberBirth=" + memberBirth
							+ ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberGender="
							+ memberGender + ", memberAge=" + memberAge + ", memberAddress=" + memberAddress
							+ ", memberStatus=" + memberStatus + ", memberRePassword=" + memberRePassword + "]";
				}
        
                
}                