package mini.spring.mvc.repository;

import java.util.List;

import mini.spring.mvc.bean.QnaBoardDTO;



public interface QnaBoardMapper {

	
	public int maxNum();
	public void insert(QnaBoardDTO dto);
	public List<QnaBoardDTO> list();

}