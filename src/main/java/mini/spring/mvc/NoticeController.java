package mini.spring.mvc;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mini.spring.mvc.bean.NoticeDTO;
import mini.spring.mvc.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
private static final Logger Logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	private NoticeService service;
		
	@RequestMapping("board")
	public String result(Model model) {

		//공지 리스트 가져오고 보내기
		List<NoticeDTO> nList = service.getNoticeList();
		model.addAttribute("nList", nList);
		
		return "notice/board";
	}

}
