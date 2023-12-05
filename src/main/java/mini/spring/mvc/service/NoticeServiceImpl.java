package mini.spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
