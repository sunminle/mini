package mini.spring.mvc.repository;

import mini.spring.mvc.bean.TestDTO;

public interface TestMapper {
	public int insert(TestDTO dto);
	public TestDTO select(String id);
}
