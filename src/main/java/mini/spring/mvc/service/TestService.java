package mini.spring.mvc.service;

import mini.spring.mvc.bean.TestDTO;

public interface TestService {
	public int insert(TestDTO dto);
	public TestDTO select(String id);
}
