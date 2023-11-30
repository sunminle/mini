package mini.spring.mvc.service;

import java.util.List;

import mini.spring.mvc.bean.ImgBoardDTO;

public interface ImgBoardService {
	public int maxNum();
	public void insert(ImgBoardDTO dto);
	public List<ImgBoardDTO> list();
}
