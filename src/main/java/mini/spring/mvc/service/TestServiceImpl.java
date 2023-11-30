package mini.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mini.spring.mvc.bean.TestDTO;
import mini.spring.mvc.repository.TestMapper;

@Service
public class TestServiceImpl implements TestService{
	@Autowired
	private TestMapper mapper;

	@Override
	public int insert(TestDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public TestDTO select(String id) {
		return mapper.select(id);
	}
}
