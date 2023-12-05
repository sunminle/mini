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
	public void insert(QnaBoardDTO dto) {
		
		mapper.insert(dto);
		
	}

	@Override
	public List<QnaBoardDTO> list() {
		
		return mapper.list();
	}

	@Override
	public int maxNum() {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public QnaBoardDTO view(int num) {
		return mapper.view(num);
	}


}
