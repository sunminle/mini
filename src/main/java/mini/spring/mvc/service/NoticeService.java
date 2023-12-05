package mini.spring.mvc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import mini.spring.mvc.bean.NoticeDTO;

public interface NoticeService {
	
	public List<NoticeDTO> getNoticeList();
	public NoticeDTO getNotice(int num);
	public int deleteNotice(int num);
	public int addNotice(String title,String content,MultipartFile file,String filePath);
	public String fileUpload(MultipartFile file, String path);

}
