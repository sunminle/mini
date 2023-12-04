package mini.spring.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mini.spring.mvc.bean.QnaBoardDTO;
import mini.spring.mvc.service.QnaBoardService;

@Controller
	@RequestMapping("/qnaboard/*")
	public class QnaBoardController {
		@Autowired
		private QnaBoardService service;
		
		
		@RequestMapping("list")
		public String test(Model model) {
			List<QnaBoardDTO> list = service.list();
			model.addAttribute("list",list);
			return "qnaboard/list";
		}
		
		@RequestMapping("writeForm")
		public String writeForm() {

			return "qnaboard/writeForm";
		}
		
		@RequestMapping("writePro")
		public String writePro(Model model,QnaBoardDTO dto) {
			dto.setRef(service.maxNum()+1);
			service.insert(dto);
			return "qnaboard/writePro";
		}
		
	}
