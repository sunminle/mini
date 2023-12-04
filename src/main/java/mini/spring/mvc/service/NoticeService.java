package mini.spring.mvc.service;

import java.util.List;

import mini.spring.mvc.bean.NoticeDTO;

public interface NoticeService {
	
	public List<NoticeDTO> getNoticeList();
	public NoticeDTO getNotice(int num);

}
