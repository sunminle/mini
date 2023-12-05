package mini.spring.mvc.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import mini.spring.mvc.bean.NoticeDTO;
import mini.spring.mvc.repository.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	public List<NoticeDTO> getNoticeList() {
		return mapper.getAllList();
	}

	@Override
	public NoticeDTO getNotice(int num) {
		return mapper.getOne(num);
	}

	@Override
	public int deleteNotice(int num) {
		return mapper.deleteNotice(num);
	}
	
	//포스팅 메소드
	@Override
	public int addNotice(String title, String content, MultipartFile file,String filePath) {
		
		String fileName = null;
		if(file != null) {
			fileName = fileUpload(file,filePath);
		}else {
			fileName = null;
		}
		
		return mapper.addNotice(title, content,fileName);
	}
	
	//파일 업로드 메소드
	@Override
	public String fileUpload(MultipartFile file, String path) {
		String fileName = file.getOriginalFilename();
		
		File copy = new File(path+fileName);
		
		try {
			file.transferTo(copy);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("파일업로드 : "+path+fileName);
		
		return fileName;
	}
	

}
