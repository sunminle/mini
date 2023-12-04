package mini.spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mini.spring.mvc.bean.QnaBoardDTO;
import mini.spring.mvc.repository.QnaBoardMapper;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{
	
	@Autowired
	private QnaBoardMapper mapper;

	@Override
	public int maxNum() {
		
		return mapper.maxNum();
	}

	@Override
	public void insert(QnaBoardDTO dto) {
		
		mapper.insert(dto);
		
	}

	@Override
	public List<QnaBoardDTO> list() {
		
		return mapper.list();
	}


}
