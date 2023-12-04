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
	
	@RequestMapping("list")
	public String list(Model model , @RequestParam(value="pageNum" , defaultValue="1") int pageNum) {
		service.list(pageNum, model);
		return "guest/list";
			}
	
	@RequestMapping("guest")
	public String guest(Model model, 
	                    @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
	    // 모든 게시글을 가져오기
		List<GuestDTO> listAll = service.listAll();
	    model.addAttribute("guestList", service.listAll());
	    service.list(pageNum, model);
	    return "guest/guest";
	}


	
	@RequestMapping("writePro")
	public String writePro(GuestDTO dto , HttpServletRequest request) {
		
		service.create(dto);
		return "redirect:/gu/guest";
	}

	@RequestMapping("content")
	public String content(Model model, int num, int pageNum) {
		GuestDTO article = service.readContent(num);
		
		model.addAttribute("article",article);
		model.addAttribute("pageNum",pageNum);
		
		return "guest/content";
	}
	
	@RequestMapping("updateForm")
	public String updateForm(Model model, int num, int pageNum) {
		
		GuestDTO article = service.update(num);
		
		model.addAttribute("article",article);
		model.addAttribute("pageNum",pageNum);
		
		return "guest/updateForm";
	}
	
	@RequestMapping("updatePro")
	public String updatePro(Model model,GuestDTO dto , int pageNum) {
		int check = service.updateNum(dto);
		
		model.addAttribute("check", check);
		model.addAttribute("pageNum", pageNum);

		return "guest/updatePro";
	}
	
	@RequestMapping("deleteForm")
	public String deleteForm(Model model, @RequestParam int num, @RequestParam int pageNum) {
	    model.addAttribute("num", num);
	    model.addAttribute("pageNum", pageNum);
	    return "guest/deleteForm";
	}

	@RequestMapping("deletePro")
	public String deletePro(Model model, int num,String passwd, int pageNum) {
		int check = service.deleteNum(num, passwd);
		
		model.addAttribute("check",check);
		model.addAttribute("pageNum",pageNum);

		return "guest/deletePro";
	}
	
	
	
	@RequestMapping("/listAll")
    public String listAll(Model model) {
        // guestService를 통해 listAll 메서드 호출
        model.addAttribute("guestList", service.listAll());
        return "guest/guest";
    }

}
