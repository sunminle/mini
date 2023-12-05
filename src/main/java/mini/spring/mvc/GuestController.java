package mini.spring.mvc;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mini.spring.mvc.bean.GuestDTO;
import mini.spring.mvc.service.GuestService;

@Controller
@RequestMapping("/gu/*")
public class GuestController {
	@Autowired
	private GuestService service;
	
	
	
	@RequestMapping("guest")
	public String guest(Model model, 
	                    @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		System.out.println("pageNum: " + pageNum);
		List<GuestDTO> listAll = service.listAll();
	    model.addAttribute("guestList", service.listAll());
	   
	    return "guest/guest";
	}


	
	@RequestMapping("writePro")
	public String writePro(GuestDTO dto , HttpServletRequest request) {
		
		service.create(dto);
		return "redirect:/gu/guest";
	}

	
	
	@RequestMapping("updateForm")
	public String updateForm(Model model, @RequestParam int num) {
	    GuestDTO guest = service.readNum(num);
	    model.addAttribute("guest", guest);
	    return "guest/updateForm";
	}

	
	@RequestMapping("updatePro")
	public String updatePro(Model model,GuestDTO dto , Integer pageNum) {
		int check = service.updateNum(dto);
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);
		return "guest/updatePro";
	}
	
	@RequestMapping("deleteForm")
	public String deleteForm(Model model, @RequestParam int num) {
	    model.addAttribute("num", num);
	    
	    return "guest/deleteForm";
	}

	@RequestMapping("deletePro")
	public String deletePro(Model model, int num,String passwd) {
		int check = service.deleteNum(num, passwd);
		
		model.addAttribute("check",check);
		

		return "guest/deletePro";
	}
	
	
	
	
}
