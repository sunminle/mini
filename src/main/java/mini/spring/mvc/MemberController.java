package mini.spring.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mini.spring.mvc.service.MemberService;
import mini.spring.mvc.bean.MemberDTO;

@Controller
@RequestMapping("/mem/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("main")
	public String main() {
		return "member/main";
	}
	
	@RequestMapping("signInUp")
	public String signInUp() {
		return "member/signInUp";
	}
	
	@RequestMapping("loginPro")
	public String loginPro(MemberDTO dto, Model model) {
		int status = service.loginCheck(dto);
		model.addAttribute("status", status);
		return "member/loginPro";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); //전체삭제
		//session.removeAttribute("memId"); 해당이름 삭제
		return "redirect:/mem/main";
	}
	
	@RequestMapping("modify")
	public String modify(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memId");
		MemberDTO dto = service.getUser(id);
		model.addAttribute("dto", dto);
		return "member/modify";
	}
	
	@RequestMapping("modifyForm")
	public String modifyForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memId");
		MemberDTO dto = service.getUser(id);
		model.addAttribute("dto", dto);
		return "member/modifyForm";
	}
	
	@RequestMapping("modifyPro")
	public String modifyPro(HttpSession session, MemberDTO dto, Model model) {
		String id = (String)session.getAttribute("memId");
		dto.setId(id);
		service.userUpdate(dto);
		return "member/modifyPro";
	}
	@RequestMapping("deleteForm")
	public String deleteForm() {
		return "member/deleteForm";
	}
	
	@RequestMapping("deletePro")
	public String deletePro(Model model, String passwd, HttpSession session) {
		String id = (String)session.getAttribute("memId");
		int check = service.userDelete(id, passwd);
		if(check == 1){
			session.invalidate();
		}
		model.addAttribute("check", check);
		return "member/deletePro";
	}
	
	@RequestMapping("statusChange")
	public String statusChange(MemberDTO dto) {
		service.statusChange(dto);
		return "redirect:/user/userList";
	}
	
	@RequestMapping("inputForm")
	public String inputForm(){
		return "member/inputForm";
	}
	
	@RequestMapping("inputPro")
	public String inputPro(MemberDTO dto, HttpServletRequest request) {
		service.userInput(dto);
		return "member/inputPro";
	}
	
	@RequestMapping("confirmId")
	public String confirmId(String id, Model model) {
		
	    if (service.idCheck(id)) {
	        // 아이디가 중복되는 경우
	        model.addAttribute("check", 1);
	    } else {
	        // 아이디가 중복되지 않는 경우
	        model.addAttribute("check", 0);
	    }

	    model.addAttribute("id", id);
	    
	    return "member/confirmId";
	}


}
