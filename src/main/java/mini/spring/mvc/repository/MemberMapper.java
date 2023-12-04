package mini.spring.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import mini.spring.mvc.bean.MemberDTO;

public interface MemberMapper {
	public int loginCheck(MemberDTO dto);
	public MemberDTO member(String id);
	public void memberUpdate(MemberDTO dto);
	public int statusChange(@Param("id") String id, @Param("passwd") String passwd);
	
	public int statusAdminChange(MemberDTO dto);
	
	public void userInput(MemberDTO dto);

}
