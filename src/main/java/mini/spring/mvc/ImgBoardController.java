package mini.spring.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mini.spring.mvc.bean.ImgBoardDTO;
import mini.spring.mvc.service.ImgBoardService;

@Controller
@RequestMapping("/imgboard/*")
public class ImgBoardController {
	@Autowired
	private ImgBoardService service;
	
	
	@RequestMapping("list")
	public String test(Model model) {
		List<ImgBoardDTO> list = service.list();
		model.addAttribute("list",list);
		return "imgboard/list";
	}
	
	@RequestMapping("writeForm")
	public String writeForm() {

		return "imgboard/writeForm";
	}
	
	@RequestMapping("writePro")
	public String writePro(Model model,ImgBoardDTO dto) {
		dto.setRef(service.maxNum()+1);
		service.insert(dto);
		return "imgboard/writePro";
	}
	
}
