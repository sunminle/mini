package mini.spring.mvc;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import mini.spring.mvc.service.NoticeService;

@RequestMapping("/notice/board/*")
@RestController
public class NoticeRestContoller {
	
	@Autowired
	private NoticeService service;
	
	/**
	 * ���� �����ϱ�
	 * @param subject
	 * @param content
	 * @param file
	 * @param session
	 * @return
	 */
	@PostMapping("create")
	public Map<String,Object> create(
			@RequestParam("title") String title,
			@RequestParam(value="content", required=false) String content,
			@RequestParam(value="file",required=false) MultipartFile file,
			HttpServletRequest request,	HttpSession session){
		
		String filePath = request.getServletContext().getRealPath("/resources/file/notice/");
		System.out.println("realPath : "+filePath);
		
		// db insert
		int rowCnt = service.addNotice(title, content, file,filePath);
		
		Map<String,Object> result = new HashMap<>();
		
		if(rowCnt > 0) {
			result.put("code", 1);
			result.put("result", "����");
		}else {
			result.put("code", 500);
			result.put("errorMessage", "������ ������� �ʾҽ��ϴ�.");
		}
		
		return result;
	}
	
	
	
	/**
	 * ���� �����ϱ�
	 * @param num
	 * @param session
	 * @return
	 */
	@DeleteMapping("delete")
	public Map<String,Object> delete(@RequestParam("noticeNum") String noticeNum){
		
		int num = Integer.parseInt(noticeNum);
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
	}

}
