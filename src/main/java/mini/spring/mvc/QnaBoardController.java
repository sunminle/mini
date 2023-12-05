package mini.spring.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mini.spring.mvc.bean.QnaBoardDTO;
import mini.spring.mvc.service.QnaBoardService;

@Controller
	@RequestMapping("/*")
	public class QnaBoardController {
		@Autowired
		private QnaBoardService service;
		
		
		@RequestMapping("list") //글 목록
		public String test(Model model) {
			List<QnaBoardDTO> list = service.list();
			model.addAttribute("list",list);
			return "qnaboard/list";
		}
		
		@RequestMapping("view") //글 내용보기
		public String test2(Model model,@RequestParam("num") String num) {
			int listNum = Integer.parseInt(num);
			
			QnaBoardDTO dto = service.view(listNum);
			
			model.addAttribute("dto",dto);
			
			return "qnaboard/view";
		}
		
		@RequestMapping("writeForm")
		public String writeForm() {

			return "qnaboard/writeForm";
		}
		
		@RequestMapping("writePro")
		public String writePro(Model model,QnaBoardDTO dto) throws Exception {
			dto.setRef(service.maxNum()+1);
			service.insert(dto);
			return "qnaboard/writePro";
		}
		
		@RequestMapping("reply")
		public String reply() {

			return "qnaboard/reply";
		}
		
	}
