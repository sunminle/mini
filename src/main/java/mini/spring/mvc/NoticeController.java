package mini.spring.mvc;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mini.spring.mvc.bean.NoticeDTO;
import mini.spring.mvc.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
private static final Logger Logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	private NoticeService service;
		
	@RequestMapping("board")
	public String board(Model model) {

		//���� ����Ʈ �������� ������
		List<NoticeDTO> nList = service.getNoticeList();
		model.addAttribute("nList", nList);
		
		return "notice/board";
	}
	
	
	/**
	 * @param noticeId
	 * @param model
	 * @return
	 */
	@RequestMapping("notice_view")
	public String postView(@RequestParam("noticeId") String noticeId,Model model) {

		int num = Integer.parseInt(noticeId);
		//�ش� �ѹ� �� ��������
		NoticeDTO notice = new NoticeDTO();
		notice = service.getNotice(num);
		
		model.addAttribute("notice", notice);
		
		return "notice/view";
	}
	
	@RequestMapping("posting")
	public String posting() {
		return "notice/posting";
	}
	
	/*
	@ResponseBody
	@GetMapping("delete")
	public Map<String,Object> delete(@RequestParam("noticeNum") int num,HttpSession session){
		
		System.out.println("�����Ϸ��� ���� �ѹ� : "+num);
		
		//db delete
		int row = service.deleteNotice(num);
		
		//result
		Map<String,Object> result = new HashMap<>();
		if(row>0) {
			result.put("code", 1);
			result.put("result", "����");
		}else {
			result.put("code",500);
			result.put("errorMessage", "���� ������ �����߽��ϴ�. �ڵ� �ҷ�.");
		}
		
		return result;
	}*/

}
