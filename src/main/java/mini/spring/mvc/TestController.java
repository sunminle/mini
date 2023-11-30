package mini.spring.mvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mini.spring.mvc.bean.TestDTO;
import mini.spring.mvc.service.TestService;

@Controller
@RequestMapping("/test/*")
public class TestController {
	
	private static final Logger Logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	private TestService service;
	
	@RequestMapping("test")
	public String test() {
		return "test/test";
	}
	
	@RequestMapping("result")
	public String result(TestDTO dto, Model model) {
		int result = service.insert(dto);
		TestDTO test = service.select(dto.getId());
		System.out.println(test.getId());
		System.out.println(test.getPasswd());
		model.addAttribute("result",result);
		model.addAttribute("test",test);
		return "test/result";
	}

}
