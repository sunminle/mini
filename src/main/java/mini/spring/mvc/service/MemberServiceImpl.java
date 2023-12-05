package mini.spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mini.spring.mvc.bean.MemberDTO;
import mini.spring.mvc.service.MemberService;
import mini.spring.mvc.repository.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public int loginCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.loginCheck(dto);
	}

	@Override
	public void userInput(MemberDTO dto) {
		// TODO Auto-generated method stub
		mapper.userInput(dto);
	}

	@Override
	public void userUpdate(MemberDTO dto) {
		// TODO Auto-generated method stub
		mapper.memberUpdate(dto);
		
	}

	@Override
	public MemberDTO getUser(String id) {
		// TODO Auto-generated method stub
		return mapper.member(id);
	}

	@Override
	public int userDelete(String id, String passwd) {
		// TODO Auto-generated method stub
		return mapper.statusChange(id, passwd);
	}

	@Override
	public int statusChange(MemberDTO dto) {
		return mapper.statusAdminChange(dto);
	}
	
	@Override
	public boolean idCheck(String id) {
		// TODO Auto-generated method stub
		 MemberDTO md = mapper.member(id);
		 
		 return md != null;
	}
}
