package mini.spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mini.spring.mvc.bean.ImgBoardDTO;
import mini.spring.mvc.repository.ImgBoardMapper;

@Service
public class ImgBoardServiceImpl implements ImgBoardService{
	@Autowired
	private ImgBoardMapper mapper;

	@Override
	public int maxNum() {
		
		return mapper.maxNum();
	}

	@Override
	public void insert(ImgBoardDTO dto) {
		
		mapper.insert(dto);
		
	}

	@Override
	public List<ImgBoardDTO> list() {
		
		return mapper.list();
	}


}
