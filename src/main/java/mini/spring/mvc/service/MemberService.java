package mini.spring.mvc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import mini.spring.mvc.bean.MemberDTO;

public interface MemberService {
	public int loginCheck(MemberDTO dto);
	public void userInput(MemberDTO dto);
	public MemberDTO getUser(String id);
	public void userUpdate(MemberDTO dto);
	public int userDelete(String id, String passwd);
	
	public int statusChange(MemberDTO dto);
	
	boolean idCheck(String id);
	

}
