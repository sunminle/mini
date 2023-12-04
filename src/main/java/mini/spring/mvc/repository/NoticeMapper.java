package mini.spring.mvc.repository;

import java.util.List;

import mini.spring.mvc.bean.NoticeDTO;

public interface NoticeMapper {
	
	public List<NoticeDTO> getAllList();
	public NoticeDTO getOne(int num);
}
