package mini.spring.mvc.repository;

import java.util.List;

import mini.spring.mvc.bean.ImgBoardDTO;

public interface ImgBoardMapper {
	
	public int maxNum();
	public void insert(ImgBoardDTO dto);
	public List<ImgBoardDTO> list();

}
